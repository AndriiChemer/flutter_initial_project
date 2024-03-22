import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/core/logger/logger.dart';
import 'package:iteo_libraries_example/data/cars/local/entity/car_entity.dart';
import 'package:iteo_libraries_example/domain/security/security_repository.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'package:sqlite3/open.dart';

part 'drift_local_database.db.g.dart';

const _databaseName = 'drift_database.sqlite';

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

Future<DriftLocalDatabase> getDriftDatabase(SecurityRepository securityRepository) async {
  await _setupSqlCipher();

  final maybePassword = await securityRepository.getDatabasePassword();
  final password = maybePassword ?? await _generateAndSaveDatabasePassword(securityRepository);

  if (password == null) {
    Logger.d('Could not generate secure database password. Database in not secured');
    return DriftLocalDatabase(NativeDatabase.memory());
  }

  final database = DriftLocalDatabase(LazyDatabase(() => _getNativeDatabase(password: password)));

  try {
    await database.customSelect('select count(*) from sqlite_master').getSingleOrNull();
    Logger.d('Database opened.');
    return database;
  } catch(ex) {
    await database.close();
    Logger.d('Could not open database with password: $password, delete all tables and try again');
    await _deleteDatabase();

    return DriftLocalDatabase(LazyDatabase(() => _getNativeDatabase(password: password)));
  }
}

Future<void> _setupSqlCipher() async {
  if(Platform.isAndroid) {
    await applyWorkaroundToOpenSqlCipherOnOldAndroidVersions();
    open.overrideFor(OperatingSystem.android, openCipherOnAndroid);
  }
}

Future<void> _deleteDatabase() async {
  final file = File(join((await getApplicationCacheDirectory()).path, _databaseName));

  if (file.existsSync()) {
  Logger.d('Deleting existing database file');
  await file.delete();
  }
}

Future<NativeDatabase> _getNativeDatabase({required String password}) async {
  final dbFolder = await getApplicationCacheDirectory();
  final dbFile = File(join(dbFolder.path, _databaseName));
  Logger.d('Database path: ${dbFile.path}');

  return NativeDatabase(
    dbFile,
    setup: (db) {
      // Check that we're actually running with SQLCipher by quering the
      // cipher_version pragma.
      final result = db.select('pragma cipher_version');
      if (result.isEmpty) {
        throw UnsupportedError(
          'This database needs to run with SQLCipher, but that library is '
              'not available!',
        );
      }

      final escapedKey = password.replaceAll("'", "''");
      db.execute("pragma key = '$escapedKey'");
    },
  );
}

Future<String?> _generateAndSaveDatabasePassword(
  SecurityRepository securityRepository,
) async {
  try {
    final result = await securityRepository.generateDatabasePassword();
    await securityRepository.setDatabasePassword(result);
    return result;
  } catch(ex) {
    return null;
  }
}
