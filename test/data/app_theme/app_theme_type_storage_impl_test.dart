import 'package:flutter_test/flutter_test.dart';
import 'package:iteo_libraries_example/data/app_theme/app_theme_type_storage_impl.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme_type_storage_impl_impl.mocks.dart';

@GenerateMocks(
  [
    SharedPreferences,
  ],
)
void main() {
  late AppThemeTypeStorageImpl appThemeTypeStorage;
  late MockSharedPreferences mockSharedPreferences;
  late AppThemeType appThemeType;

  setUp(() {
    appThemeType = AppThemeType.light;
    mockSharedPreferences = MockSharedPreferences();

    when(mockSharedPreferences.getInt(any))
        .thenReturn(appThemeType.index);

    appThemeTypeStorage = AppThemeTypeStorageImpl(mockSharedPreferences);
  });

  test('saveType should save the correct type to SharedPreferences', () async {
    when(mockSharedPreferences.setInt(any, appThemeType.index))
        .thenAnswer((_) async => true);

    await appThemeTypeStorage.saveType(appThemeType);

    verify(mockSharedPreferences.setInt(any, appThemeType.index))
        .called(1);
  });

  test('saveType should add the correct type to the stream', () async {
    const expectedType = AppThemeType.dark;

    when(mockSharedPreferences.setInt(any, expectedType.index))
        .thenAnswer((_) async => true);

    await appThemeTypeStorage.saveType(expectedType);

    expect(await appThemeTypeStorage.getTypeStream().first, expectedType);
  });

  test('getCurrentType should return the current type from the stream', () async {
    when(mockSharedPreferences.setInt(any, appThemeType.index))
        .thenAnswer((_) async => true);

    await appThemeTypeStorage.saveType(appThemeType);

    final currentType = appThemeTypeStorage.getCurrentType();

    expect(currentType, appThemeType);
  });
}