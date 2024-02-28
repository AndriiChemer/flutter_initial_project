import 'package:flutter_test/flutter_test.dart';
import 'package:iteo_libraries_example/domain/app_theme/app_theme_type_storage.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/save_app_theme_type_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_app_theme_type_use_case_test.mocks.dart';

@GenerateMocks(
  [
    AppThemeTypeStorage,
  ],
)
void main() {
  late SaveAppThemeTypeUseCase saveAppThemeTypeUseCase;
  late MockAppThemeTypeStorage mockAppThemeTypeStorage;

  setUp(() {
    mockAppThemeTypeStorage = MockAppThemeTypeStorage();
    saveAppThemeTypeUseCase = SaveAppThemeTypeUseCase(mockAppThemeTypeStorage);
  });

  test('SaveAppThemeTypeUseCase saves AppThemeType using AppThemeTypeStorage', () async {
    const theme = AppThemeType.dark;
    when(mockAppThemeTypeStorage.saveType(theme)).thenAnswer((_) => Future.value());

    await saveAppThemeTypeUseCase(theme);
    verify(mockAppThemeTypeStorage.saveType(theme)).called(1);
  });
}
