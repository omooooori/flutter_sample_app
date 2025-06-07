import 'package:drift/drift.dart';
import 'package:layerx_technical_problem/data/database/app_database.dart';
import 'package:layerx_technical_problem/data/database/master_type_table.dart';

part 'master_type_dao.g.dart';

@DriftAccessor(tables: [MasterTypeTable])
class MasterTypeDao extends DatabaseAccessor<AppDatabase>
    with _$MasterTypeDaoMixin {
  MasterTypeDao(super.db);

  Future<void> insertAll(List<MasterTypeTableCompanion> entries) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(masterTypeTable, entries);
    });
  }

  Future<List<MasterTypeTableData>> getAll() => select(masterTypeTable).get();

  Future<void> clear() => delete(masterTypeTable).go();
}
