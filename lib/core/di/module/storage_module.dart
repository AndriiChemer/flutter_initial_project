import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:iteo_libraries_example/core/di/di.dart';
import 'package:iteo_libraries_example/data/app_theme/app_theme_type_storage_impl.dart';
import 'package:iteo_libraries_example/data/database/drift_local_database.db.dart';
import 'package:iteo_libraries_example/domain/app_theme/app_theme_type_storage.dart';
import 'package:iteo_libraries_example/domain/security/security_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class StorageModule {
  @LazySingleton()
  FlutterSecureStorage get flutterSecureStorage;

  @LazySingleton(as: AppThemeTypeStorage)
  AppThemeTypeStorageImpl get appThemeTypeStorage;

  @lazySingleton
  @preResolve
  Future<SharedPreferences> getPrefs() => SharedPreferences.getInstance();

  @lazySingleton
  @preResolve
  Future<DriftLocalDatabase> driftDatabase() =>
      getDriftDatabase(getIt<SecurityRepository>());
}
