import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_action_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/cubit/safe_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:provider/provider.dart';

import 'goldet_test_material_app.dart';
import 'test_theme.dart';

/// Usage:
/// ```dart
/// testWidgets('My Test', (tester) async {
///   await tester.pumpWidget(testPageCubitWrapper<SampleCubit, SampleState>(
///     page: MySamplePage(),
///     cubit: SampleCubit(),
///   ));
///   /// Your test code here
/// });
/// ```
Widget testPageCubitWrapper<T extends SafeCubit<State>, State>({
  required Widget page,
  required T cubit,
}) {
  final mockGetAppThemeTypeStreamUseCase = mockGetAppThemeTypeStream();

  return HookedBlocConfigProvider(
    injector: () {
      return <T extends Object>() {
        return cubit as T;
      };
    },
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
      child: TestApp(
        child: page,
      ),
    ),
  );
}

/// Usage:
/// ```dart
/// testWidgets('My Test', (tester) async {
///   await tester.pumpWidget(testPageCubitWrapper<SampleCubit, SampleState, SampleAction>(
///     page: MySamplePage(),
///     cubit: SampleCubit(),
///   ));
///   /// Your test code here
/// });
/// ```
Widget testPageActionCubitWrapper<T extends SafeActionCubit<State, Action>, State extends Object, Action>({
  required Widget page,
  required T cubit,
}) {
  final mockGetAppThemeTypeStreamUseCase = mockGetAppThemeTypeStream();

  return HookedBlocConfigProvider(
    injector: () {
      return <T extends Object>() {
        return cubit as T;
      };
    },
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
      child: TestApp(
        child: page,
      ),
    ),
  );
}

/// Use when we have a lot of cubits
/// Usage:
/// ```dart
/// testWidgets('My Test', (tester) async {
///   await tester.pumpWidget(testPageGetItWrapper(
///     page: MySamplePage(),
///     getItInstance: getItWithDependencies,
///   ));
///   /// Your test code here
/// });
/// ```
Widget testPageGetItWrapper({
  required Widget page,
  required GetIt getItInstance,
}) {
  final mockGetAppThemeTypeStreamUseCase = mockGetAppThemeTypeStream();

  return HookedBlocConfigProvider(
    injector: () => getItInstance,
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
      child: TestApp(
        child: page,
      ),
    ),
  );
}
