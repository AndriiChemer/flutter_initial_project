import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/data/database/drift_local_database.db.dart';
import 'package:iteo_libraries_example/domain/security/security_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injectDatabaseModule(GetIt getIt) async {
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingletonAsync(() => SharedPreferences.getInstance());
  await getIt.isReady<SharedPreferences>();

  getIt.registerLazySingletonAsync(() => getDriftDatabase(getIt<SecurityRepository>()));
}
