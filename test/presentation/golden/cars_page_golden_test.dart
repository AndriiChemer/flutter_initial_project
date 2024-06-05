import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cubit/cars_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/main/enum/bottom_navigation_pages.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../test_helpers/test_action_bloc.dart';
import '../../test_helpers/test_theme.dart';
import '../page/settings/settings_page_cubit_test.mocks.dart';

class MockCarsCubit extends MockCubit<CarsState> implements CarsCubit {}

void main() {
  final mockedCars = <Car>[
    Car(
      id: '1',
      brand: 'brand1',
      model: 'model1',
      registration: 'registration1',
    ),
    Car(
      id: '2',
      brand: 'brand2',
      model: 'model2',
      registration: 'registration2',
    ),
    Car(
      id: '3',
      brand: 'brand3',
      model: 'model3',
      registration: 'registration3',
    ),
    Car(
      id: '4',
      brand: 'brand4',
      model: 'model4',
      registration: 'registration4',
    ),
    Car(
      id: '5',
      brand: 'brand5',
      model: 'model5',
      registration: 'registration5',
    ),
  ];

  final getIt = GetIt.instance;
  late MockCarsCubit carsCubit;
  late MockGetAppThemeTypeStreamUseCase mockGetAppThemeTypeStreamUseCase;
  late Widget testedWidget;

  setUp(() {
    carsCubit = MockCarsCubit();
    mockGetAppThemeTypeStreamUseCase = mockGetAppThemeTypeStream();
    // getIt.registerSingleton<CarsCubit>(carsCubit);

    if (!getIt.isRegistered<CarsCubit>()) {
      getIt.registerFactory<CarsCubit>(() => carsCubit);
    }

    // when(() => carsCubit.getCars()).thenAnswer((_) async {});

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
        child: const MainPage(),
      ),
    );
  });

  testGoldens(
    'Cars Page Loading',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'Cars Loading',
        widget: Builder(
          builder: (context) {
            when(() => carsCubit.getCars()).thenAnswer((_) async {});

            whenListen(
              carsCubit,
              Stream<CarsState>.fromIterable([
                LoadingCars(),
              ]),
              initialState: LoadingCars(),
            );

            whenListenAction(
              carsCubit,
              Stream<CarsAction>.fromIterable([]),
            );

            return testedWidget;
          },
        ),
        onCreate: (scenarioWidgetKey) async {
          final finder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byKey(Key(BottomNavigationPages.cars.name)),
          );
          expect(finder, findsOneWidget);

          await tester.tap(finder);
        },
      );

      // builder.addScenario(
      //   name: 'Cars Loaded',
      //   widget: Builder(
      //     builder: (context) {
      //       when(() => carsCubit.getCars()).thenAnswer((_) async {});
      //       whenListen(
      //         carsCubit,
      //         Stream<CarsState>.fromIterable([
      //           LoadingCars(),
      //           ShowCars(mockedCars),
      //         ]),
      //         initialState: LoadingCars(),
      //       );
      //
      //       whenListenAction(
      //         carsCubit,
      //         Stream<CarsAction>.fromIterable([]),
      //       );
      //       return testedWidget;
      //     },
      //   ),
      //   onCreate: (scenarioWidgetKey) async {
      //     final finder = find.descendant(
      //       of: find.byKey(scenarioWidgetKey),
      //       matching: find.byKey(Key(BottomNavigationPages.cars.name)),
      //     );
      //     expect(finder, findsOneWidget);
      //
      //     await tester.tap(finder);
      //   },
      // );

      await tester.pumpDeviceBuilder(
        builder,
        wrapper: materialAppWrapper(
          theme: getAppTheme(),
        ),
      );

      // Take screenshots for each scenario
      await screenMatchesGolden(
        tester,
        'cars_page_loading',
        customPump: (widget) => widget.pump(Duration(milliseconds: 100)),
      );

      // await screenMatchesGolden(
      //   tester,
      //   'cars_page_loaded',
      //   customPump: (widget) => widget.pump(Duration(milliseconds: 100)),
      // );

      // await screenMatchesGolden(
      //   tester,
      //   'cars_page',
      //   // customPump: (widget) => widget.pump(const Duration(seconds: 1)),
      // );
    },
  );

  testGoldens(
    'Cars Page - Loaded',
    (tester) async {
      final builder = DeviceBuilder();

      // builder.addScenario(
      //   name: 'Cars Loading',
      //   widget: Builder(
      //     builder: (context) {
      //       when(() => carsCubit.getCars()).thenAnswer((_) async {});
      //
      //       whenListen(
      //         carsCubit,
      //         Stream<CarsState>.fromIterable([
      //           LoadingCars(),
      //         ]),
      //         initialState: LoadingCars(),
      //       );
      //
      //       whenListenAction(
      //         carsCubit,
      //         Stream<CarsAction>.fromIterable([]),
      //       );
      //
      //       return HookedBlocConfigProvider(
      //         injector: () => getIt.get,
      //         child: MultiProvider(
      //           providers: [
      //             ChangeNotifierProvider(
      //               create: (_) => AppColorsProvider(
      //                 mockGetAppThemeTypeStreamUseCase,
      //               ),
      //             ),
      //             ProxyProvider<AppColorsProvider, AppTypo>(
      //               update: (_, value, __) => AppTypo(value.colors),
      //             ),
      //             ProxyProvider<AppColorsProvider, AppShadows>(
      //               update: (_, value, __) => AppShadows(value.colors),
      //             ),
      //           ],
      //           child: const MainPage(),
      //         ),
      //       );
      //     },
      //   ),
      //   onCreate: (scenarioWidgetKey) async {
      //     final finder = find.descendant(
      //       of: find.byKey(scenarioWidgetKey),
      //       matching: find.byKey(Key(BottomNavigationPages.cars.name)),
      //     );
      //     expect(finder, findsOneWidget);
      //
      //     await tester.tap(finder);
      //   },
      // );

      builder.addScenario(
        name: 'Cars Loaded',
        widget: Builder(
          builder: (context) {
            when(() => carsCubit.getCars()).thenAnswer((_) async {});
            whenListen(
              carsCubit,
              Stream<CarsState>.fromIterable([
                LoadingCars(),
                ShowCars(mockedCars),
              ]),
              initialState: LoadingCars(),
            );

            whenListenAction(
              carsCubit,
              Stream<CarsAction>.fromIterable([]),
            );

            return testedWidget;
          },
        ),
        onCreate: (scenarioWidgetKey) async {
          final finder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byKey(Key(BottomNavigationPages.cars.name)),
          );
          expect(finder, findsOneWidget);

          await tester.tap(finder);
        },
      );

      await tester.pumpDeviceBuilder(
        builder,
        wrapper: materialAppWrapper(
          theme: getAppTheme(),
        ),
      );

      // Take screenshots for each scenario
      // await screenMatchesGolden(
      //   tester,
      //   'cars_page_loading',
      //   customPump: (widget) => widget.pump(Duration(milliseconds: 100)),
      // );

      await screenMatchesGolden(
        tester,
        'cars_page_loaded',
        // customPump: (widget) => widget.pump(Duration(milliseconds: 200)),
      );

      // await screenMatchesGolden(
      //   tester,
      //   'cars_page',
      //   // customPump: (widget) => widget.pump(const Duration(seconds: 1)),
      // );
    },
  );
}
