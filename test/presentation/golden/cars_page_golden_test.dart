import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/presentation/app.dart';
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

  setUp(() async {
    await getIt.reset();
    carsCubit = MockCarsCubit();
    mockGetAppThemeTypeStreamUseCase = mockGetAppThemeTypeStream();
    getIt.registerFactory<CarsCubit>(() => carsCubit);

    when(() => carsCubit.getCars()).thenAnswer((_) async {});

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
        child: EasyLocalization(
          path: 'assets/translations',
          supportedLocales: const [appLocale],
          startLocale: appLocale,
          fallbackLocale: appLocale,
          child: const MainPage(),
        ),
      ),
    );
  });

  testGoldens(
    'Cars page - Loading',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'Cars Loading',
        widget: Builder(
          builder: (context) {
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
        'cars_page_loading',
      );
    },
  );

  testGoldens(
    'Cars Page - Loaded',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'Cars Loaded',
        widget: Builder(
          builder: (context) {
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
        'cars_page_loaded',
      );
    },
  );

  testGoldens(
    'Cars Page - Failed',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'Cars loading failed',
        widget: Builder(
          builder: (context) {
            whenListen(
              carsCubit,
              Stream<CarsState>.fromIterable([
                LoadingCars(),
                ShowCars(const []),
              ]),
              initialState: LoadingCars(),
            );

            whenListenAction(
              carsCubit,
              Stream<CarsAction>.fromIterable([
                ShowError(),
              ]),
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
        'cars_page_failed',
      );
    },
  );

  testGoldens(
    'Cars Page - Saved to database',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'Cars Page - Saved to database',
        widget: Builder(
          builder: (context) {
            whenListen(
              carsCubit,
              Stream<CarsState>.fromIterable([
                // LoadingCars(),
                ShowCars(mockedCars),
              ]),
              initialState: LoadingCars(),
            );

            whenListenAction(
              carsCubit,
              Stream<CarsAction>.fromIterable([
                SavedToDatabase(),
              ]),
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
          await tester.pumpAndSettle();

          final saveDatabaseFinder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byKey(const Key('cars_save_database')),
          );
          expect(saveDatabaseFinder, findsOneWidget);

          await tester.press(saveDatabaseFinder);
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
        'cars_save_to_database',
      );
    },
  );
}
