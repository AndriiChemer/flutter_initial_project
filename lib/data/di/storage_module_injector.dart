import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injectStorageModule(GetIt getIt) async {
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingletonAsync(() => SharedPreferences.getInstance());
  await getIt.isReady<SharedPreferences>();
}
