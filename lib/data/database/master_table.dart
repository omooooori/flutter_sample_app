import 'package:drift/drift.dart';

@DataClassName('MasterTableData')
class MasterTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get kana => text()();
  TextColumn get type => text()();
  IntColumn get useCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastUsedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('MasterHistoryTableData')
class MasterHistoryTable extends Table {
  TextColumn get masterId => text()();
  DateTimeColumn get usedAt => dateTime().withDefault(currentDateAndTime)();
  IntColumn get useCount => integer().withDefault(const Constant(1))();

  @override
  Set<Column> get primaryKey => {masterId, usedAt};
}
