import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/data/app_theme/app_theme_type_storage_impl.dart';
import 'package:iteo_libraries_example/domain/app_theme/app_theme_type_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injectDataModule(GetIt getIt) async {
  getIt.registerLazySingleton<AppThemeTypeStorage>(() => AppThemeTypeStorageImpl(getIt<SharedPreferences>()));
}
