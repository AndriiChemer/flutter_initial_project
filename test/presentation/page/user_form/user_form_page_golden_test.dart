import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validation_result.dart';
import 'package:iteo_libraries_example/domain/validator/name/name_validation_result.dart';
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
    implements UserFormBloc {}

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
  late EmailInputCubit mockEmailInputCubit;

  late Widget testedWidget;

  setUp(() async {
    await getIt.reset();
    userFormBloc = MockUserFormBloc();
    mockNameInputCubit = MockNameInputCubit();
    mockEmailInputCubit = MockEmailInputCubit();

    mockGetAppThemeTypeStreamUseCase = mockGetAppThemeTypeStream();

    getIt.registerFactory<UserFormBloc>(() => userFormBloc);
    getIt.registerFactory<NameInputCubit>(() => mockNameInputCubit);
    getIt.registerFactory<EmailInputCubit>(
      () => mockEmailInputCubit,
    );

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
            return const MainPage();
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

  testGoldens(
    'User form - Loaded and name is not valid',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'Loaded and name is not valid',
        widget: Builder(
          builder: (context) {
            final state = const BaseTextInputState<String,
                NameValidationResult>.validated(
              NameValidationResult.tooShort(
                name: 'te',
                minimumCharacters: 3,
              ),
            );

            /// NAME INPUT CUBIT
            whenListen(
              mockNameInputCubit,
              Stream<
                  BaseTextInputState<String,
                      NameValidationResult>>.fromIterable([
                const BaseTextInputState<String, NameValidationResult>.init(),
                const BaseTextInputState<String,
                    NameValidationResult>.validated(
                  NameValidationResult.tooShort(
                    name: 'te',
                    minimumCharacters: 3,
                  ),
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
                    NameValidationResult.tooShort(
                      name: 'te',
                      minimumCharacters: 3,
                    ),
                  ),
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
                  nameValidationResult:
                      const NameValidationResult.valid(name: 'te'),
                  name: 'te',
                  surnameValidationResult:
                      const NameValidationResult.valid(name: 'te'),
                  surname: 'te',
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

          /// TextField
          final textFields = find.byType(TextField);

          expect(textFields.at(0), findsOneWidget);
          // expect(textFields.at(1), findsOneWidget);
          // expect(textFields.at(2), findsOneWidget);

          await tester.enterText(textFields.at(0), 'te');
          // await tester.enterText(textFields.at(1), 'Test');
          // await tester.enterText(textFields.at(2), 'test@test.com');
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
        'user_form_fields_invalid_name',
      );
    },
  );
}
