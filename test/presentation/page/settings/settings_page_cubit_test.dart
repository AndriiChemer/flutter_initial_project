import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/save_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/presentation/page/settings/cubit/settings_page_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'settings_page_cubit_test.mocks.dart';

@GenerateMocks(
  [
    SaveAppThemeTypeUseCase,
    GetAppThemeTypeStreamUseCase,
  ],
)
void main() {
  late GetAppThemeTypeStreamUseCase getAppThemeTypeStreamUseCase;
  late SaveAppThemeTypeUseCase saveAppThemeTypeUseCase;
  late AppThemeType appThemeType;
  late SettingsPageCubit cubit;
  late StreamController<AppThemeType> streamController;

  setUp(() {
    getAppThemeTypeStreamUseCase = MockGetAppThemeTypeStreamUseCase();
    saveAppThemeTypeUseCase = MockSaveAppThemeTypeUseCase();
    streamController = StreamController.broadcast();
    appThemeType = AppThemeType.dark;

    when(getAppThemeTypeStreamUseCase.call()).thenAnswer((_) => streamController.stream);

    cubit = SettingsPageCubit(
      saveAppThemeTypeUseCase,
      getAppThemeTypeStreamUseCase,
    );
  });

  tearDown(() {
    streamController.close();
    cubit.close();
  });

  test('setAppThemeType should call SaveAppThemeTypeUseCase', () async {
    await cubit.setAppThemeType(appThemeType);
    verify(saveAppThemeTypeUseCase.call(appThemeType)).called(1);
  });

  test('setAppThemeType should not call SaveAppThemeTypeUseCase if type is null', () async {
    await cubit.setAppThemeType(null);
    verifyNever(saveAppThemeTypeUseCase(appThemeType));
  });

  group('setAppThemeType', () {
    blocTest<SettingsPageCubit, SettingsPageState>(
      'success',
      build: () => cubit,
      setUp: () {
        when(saveAppThemeTypeUseCase.call(appThemeType))
            .thenAnswer((_) async {});
      },
      act: (cubit) => cubit.setAppThemeType(appThemeType),
      verify: (_) =>
          verify(saveAppThemeTypeUseCase(appThemeType)).called(1),
    );


    blocTest<SettingsPageCubit, SettingsPageState>(
      'should do nothing'
          'when saveAppThemeTypeUseCase throw Exception',
      build: () => cubit,
      setUp: () {
        when(saveAppThemeTypeUseCase.call(appThemeType))
            .thenAnswer((_) => Future.error(Exception()));
      },
      act: (cubit) => cubit.setAppThemeType(appThemeType),
      expect: () => <SettingsPageState>[],
    );

    blocTest<SettingsPageCubit, SettingsPageState>(
      'should emit AppThemePageState.idle'
          'for new appThemeType',
      build: () => cubit,
      // setUp: () {},
      act: (cubit) async {
        final appThemeTypeReceived = streamController.stream.first;
        streamController.add(appThemeType);
        await appThemeTypeReceived;
      },
      expect: () => [SettingsPageIdle(savedAppThemeType: appThemeType)],
    );
  });

}
