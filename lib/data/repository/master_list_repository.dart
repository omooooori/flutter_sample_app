import 'package:drift/drift.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/data/database/app_database.dart';
import 'package:layerx_technical_problem/data/database/dao/master_dao.dart';
import 'package:layerx_technical_problem/data/graphql_client/graphql_provider.dart';
import 'package:layerx_technical_problem/data/graphql_client/query/master_api.graphql.dart';
import 'package:layerx_technical_problem/data/repository/master_type_repository.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';
import 'package:layerx_technical_problem/domain/models/master_type.dart';

abstract class MasterListRepository {
  Future<List<Master>> fetchAllMasters();
  Future<void> saveMasters(List<Master> masters);
  Future<List<Master>> getMastersByType(String typeId);
  Future<void> clear();
}

final masterListRepositoryProvider = Provider<MasterListRepository>((ref) {
  final client = ref.read(graphQLClientProvider);
  final db = ref.watch(appDatabaseProvider);
  final dao = db.masterDao;
  final masterTypeRepository = ref.read(masterTypeRepositoryProvider);

  return MasterListRepositoryImpl(client, dao, masterTypeRepository);
});

class MasterListRepositoryImpl implements MasterListRepository {
  MasterListRepositoryImpl(
    this._client,
    this._masterDao,
    this._masterTypeRepository,
  );

  final GraphQLClient _client;
  final MasterDao _masterDao;
  final MasterTypeRepository _masterTypeRepository;

  @override
  Future<List<Master>> fetchAllMasters() async {
    final result = await _client.query(
      QueryOptions(
        document: documentNodeQueryFetchAllMasters,
        operationName: "FetchAllMasters",
      ),
    );

    final data = result.data;
    if (data == null) {
      throw Exception('マスタ取得失敗');
    }

    final parsed = Query$FetchAllMasters.fromJson(data);
    final List<Master> masters = [];
    for (final e in parsed.master_list) {
      final type = await _masterTypeRepository.getById(e.masterTypeId);
      if (type != null) {
        masters.add(
          Master(
            id: e.id,
            name: e.masterName,
            kana: e.masterNameKana,
            type: type,
            score: 0,
            lastUsedAt: null,
            useCount: 0,
          ),
        );
      }
    }

    return masters;
  }

  @override
  Future<void> saveMasters(List<Master> masters) async {
    final companions = masters
        .map(
          (m) => MasterTableCompanion.insert(
            id: m.id,
            name: m.name,
            kana: m.kana,
            type: m.type.id,
            lastUsedAt: m.lastUsedAt == null
                ? const Value.absent()
                : Value(m.lastUsedAt!),
            useCount: Value(m.useCount),
          ),
        )
        .toList();

    await _masterDao.insertAll(companions);
  }

  @override
  Future<List<Master>> getMastersByType(String typeId) async {
    final rows = await _masterDao.queryByType(typeId);
    return rows.map((row) {
      return Master(
        id: row.id,
        name: row.name,
        kana: row.kana,
        type: MasterType(id: row.type, label: ''),
        score: 0,
        lastUsedAt: row.lastUsedAt,
        useCount: row.useCount,
      );
    }).toList();
  }

  @override
  Future<void> clear() => _masterDao.clear();
}
