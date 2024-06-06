import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validation_result.dart';
import 'package:iteo_libraries_example/domain/validator/name/name_validation_result.dart';
import 'package:iteo_libraries_example/presentation/app.dart';
import 'package:iteo_libraries_example/presentation/page/main/enum/bottom_navigation_pages.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page.dart';
import 'package:iteo_libraries_example/presentation/page/user_form/cubit/user_form_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/base_text_input/cubit/base_text_input_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/email/email_input_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/name/name_input_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../test_helpers/test_action_bloc.dart';
import '../../../test_helpers/test_theme.dart';
import '../settings/settings_page_cubit_test.mocks.dart';

class MockUserFormBloc extends MockCubit<UserFormState>
    implements UserFormBloc {
  // MockUserFormBloc() {
  //   final streamController = StreamController<dynamic>();
  //   when(() => revalidationRequestStream)
  //       .thenAnswer((_) => streamController.stream);
  //   streamController.add(null);
  // }
}

class MockNameInputCubit extends Mock implements NameInputCubit {
  MockNameInputCubit() {
    when(() => stream).thenAnswer((_) =>
        const Stream<BaseTextInputState<String, NameValidationResult>>.empty());
    when(close).thenAnswer((_) => Future<void>.value());
  }
}

class MockSurnameInputCubit extends Mock implements NameInputCubit {
  MockSurnameInputCubit() {
    when(() => stream).thenAnswer((_) =>
        const Stream<BaseTextInputState<String, NameValidationResult>>.empty());
    when(close).thenAnswer((_) => Future<void>.value());
  }
}

class MockEmailInputCubit extends Mock implements EmailInputCubit {
  MockEmailInputCubit() {
    when(() => stream).thenAnswer((_) => const Stream<
        BaseTextInputState<String, EmailValidationResult>>.empty());
    when(close).thenAnswer((_) => Future<void>.value());
  }
}

/// TASKS
/// 1. State Loading
/// 2. State Loaded all fields validated
/// 1. State Loaded some fields not valid

void main() {
  final getIt = GetIt.instance;
  late MockUserFormBloc userFormBloc;
  late MockGetAppThemeTypeStreamUseCase mockGetAppThemeTypeStreamUseCase;

  late MockNameInputCubit mockNameInputCubit;
  // late MockSurnameInputCubit mockSurnameInputCubit;
  late EmailInputCubit mockEmailInputCubit;

  late Widget testedWidget;

  // final streamController = StreamController<dynamic>();
  //
  // void simulateRevalidationRequest() {
  //   when(() => userFormBloc.revalidationRequestStream)
  //       .thenAnswer((_) => streamController.stream);
  //   // Simulate adding null event to the stream
  //   // Ensure to close the stream controller after the test
  //   // addTearDown(streamController.close);
  // }

  setUp(() async {
    await getIt.reset();
    userFormBloc = MockUserFormBloc();
    mockNameInputCubit = MockNameInputCubit();
    // mockSurnameInputCubit = MockSurnameInputCubit();
    mockEmailInputCubit = MockEmailInputCubit();

    mockGetAppThemeTypeStreamUseCase = mockGetAppThemeTypeStream();

    getIt.registerFactory<UserFormBloc>(() => userFormBloc);
    getIt.registerFactory<NameInputCubit>(() => mockNameInputCubit);
    // getIt.registerFactory<NameInputCubit>(() => mockSurnameInputCubit);
    getIt.registerFactory<EmailInputCubit>(
      () => mockEmailInputCubit,
    );

    // simulateRevalidationRequest();
    when(() => userFormBloc.revalidationRequestStream)
        .thenAnswer((_) => const Stream.empty());
    when(() => userFormBloc.init()).thenAnswer((_) async {});

    testedWidget = HookedBlocConfigProvider(
      injector: () => getIt.get,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppColorsProvider(
              mockGetAppThemeTypeStreamUseCase,
            ),
          ),
          ProxyProvider<AppColorsProvider, AppTypo>(
            update: (_, value, __) => AppTypo(value.colors),
          ),
          ProxyProvider<AppColorsProvider, AppShadows>(
            update: (_, value, __) => AppShadows(value.colors),
          ),
        ],
        child: HookBuilder(
          builder: (context) {
            return EasyLocalization(
              path: 'assets/translations',
              supportedLocales: const [appLocale],
              startLocale: appLocale,
              fallbackLocale: appLocale,
              child: const MainPage(),
            );
          },
        ),
      ),
    );
  });

  testGoldens(
    'User form - Loading',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'Loading',
        widget: Builder(
          builder: (context) {
            whenListen(
              userFormBloc,
              Stream<UserFormState>.fromIterable([
                UserFormLoading(),
              ]),
              initialState: UserFormLoading(),
            );

            whenListenAction(
              userFormBloc,
              Stream<UserFormAction>.fromIterable([]),
            );

            return testedWidget;
          },
        ),
        onCreate: (scenarioWidgetKey) async {
          final finder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byKey(Key(BottomNavigationPages.userForms.name)),
          );
          expect(finder, findsOneWidget);

          await tester.tap(finder);
          await tester.pumpAndSettle();
        },
      );

      /// Run the device builder
      await tester.pumpDeviceBuilder(
        builder,
        wrapper: materialAppWrapper(
          theme: getAppTheme(),
        ),
      );

      /// Take screenshot
      await screenMatchesGolden(
        tester,
        'user_form_loading',
      );
    },
  );

  testGoldens(
    'User form - Loaded empty fields',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'Loaded empty fields',
        widget: Builder(
          builder: (context) {
            // registerFallbackValue<BaseTextInputState<String, NameValidationResult>>(BaseTextInputState<String, NameValidationResult>.init());
            // when(() => mockNameInputCubit.validate('')).thenReturn(
            //     NameValidationResult.tooLong(
            //         name: 'name', maximumCharacters: 8));

            /// NAME INPUT CUBIT
            whenListen(
              mockNameInputCubit,
              Stream<
                  BaseTextInputState<String,
                      NameValidationResult>>.fromIterable([
                const BaseTextInputState<String, NameValidationResult>.init(),
              ]),
              initialState:
                  const BaseTextInputState<String, NameValidationResult>.init(),
            );

            whenListenAction(
              mockNameInputCubit,
              Stream<BaseTextInputActions<NameValidationResult>>.fromIterable(
                [],
              ),
            );

            /// EMAIL INPUT CUBIT
            whenListen(
              mockEmailInputCubit,
              Stream<
                  BaseTextInputState<String,
                      EmailValidationResult>>.fromIterable([
                const BaseTextInputState<String, EmailValidationResult>.init(),
              ]),
              initialState: const BaseTextInputState<String,
                  EmailValidationResult>.init(),
            );

            whenListenAction(
              mockEmailInputCubit,
              Stream<BaseTextInputActions<EmailValidationResult>>.fromIterable(
                  []),
            );

            /// MAIN CUBIT
            whenListen(
              userFormBloc,
              Stream<UserFormState>.fromIterable([
                UserFormLoading(),
                UserFormValidated(
                  nameValidationResult: null,
                  name: null,
                  surnameValidationResult: null,
                  surname: null,
                  emailValidationResult: null,
                  email: null,
                ),
              ]),
              initialState: UserFormLoading(),
            );

            whenListenAction(
              userFormBloc,
              Stream<UserFormAction>.fromIterable([]),
            );

            return testedWidget;
          },
        ),
        onCreate: (scenarioWidgetKey) async {
          final finder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byKey(Key(BottomNavigationPages.userForms.name)),
          );
          expect(finder, findsOneWidget);

          await tester.tap(finder);
          await tester.pumpAndSettle();
        },
      );

      /// Run the device builder
      await tester.pumpDeviceBuilder(
        builder,
        wrapper: materialAppWrapper(
          theme: getAppTheme(),
        ),
      );

      /// Take screenshot
      await screenMatchesGolden(
        tester,
        'user_form_empty',
      );
    },
  );

  testGoldens(
    'User form - Loaded and fields are filled',
    (tester) async {
      final builder = DeviceBuilder();
      // ..overrideDevicesForAllScenarios(devices: [
      //   // Device.phone,
      //   Device.iphone11,
      //   // Device.tabletPortrait,
      //   Device.tabletLandscape,
      // ]);

      builder.addScenario(
        name: 'Loaded and fields are filled',
        widget: Builder(
          builder: (context) {
            /// NAME INPUT CUBIT
            whenListen(
              mockNameInputCubit,
              Stream<
                  BaseTextInputState<String,
                      NameValidationResult>>.fromIterable([
                const BaseTextInputState<String, NameValidationResult>.init(),
                const BaseTextInputState<String,
                    NameValidationResult>.validated(
                  NameValidationResult.valid(name: 'Test'),
                ),
              ]),
              initialState:
                  const BaseTextInputState<String, NameValidationResult>.init(),
            );

            whenListenAction(
              mockNameInputCubit,
              Stream<BaseTextInputActions<NameValidationResult>>.fromIterable(
                [
                  const BaseTextInputActions<
                          NameValidationResult>.finishEditing(
                      NameValidationResult.valid(name: 'Test')),
                ],
              ),
            );

            /// EMAIL INPUT CUBIT
            whenListen(
              mockEmailInputCubit,
              Stream<
                  BaseTextInputState<String,
                      EmailValidationResult>>.fromIterable([
                const BaseTextInputState<String, EmailValidationResult>.init(),
                const BaseTextInputState<String,
                        EmailValidationResult>.validated(
                    EmailValidationResult.valid(email: 'test@test.com')),
              ]),
              initialState: const BaseTextInputState<String,
                  EmailValidationResult>.init(),
            );

            whenListenAction(
              mockEmailInputCubit,
              Stream<BaseTextInputActions<EmailValidationResult>>.fromIterable([
                const BaseTextInputActions<EmailValidationResult>.finishEditing(
                    EmailValidationResult.valid(email: 'test@test.com')),
              ]),
            );

            /// MAIN CUBIT
            whenListen(
              userFormBloc,
              Stream<UserFormState>.fromIterable([
                UserFormLoading(),
                UserFormValidated(
                  nameValidationResult:
                      const NameValidationResult.valid(name: 'Test'),
                  name: 'Test',
                  surnameValidationResult:
                      const NameValidationResult.valid(name: 'Test'),
                  surname: 'Test',
                  emailValidationResult:
                      const EmailValidationResult.valid(email: 'test@test.com'),
                  email: 'test@test.com',
                ),
              ]),
              initialState: UserFormLoading(),
            );

            whenListenAction(
              userFormBloc,
              Stream<UserFormAction>.fromIterable([]),
            );

            return testedWidget;
          },
        ),
        onCreate: (scenarioWidgetKey) async {
          final finder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byKey(Key(BottomNavigationPages.userForms.name)),
          );
          expect(finder, findsOneWidget);

          await tester.tap(finder);
          await tester.pumpAndSettle();

          /// TextField
          final textFields = find.byType(TextField);

          expect(textFields.at(0), findsOneWidget);
          expect(textFields.at(1), findsOneWidget);
          expect(textFields.at(2), findsOneWidget);

          await tester.enterText(textFields.at(0), 'Test');
          await tester.enterText(textFields.at(1), 'Test');
          await tester.enterText(textFields.at(2), 'test@test.com');
        },
      );

      /// Run the device builder
      await tester.pumpDeviceBuilder(
        builder,
        wrapper: materialAppWrapper(
          theme: getAppTheme(),
        ),
      );

      /// Take screenshot
      await screenMatchesGolden(
        tester,
        'user_form_fields_are_filled',
      );
    },
  );

  // testGoldens(
  //   'Cars Page - Loaded',
  //   (tester) async {
  //     final builder = DeviceBuilder();
  //
  //     builder.addScenario(
  //       name: 'Cars Loaded',
  //       widget: Builder(
  //         builder: (context) {
  //           whenListen(
  //             carsCubit,
  //             Stream<CarsState>.fromIterable([
  //               LoadingCars(),
  //               ShowCars(mockedCars),
  //             ]),
  //             initialState: LoadingCars(),
  //           );
  //
  //           whenListenAction(
  //             carsCubit,
  //             Stream<CarsAction>.fromIterable([]),
  //           );
  //
  //           return testedWidget;
  //         },
  //       ),
  //       onCreate: (scenarioWidgetKey) async {
  //         final finder = find.descendant(
  //           of: find.byKey(scenarioWidgetKey),
  //           matching: find.byKey(Key(BottomNavigationPages.cars.name)),
  //         );
  //         expect(finder, findsOneWidget);
  //
  //         await tester.tap(finder);
  //         await tester.pumpAndSettle();
  //       },
  //     );
  //
  //     /// Run the device builder
  //     await tester.pumpDeviceBuilder(
  //       builder,
  //       wrapper: materialAppWrapper(
  //         theme: getAppTheme(),
  //       ),
  //     );
  //
  //     /// Take screenshot
  //     await screenMatchesGolden(
  //       tester,
  //       'cars_page_loaded',
  //     );
  //   },
  // );

  // testGoldens(
  //   'Cars Page - Failed',
  //   (tester) async {
  //     final builder = DeviceBuilder();
  //
  //     builder.addScenario(
  //       name: 'Cars loading failed',
  //       widget: Builder(
  //         builder: (context) {
  //           whenListen(
  //             carsCubit,
  //             Stream<CarsState>.fromIterable([
  //               LoadingCars(),
  //               ShowCars(const []),
  //             ]),
  //             initialState: LoadingCars(),
  //           );
  //
  //           whenListenAction(
  //             carsCubit,
  //             Stream<CarsAction>.fromIterable([
  //               ShowError(),
  //             ]),
  //           );
  //
  //           return testedWidget;
  //         },
  //       ),
  //       onCreate: (scenarioWidgetKey) async {
  //         final finder = find.descendant(
  //           of: find.byKey(scenarioWidgetKey),
  //           matching: find.byKey(Key(BottomNavigationPages.cars.name)),
  //         );
  //         expect(finder, findsOneWidget);
  //
  //         await tester.tap(finder);
  //         await tester.pumpAndSettle();
  //       },
  //     );
  //
  //     /// Run the device builder
  //     await tester.pumpDeviceBuilder(
  //       builder,
  //       wrapper: materialAppWrapper(
  //         theme: getAppTheme(),
  //       ),
  //     );
  //
  //     /// Take screenshot
  //     await screenMatchesGolden(
  //       tester,
  //       'cars_page_failed',
  //     );
  //   },
  // );

  // testGoldens(
  //   'Cars Page - Saved to database',
  //   (tester) async {
  //     final builder = DeviceBuilder();
  //
  //     builder.addScenario(
  //       name: 'Cars Page - Saved to database',
  //       widget: Builder(
  //         builder: (context) {
  //           whenListen(
  //             carsCubit,
  //             Stream<CarsState>.fromIterable([
  //               // LoadingCars(),
  //               ShowCars(mockedCars),
  //             ]),
  //             initialState: LoadingCars(),
  //           );
  //
  //           whenListenAction(
  //             carsCubit,
  //             Stream<CarsAction>.fromIterable([
  //               SavedToDatabase(),
  //             ]),
  //           );
  //
  //           return testedWidget;
  //         },
  //       ),
  //       onCreate: (scenarioWidgetKey) async {
  //         final finder = find.descendant(
  //           of: find.byKey(scenarioWidgetKey),
  //           matching: find.byKey(Key(BottomNavigationPages.cars.name)),
  //         );
  //         expect(finder, findsOneWidget);
  //
  //         await tester.tap(finder);
  //         await tester.pumpAndSettle();
  //
  //         final saveDatabaseFinder = find.descendant(
  //           of: find.byKey(scenarioWidgetKey),
  //           matching: find.byKey(const Key('cars_save_database')),
  //         );
  //         expect(saveDatabaseFinder, findsOneWidget);
  //
  //         await tester.press(saveDatabaseFinder);
  //         await tester.pumpAndSettle();
  //       },
  //     );
  //
  //     /// Run the device builder
  //     await tester.pumpDeviceBuilder(
  //       builder,
  //       wrapper: materialAppWrapper(
  //         theme: getAppTheme(),
  //       ),
  //     );
  //
  //     /// Take screenshot
  //     await screenMatchesGolden(
  //       tester,
  //       'cars_save_to_database',
  //     );
  //   },
  // );
}
