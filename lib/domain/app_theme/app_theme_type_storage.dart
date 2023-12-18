import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';

abstract class AppThemeTypeStorage {
  Future<void> saveType(AppThemeType appColorsType);

  Stream<AppThemeType> getTypeStream();

  AppThemeType? getCurrentType();
}
