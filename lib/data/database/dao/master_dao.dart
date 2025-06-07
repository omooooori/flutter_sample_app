import 'package:drift/drift.dart';
import 'package:layerx_technical_problem/data/database/app_database.dart';
import 'package:layerx_technical_problem/data/database/master_table.dart';

part 'master_dao.g.dart';

@DriftAccessor(tables: [MasterTable, MasterHistoryTable])
class MasterDao extends DatabaseAccessor<AppDatabase> with _$MasterDaoMixin {
  MasterDao(super.db);

  /// INSERT or REPLACE 複数件
  Future<void> insertAll(List<MasterTableCompanion> entries) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(masterTable, entries);
    });
  }

  /// typeIdで絞って取得（使用回数・最終使用日時でソート）
  Future<List<MasterTableData>> queryByType(String typeId) {
    return (select(masterTable)
          ..where((tbl) => tbl.type.equals(typeId))
          ..orderBy([
            (t) => OrderingTerm.desc(t.useCount),
            (t) => OrderingTerm.desc(t.lastUsedAt),
          ]))
        .get();
  }

  /// 1件取得
  Future<MasterTableData?> getById(String id) {
    return (select(masterTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// 使用回数 +1 ＆最終使用日時更新
  Future<void> incrementUseCount(String id) async {
    await customUpdate(
      '''
    UPDATE master_table
    SET use_count = use_count + 1,
        last_used_at = ?
    WHERE id = ?
    ''',
      variables: [
        Variable.withDateTime(DateTime.now()),
        Variable.withString(id),
      ],
      updates: {masterTable},
    );
  }

  /// 使用履歴を追加
  Future<void> addToHistory(String masterId) async {
    final now = DateTime.now();

    // 同じマスタの最新の履歴を取得
    final existingHistory = await (select(masterHistoryTable)
          ..where((t) => t.masterId.equals(masterId))
          ..orderBy([(t) => OrderingTerm.desc(t.usedAt)])
          ..limit(1))
        .getSingleOrNull();

    if (existingHistory != null) {
      // 既存の履歴がある場合は、useCountをインクリメント
      await (update(masterHistoryTable)
            ..where((t) =>
                t.masterId.equals(masterId) &
                t.usedAt.equals(existingHistory.usedAt)))
          .write(MasterHistoryTableCompanion(
        useCount: Value(existingHistory.useCount + 1),
      ));
    } else {
      // 新しい履歴を追加
      await into(masterHistoryTable).insert(
        MasterHistoryTableCompanion.insert(
          masterId: masterId,
          usedAt: Value(now),
          useCount: const Value(1),
        ),
      );
    }
  }

  /// 直近の使用履歴を取得（最大10件）
  Future<List<MasterTableData>> getRecentMasters() async {
    final recentHistory = await (select(masterHistoryTable)
          ..orderBy([
            (t) => OrderingTerm.desc(t.useCount),
            (t) => OrderingTerm.desc(t.usedAt),
          ])
          ..limit(10))
        .get();

    if (recentHistory.isEmpty) return [];

    final masterIds = recentHistory.map((h) => h.masterId).toSet().toList();
    return (select(masterTable)
          ..where((t) => t.id.isIn(masterIds))
          ..orderBy([
            (t) => OrderingTerm.desc(t.useCount),
            (t) => OrderingTerm.desc(t.lastUsedAt),
          ]))
        .get();
  }

  /// 検索クエリ（マスタ名の部分一致＋typeIdでの絞り込み）
  Future<List<MasterTableData>> searchMasters({
    required String query,
    required List<String>? masterTypeIds,
    required int offset,
    required int limit,
  }) {
    final lowerQuery = query.toLowerCase();
    final queryBuilder = select(masterTable)
      ..where(
        (tbl) =>
            // 完全一致
            tbl.name.equals(lowerQuery) |
            tbl.kana.equals(lowerQuery) |
            // 前方一致
            tbl.name.lower().like('$lowerQuery%') |
            tbl.kana.lower().like('$lowerQuery%') |
            // 部分一致
            tbl.name.lower().like('%$lowerQuery%') |
            tbl.kana.lower().like('%$lowerQuery%'),
      );

    if (masterTypeIds != null && masterTypeIds.isNotEmpty) {
      queryBuilder.where((tbl) => tbl.type.isIn(masterTypeIds));
    }

    queryBuilder
      ..orderBy([
            (t) => OrderingTerm.desc(t.useCount),
            (t) => OrderingTerm.desc(t.lastUsedAt),
      ])
      ..limit(limit, offset: offset);

    return queryBuilder.get();
  }

  /// 全削除
  Future<void> clear() => delete(masterTable).go();
}
