import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:iteo_libraries_example/domain/app_theme/app_theme_type_storage.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:mockito/mockito.dart';

import 'save_app_theme_type_use_case_test.mocks.dart';

void main() {
  late GetAppThemeTypeStreamUseCase getAppThemeTypeStreamUseCase;
  late AppThemeTypeStorage mockAppThemeTypeStorage;

  setUp(() {
    mockAppThemeTypeStorage = MockAppThemeTypeStorage();
    getAppThemeTypeStreamUseCase = GetAppThemeTypeStreamUseCase(mockAppThemeTypeStorage);
  });

  test('GetAppThemeTypeStreamUseCase returns stream from AppThemeTypeStorage', () {
    final expectedStream = StreamController<AppThemeType>().stream;

    when(mockAppThemeTypeStorage.getTypeStream()).thenAnswer((_) => expectedStream);
    final result = getAppThemeTypeStreamUseCase();

    expect(result, equals(expectedStream));
  });
}
