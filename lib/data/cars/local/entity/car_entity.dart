import 'package:drift/drift.dart';
import 'package:iteo_libraries_example/data/database/drift_local_database.db.dart';

class CarEntity extends Table with TimestampedTable {
  TextColumn get id => text()();
  TextColumn get brand => text()();
  TextColumn get model => text()();
  TextColumn get registration => text()();
  TextColumn get color => text().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
