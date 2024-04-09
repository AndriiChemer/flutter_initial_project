import 'dart:async';

import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/data/cars/local/entity/car_entity.dart';

part 'drift_local_database.db.g.dart';

abstract mixin class TimestampedTable implements Table {
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
}

@DriftDatabase(
  tables: [
    CarEntity,
  ]
)
class DriftLocalDatabase extends _$DriftLocalDatabase with Disposable {
  DriftLocalDatabase(super.e);

  @override
  int get schemaVersion => 1;

  Iterable<TableInfo<TimestampedTable, Object?>> get timestampedTables {
    return allTables.whereType<TableInfo<TimestampedTable, Object?>>();
  }

  @override
  FutureOr onDispose() async {
    await super.close();
  }
}
