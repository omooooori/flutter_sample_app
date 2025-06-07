import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/data/database/dao/master_dao.dart';
import 'package:layerx_technical_problem/data/database/dao/master_type_dao.dart';
import 'package:layerx_technical_problem/data/database/master_table.dart';
import 'package:layerx_technical_problem/data/database/master_type_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

@DriftDatabase(
  tables: [MasterTable, MasterTypeTable, MasterHistoryTable],
  daos: [MasterDao, MasterTypeDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'layerx.sqlite');
    return NativeDatabase(File(path));
  });
}
