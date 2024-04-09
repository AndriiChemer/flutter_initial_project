import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:flutter/foundation.dart';
import 'package:iteo_libraries_example/data/database/drift_local_database.db.dart';
import 'package:iteo_libraries_example/domain/security/security_repository.dart';

const _databaseName = 'drift_database';

Future<DriftLocalDatabase> getDriftDatabase(
  SecurityRepository securityRepository,
) async {
  return DriftLocalDatabase(_webWasmConnect());
}

DatabaseConnection _webWasmConnect() {
  return DatabaseConnection.delayed(
    Future(() async {
      const worker = kReleaseMode ? 'drift_worker.dart.min.js' : 'drift_worker.dart.js';

      // Commented out because of aggresive logging in debug mode on Web.
      // Uncomment if you want to see the logs.
      // const sqlite = kReleaseMode ? 'sqlite3.wasm' : 'sqlite3.debug.wasm';
      const sqlite = 'sqlite3.wasm';

      final result = await WasmDatabase.open(
        databaseName: _databaseName,
        sqlite3Uri: Uri.parse(sqlite),
        driftWorkerUri: Uri.parse(worker),
      );

      return result.resolvedExecutor;
    }),
  );
}
