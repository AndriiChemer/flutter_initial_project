import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/core/di/di_config.dart';
import 'package:iteo_libraries_example/data/app_theme/app_theme_type_storage_impl.dart';
import 'package:iteo_libraries_example/domain/app_theme/app_theme_type_storage.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injectDatabaseModule(GetIt getIt) async {
  getIt.registerLazySingletonAsync(() => SharedPreferences.getInstance());
  await getIt.isReady<SharedPreferences>();
}
