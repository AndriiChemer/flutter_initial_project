import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injectDatabaseModule(GetIt getIt) async {
  getIt.registerLazySingletonAsync(() => SharedPreferences.getInstance());
  await getIt.isReady<SharedPreferences>();
}
