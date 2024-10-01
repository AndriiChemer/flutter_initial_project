import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:iteo_libraries_example/domain/validator/name/name_validation_result.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/base_text_input/cubit/base_text_input_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/name/name_input.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/name/name_input_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_helpers/golden_test_app_wrappers.dart';
import '../../test_helpers/golder_test_pre_executable.dart';
import '../../test_helpers/test_action_bloc.dart';

typedef StringInputState = BaseTextInputState<String, NameValidationResult>;
typedef StringInputAction = BaseTextInputActions<NameValidationResult>;

class MockNameInputCubit extends Mock implements NameInputCubit {
  MockNameInputCubit() {
    when(() => stream).thenAnswer((_) => const Stream<BaseTextInputState<String, NameValidationResult>>.empty());
    when(close).thenAnswer((_) => Future<void>.value());
  }
}

void main() {
  late MockNameInputCubit mockNameInputCubit;

  setUp(() async {
    await testPreExecutable(() async {
      mockNameInputCubit = MockNameInputCubit();
    });
  });

  testGoldens(
    'Initial',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'Initial',
        widget: Builder(
          builder: (context) {
            const initState = StringInputState.init();

            whenListen(
              mockNameInputCubit,
              Stream<StringInputState>.fromIterable([initState]),
              initialState: initState,
            );

            whenListenAction(
              mockNameInputCubit,
              Stream<StringInputAction>.fromIterable([]),
            );

            return Container(
              padding: const EdgeInsets.all(16),
              child: NameInput<NameInputCubit>(
                isRequired: true,
                onEditingFinished: (value) {},
                textInputAction: TextInputAction.next,
              ),
            );
          },
        ),
      );

      /// Run the device builder
      await tester.pumpDeviceBuilder(
        builder,
        wrapper: (page) => testPageActionCubitWrapper<NameInputCubit, BaseTextInputState<String, NameValidationResult>,
            BaseTextInputActions<NameValidationResult>>(
          page: page,
          cubit: mockNameInputCubit,
        ),
      );

      /// Take screenshot
      await screenMatchesGolden(
        tester,
        'initial',
      );
    },
  );

  testGoldens(
    'Invalid too short',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'too short',
        widget: Builder(
          builder: (context) {
            const initState = StringInputState.init();
            const invalidState = NameValidationResult.tooShort(
              name: 'te',
              minChar: 3,
            );

            whenListen(
              mockNameInputCubit,
              Stream<StringInputState>.fromIterable([
                initState,
                const StringInputState.validated(invalidState),
              ]),
              initialState: initState,
            );

            whenListenAction(
              mockNameInputCubit,
              Stream<StringInputAction>.fromIterable([
                const StringInputAction.finishEditing(invalidState),
              ]),
            );

            return Container(
              padding: const EdgeInsets.all(16),
              child: NameInput<NameInputCubit>(
                isRequired: true,
                onEditingFinished: (value) {},
                textInputAction: TextInputAction.next,
              ),
            );
          },
        ),
        onCreate: (scenarioWidgetKey) async {
          final finder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byType(TextField),
          );
          expect(finder, findsOneWidget);

          await tester.enterText(finder, 'te');
        },
      );

      /// Run the device builder
      await tester.pumpDeviceBuilder(
        builder,
        wrapper: (page) => testPageActionCubitWrapper<NameInputCubit, BaseTextInputState<String, NameValidationResult>,
            BaseTextInputActions<NameValidationResult>>(
          page: page,
          cubit: mockNameInputCubit,
        ),
      );

      /// Take screenshot
      await screenMatchesGolden(
        tester,
        'invalid_too_short',
      );
    },
  );

  testGoldens(
    'Invalid too long',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'too long',
        widget: Builder(
          builder: (context) {
            const initState = StringInputState.init();
            const invalidState = NameValidationResult.tooLong(
              name: 'test1',
              maxChar: 4,
            );

            whenListen(
              mockNameInputCubit,
              Stream<StringInputState>.fromIterable([
                initState,
                const StringInputState.validated(invalidState),
              ]),
              initialState: initState,
            );

            whenListenAction(
              mockNameInputCubit,
              Stream<StringInputAction>.fromIterable([
                const StringInputAction.finishEditing(invalidState),
              ]),
            );

            return Container(
              padding: const EdgeInsets.all(16),
              child: NameInput<NameInputCubit>(
                isRequired: true,
                onEditingFinished: (value) {},
                textInputAction: TextInputAction.next,
              ),
            );
          },
        ),
        onCreate: (scenarioWidgetKey) async {
          final finder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byType(TextField),
          );
          expect(finder, findsOneWidget);

          await tester.enterText(finder, 'test1');
        },
      );

      /// Run the device builder
      await tester.pumpDeviceBuilder(
        builder,
        wrapper: (page) => testPageActionCubitWrapper<NameInputCubit, BaseTextInputState<String, NameValidationResult>,
            BaseTextInputActions<NameValidationResult>>(
          page: page,
          cubit: mockNameInputCubit,
        ),
      );

      /// Take screenshot
      await screenMatchesGolden(
        tester,
        'invalid_too_long',
      );
    },
  );

  testGoldens(
    'valid',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'valid',
        widget: Builder(
          builder: (context) {
            const initState = StringInputState.init();
            const invalidState = NameValidationResult.valid(name: 'test');

            whenListen(
              mockNameInputCubit,
              Stream<StringInputState>.fromIterable([
                initState,
                const StringInputState.validated(invalidState),
              ]),
              initialState: initState,
            );

            whenListenAction(
              mockNameInputCubit,
              Stream<StringInputAction>.fromIterable([
                const StringInputAction.finishEditing(invalidState),
              ]),
            );

            return Container(
              padding: const EdgeInsets.all(16),
              child: NameInput<NameInputCubit>(
                isRequired: true,
                onEditingFinished: (value) {},
                textInputAction: TextInputAction.next,
              ),
            );
          },
        ),
        onCreate: (scenarioWidgetKey) async {
          final finder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byType(TextField),
          );
          expect(finder, findsOneWidget);

          await tester.enterText(finder, 'test');
        },
      );

      /// Run the device builder
      await tester.pumpDeviceBuilder(
        builder,
        wrapper: (page) => testPageActionCubitWrapper<NameInputCubit, BaseTextInputState<String, NameValidationResult>,
            BaseTextInputActions<NameValidationResult>>(
          page: page,
          cubit: mockNameInputCubit,
        ),
      );

      /// Take screenshot
      await screenMatchesGolden(
        tester,
        'valid',
      );
    },
  );
}
