import 'package:iteo_libraries_example/domain/app_theme/app_theme_type_storage.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';

class GetAppThemeTypeStreamUseCase {
  const GetAppThemeTypeStreamUseCase(this._appThemeTypeStorage);
  final AppThemeTypeStorage _appThemeTypeStorage;

  Stream<AppThemeType> call() => _appThemeTypeStorage.getTypeStream();
}
