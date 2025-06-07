import 'package:collection/collection.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/common/utils/logger.dart';
import 'package:layerx_technical_problem/data/database/app_database.dart';
import 'package:layerx_technical_problem/data/database/dao/master_type_dao.dart';
import 'package:layerx_technical_problem/data/graphql_client/graphql_provider.dart';
import 'package:layerx_technical_problem/data/graphql_client/query/master_api.graphql.dart';
import 'package:layerx_technical_problem/domain/models/master_type.dart';

abstract class MasterTypeRepository {
  Future<List<MasterType>> fetchAvailableMasterTypes();
  Future<List<MasterType>> getMasterTypesFromDB();
  Future<void> saveMasterTypes(List<MasterType> masterTypes);
  Future<MasterType?> getById(String id);
}

final masterTypeRepositoryProvider = Provider<MasterTypeRepository>((ref) {
  final dao = ref.watch(appDatabaseProvider).masterTypeDao;
  final client = ref.watch(graphQLClientProvider);
  return MasterTypeRepositoryImpl(dao, client);
});

final availableMasterTypesProvider = FutureProvider<List<MasterType>>((ref) {
  final repository = ref.watch(masterTypeRepositoryProvider);
  return repository.getMasterTypesFromDB();
});

class MasterTypeRepositoryImpl implements MasterTypeRepository {
  final MasterTypeDao _dao;
  final GraphQLClient _client;

  MasterTypeRepositoryImpl(this._dao, this._client);

  @override
  Future<List<MasterType>> fetchAvailableMasterTypes() async {
    AppLogger.info('GraphQLからマスタタイプの取得を開始します');
    try {
      final result = await _client.query(
        QueryOptions(
          document: documentNodeQueryFetchMasterTypes,
          operationName: "FetchMasterTypes",
        ),
      );

      final data = result.data;
      if (data == null) {
        throw Exception('master_type_listの取得に失敗しました');
      }

      final parsed = Query$FetchMasterTypes.fromJson(data);

      final masterTypes = parsed.master_type_list
          .map((e) => MasterType(id: e.id, label: e.label))
          .toList();

      AppLogger.info('GraphQLからの取得完了: ${masterTypes.length}件');
      return masterTypes;
    } catch (e, stackTrace) {
      AppLogger.error('GraphQLからのマスタタイプ取得に失敗しました', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<MasterType>> getMasterTypesFromDB() async {
    AppLogger.info('DBからマスタタイプの取得を開始します');
    try {
      final rows = await _dao.getAll();
      final result =
          rows.map((row) => MasterType(id: row.id, label: row.label)).toList();
      AppLogger.info('DBからの取得完了: ${result.length}件');
      return result;
    } catch (e, stackTrace) {
      AppLogger.error('DBからのマスタタイプ取得に失敗しました', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> saveMasterTypes(List<MasterType> masterTypes) async {
    AppLogger.info('マスタタイプの保存を開始します: ${masterTypes.length}件');
    try {
      final entries = masterTypes
          .map(
            (type) => MasterTypeTableCompanion.insert(
              id: type.id,
              label: type.label,
            ),
          )
          .toList();
      await _dao.insertAll(entries);
      AppLogger.info('マスタタイプの保存完了');
    } catch (e, stackTrace) {
      AppLogger.error('マスタタイプの保存に失敗しました', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<MasterType?> getById(String id) async {
    final all = await getMasterTypesFromDB();
    return all.firstWhereOrNull((t) => t.id == id);
  }
}
