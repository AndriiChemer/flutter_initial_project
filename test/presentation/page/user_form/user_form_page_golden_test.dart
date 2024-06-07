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

typedef StringInputState = BaseTextInputState<String, NameValidationResult>;
typedef StringInputAction = BaseTextInputActions<NameValidationResult>;

typedef EmailInputState = BaseTextInputState<String, EmailValidationResult>;
typedef EmailInputAction = BaseTextInputActions<EmailValidationResult>;

class MockUserFormBloc extends MockCubit<UserFormState>
    implements UserFormBloc {}

class MockNameInputCubit extends Mock implements NameInputCubit {
  MockNameInputCubit() {
    when(() => stream).thenAnswer(
      (_) => const Stream<
          BaseTextInputState<String, NameValidationResult>>.empty(),
    );
    when(close).thenAnswer((_) => Future<void>.value());
  }
}

class MockSurnameInputCubit extends Mock implements SurnameInputCubit {
  MockSurnameInputCubit() {
    when(() => stream).thenAnswer(
      (_) => const Stream<
          BaseTextInputState<String, NameValidationResult>>.empty(),
    );
    when(close).thenAnswer((_) => Future<void>.value());
  }
}

class MockEmailInputCubit extends Mock implements EmailInputCubit {
  MockEmailInputCubit() {
    when(() => stream).thenAnswer(
      (_) => const Stream<
          BaseTextInputState<String, EmailValidationResult>>.empty(),
    );
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
  late MockSurnameInputCubit mockSurnameInputCubit;
  late EmailInputCubit mockEmailInputCubit;

  late Widget testedWidget;

  setUp(() async {
    await getIt.reset();
    userFormBloc = MockUserFormBloc();
    mockNameInputCubit = MockNameInputCubit();
    mockSurnameInputCubit = MockSurnameInputCubit();
    mockEmailInputCubit = MockEmailInputCubit();

    mockGetAppThemeTypeStreamUseCase = mockGetAppThemeTypeStream();

    getIt.registerFactory<UserFormBloc>(() => userFormBloc);
    getIt.registerFactory<NameInputCubit>(() => mockNameInputCubit);
    getIt.registerFactory<SurnameInputCubit>(() => mockSurnameInputCubit);
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

      final loadingState = UserFormLoading();

      builder.addScenario(
        name: 'Loading',
        widget: Builder(
          builder: (context) {
            whenListen(
              userFormBloc,
              Stream<UserFormState>.fromIterable([
                loadingState,
              ]),
              initialState: loadingState,
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

      const nameSurnameInitState = StringInputState.init();
      const emailInitState = EmailInputState.init();

      builder.addScenario(
        name: 'Loaded empty fields',
        widget: Builder(
          builder: (context) {
            /// NAME INPUT CUBIT
            whenListen(
              mockNameInputCubit,
              Stream<StringInputState>.fromIterable([nameSurnameInitState]),
              initialState: nameSurnameInitState,
            );

            whenListenAction(
              mockNameInputCubit,
              Stream<StringInputAction>.fromIterable([]),
            );

            /// SURNAME INPUT CUBIT
            whenListen(
              mockSurnameInputCubit,
              Stream<StringInputState>.fromIterable([nameSurnameInitState]),
              initialState: nameSurnameInitState,
            );

            whenListenAction(
              mockSurnameInputCubit,
              Stream<StringInputAction>.fromIterable([]),
            );

            /// EMAIL INPUT CUBIT
            whenListen(
              mockEmailInputCubit,
              Stream<EmailInputState>.fromIterable([emailInitState]),
              initialState: emailInitState,
            );

            whenListenAction(
              mockEmailInputCubit,
              Stream<EmailInputAction>.fromIterable([]),
            );

            /// MAIN CUBIT
            whenListen(
              userFormBloc,
              Stream<UserFormState>.fromIterable([
                UserFormLoading(),
                UserFormValidated.init(),
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

      const nameSurnameInitState = StringInputState.init();
      const nameValidState = StringInputState.validated(
        NameValidationResult.valid(name: 'Test'),
      );
      const surnameValidState = StringInputState.validated(
        NameValidationResult.valid(name: 'Surname'),
      );

      const emailInitState = EmailInputState.init();
      const emailValidState = EmailInputState.validated(
        EmailValidationResult.valid(email: 'test@test.com'),
      );

      builder.addScenario(
        name: 'Loaded and fields are filled',
        widget: Builder(
          builder: (context) {
            /// NAME INPUT CUBIT
            whenListen(
              mockNameInputCubit,
              Stream<StringInputState>.fromIterable([
                nameSurnameInitState,
                nameValidState,
              ]),
              initialState: nameSurnameInitState,
            );

            whenListenAction(
              mockNameInputCubit,
              Stream<StringInputAction>.fromIterable(
                [
                  const StringInputAction.finishEditing(
                    NameValidationResult.valid(name: 'test@test.com'),
                  ),
                ],
              ),
            );

            /// SURNAME INPUT CUBIT
            whenListen(
              mockSurnameInputCubit,
              Stream<StringInputState>.fromIterable([
                nameSurnameInitState,
                surnameValidState,
              ]),
              initialState: nameSurnameInitState,
            );

            whenListenAction(
              mockSurnameInputCubit,
              Stream<StringInputAction>.fromIterable(
                [
                  const StringInputAction.finishEditing(
                    NameValidationResult.valid(name: 'Surname'),
                  ),
                ],
              ),
            );

            /// EMAIL INPUT CUBIT
            whenListen(
              mockEmailInputCubit,
              Stream<EmailInputState>.fromIterable([
                emailInitState,
                emailValidState,
              ]),
              initialState: emailInitState,
            );

            whenListenAction(
              mockEmailInputCubit,
              Stream<EmailInputAction>.fromIterable([
                const EmailInputAction.finishEditing(
                  EmailValidationResult.valid(email: 'test@test.com'),
                ),
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
                      const NameValidationResult.valid(name: 'Surname'),
                  surname: 'Surname',
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
          await tester.enterText(textFields.at(1), 'Surname');
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
    'User form - Loaded name and surname is not valid',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'Loaded name and surname is not valid',
        widget: Builder(
          builder: (context) {
            const nameSurnameInitState = StringInputState.init();

            const invalidNameValidState = StringInputState.validated(
              NameValidationResult.tooShort(name: 'te', minChar: 3),
            );

            const invalidSurnameValidState = StringInputState.validated(
              NameValidationResult.tooShort(name: 'Su', minChar: 3),
            );

            const emailInitState = EmailInputState.init();

            /// NAME INPUT CUBIT
            whenListen(
              mockNameInputCubit,
              Stream<StringInputState>.fromIterable([
                nameSurnameInitState,
                invalidNameValidState,
              ]),
              initialState: nameSurnameInitState,
            );

            whenListenAction(
              mockNameInputCubit,
              Stream<BaseTextInputActions<NameValidationResult>>.fromIterable(
                [
                  const StringInputAction.finishEditing(
                    NameValidationResult.tooShort(name: 'te', minChar: 3),
                  ),
                ],
              ),
            );

            /// SURNAME INPUT CUBIT
            whenListen(
              mockSurnameInputCubit,
              Stream<StringInputState>.fromIterable([
                nameSurnameInitState,
                invalidSurnameValidState,
              ]),
              initialState: nameSurnameInitState,
            );

            whenListenAction(
              mockSurnameInputCubit,
              Stream<StringInputAction>.fromIterable([
                const BaseTextInputActions<NameValidationResult>.finishEditing(
                  NameValidationResult.tooShort(name: 'Su', minChar: 3),
                ),
              ]),
            );

            /// EMAIL INPUT CUBIT
            whenListen(
              mockEmailInputCubit,
              Stream<EmailInputState>.fromIterable([emailInitState]),
              initialState: emailInitState,
            );

            whenListenAction(
              mockEmailInputCubit,
              Stream<EmailInputAction>.fromIterable([]),
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
                      const NameValidationResult.valid(name: 'Su'),
                  surname: 'Su',
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
          expect(textFields.at(1), findsOneWidget);

          await tester.enterText(textFields.at(0), 'te');
          await tester.enterText(textFields.at(1), 'Su');
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

  testGoldens(
    'User form - Loaded and all fields are not valid',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'Loaded and all fields are not valid',
        widget: Builder(
          builder: (context) {
            const nameSurnameInitState = StringInputState.init();

            const invalidNameValidState = StringInputState.validated(
              NameValidationResult.tooShort(name: 'te', minChar: 3),
            );

            const invalidSurnameValidState = StringInputState.validated(
              NameValidationResult.tooShort(name: 'Su', minChar: 3),
            );

            const emailInitState = EmailInputState.init();
            const invalidEmailState = EmailInputState.validated(
              EmailValidationResult.wrongFormat(email: 'test@'),
            );

            /// NAME INPUT CUBIT
            whenListen(
              mockNameInputCubit,
              Stream<StringInputState>.fromIterable([
                nameSurnameInitState,
                invalidNameValidState,
              ]),
              initialState: nameSurnameInitState,
            );

            whenListenAction(
              mockNameInputCubit,
              Stream<StringInputAction>.fromIterable(
                [
                  const StringInputAction.finishEditing(
                    NameValidationResult.tooShort(name: 'te', minChar: 3),
                  ),
                ],
              ),
            );

            /// SURNAME INPUT CUBIT
            whenListen(
              mockSurnameInputCubit,
              Stream<StringInputState>.fromIterable([
                nameSurnameInitState,
                invalidSurnameValidState,
              ]),
              initialState: nameSurnameInitState,
            );

            whenListenAction(
              mockSurnameInputCubit,
              Stream<StringInputAction>.fromIterable(
                [
                  const StringInputAction.finishEditing(
                    NameValidationResult.tooShort(name: 'Su', minChar: 3),
                  ),
                ],
              ),
            );

            /// EMAIL INPUT CUBIT
            whenListen(
              mockEmailInputCubit,
              Stream<EmailInputState>.fromIterable([
                emailInitState,
                invalidEmailState,
              ]),
              initialState: emailInitState,
            );

            whenListenAction(
              mockEmailInputCubit,
              Stream<EmailInputAction>.fromIterable([
                const EmailInputAction.finishEditing(
                  EmailValidationResult.wrongFormat(email: 'test@'),
                ),
              ]),
            );

            /// MAIN CUBIT
            whenListen(
              userFormBloc,
              Stream<UserFormState>.fromIterable([
                UserFormLoading(),
                UserFormValidated(
                  nameValidationResult: const NameValidationResult.tooShort(
                    name: 'te',
                    minChar: 3,
                  ),
                  name: 'te',
                  surnameValidationResult: const NameValidationResult.tooShort(
                    name: 'Su',
                    minChar: 3,
                  ),
                  surname: 'Su',
                  emailValidationResult:
                      const EmailValidationResult.wrongFormat(email: 'test@'),
                  email: 'test@',
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

          await tester.enterText(textFields.at(0), 'te');
          await tester.enterText(textFields.at(1), 'Su');
          await tester.enterText(textFields.at(2), 'test@');
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
        'user_form_fields_are_invalid',
      );
    },
  );
}
