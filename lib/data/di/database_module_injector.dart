import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/data/database/drift_local_database.db.dart';
import 'package:iteo_libraries_example/domain/security/security_repository.dart';

Future<void> injectDatabaseModule(GetIt getIt) async {
  getIt.registerLazySingletonAsync(() => getDriftDatabase(getIt<SecurityRepository>()));
  await getIt.isReady<DriftLocalDatabase>();
}
