import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/common/utils/logger.dart';
import 'package:layerx_technical_problem/data/database/app_database.dart';
import 'package:layerx_technical_problem/data/repository/master_type_repository.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';
import 'package:layerx_technical_problem/domain/models/master_type.dart';

abstract class MasterSearchRepository {
  Future<List<Master>> search({
    required String query,
    required List<String>? masterTypeIds,
    int offset = 0,
    int limit = 50,
  });

  Future<List<Master>> getRecentMasters();

  Future<void> addToHistory(Master master);
}

final masterSearchRepositoryProvider = FutureProvider<MasterSearchRepository>((
  ref,
) async {
  final db = ref.watch(appDatabaseProvider);
  final availableTypes = await ref.watch(availableMasterTypesProvider.future);

  return MasterSearchRepositoryImpl(db: db, availableTypes: availableTypes);
});

class MasterSearchRepositoryImpl implements MasterSearchRepository {
  final AppDatabase db;
  final List<MasterType> availableTypes;

  MasterSearchRepositoryImpl({required this.db, required this.availableTypes});

  @override
  Future<List<Master>> search({
    required String query,
    required List<String>? masterTypeIds,
    int offset = 0,
    int limit = 50,
  }) async {
    AppLogger.info(
      'ローカルDBでマスタ検索開始: query=$query, masterTypeIds=$masterTypeIds',
    );

    final dao = db.masterDao;
    final lowerQuery = query.toLowerCase();

    // DB検索
    final entities = await dao.searchMasters(
      query: lowerQuery,
      masterTypeIds: masterTypeIds,
      offset: offset,
      limit: limit,
    );

    // Entityからドメインモデルに変換
    return entities.map((e) {
      final type = availableTypes.firstWhere(
        (t) => t.id == e.type,
        orElse: () => MasterType(id: e.type, label: '不明'),
      );
      return Master(
        id: e.id,
        name: e.name,
        kana: e.kana,
        type: type,
        score: 0,
        useCount: e.useCount,
        lastUsedAt: e.lastUsedAt,
      );
    }).toList();
  }

  @override
  Future<List<Master>> getRecentMasters() async {
    AppLogger.info('直近使用したマスタを取得');

    final dao = db.masterDao;
    final entities = await dao.getRecentMasters();

    return entities.map((e) {
      final type = availableTypes.firstWhere(
        (t) => t.id == e.type,
        orElse: () => MasterType(id: e.type, label: '不明'),
      );
      return Master(
        id: e.id,
        name: e.name,
        kana: e.kana,
        type: type,
        score: 0,
        useCount: e.useCount,
        lastUsedAt: e.lastUsedAt,
      );
    }).toList();
  }

  @override
  Future<void> addToHistory(Master master) async {
    AppLogger.info('マスタの使用履歴を追加: ${master.id}');
    await db.masterDao.addToHistory(master.id);
  }
}
