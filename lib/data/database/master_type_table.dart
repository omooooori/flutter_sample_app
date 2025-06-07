import 'package:drift/drift.dart';

class MasterTypeTable extends Table {
  TextColumn get id => text()();
  TextColumn get label => text()();

  @override
  Set<Column> get primaryKey => {id};
}
