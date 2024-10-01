import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cubit/cars_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/main/enum/bottom_navigation_pages.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_helpers/golden_test_app_wrappers.dart';
import '../../../test_helpers/golder_test_pre_executable.dart';
import '../../../test_helpers/test_action_bloc.dart';

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

  late MockCarsCubit carsCubit;

  setUp(() async {
    await testPreExecutable(() async {
      carsCubit = MockCarsCubit();
      when(() => carsCubit.getCars()).thenAnswer((_) async {});
    });
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

            return const MainPage();
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
        wrapper: (page) => testPageActionCubitWrapper<CarsCubit, CarsState, CarsAction>(
          page: page,
          cubit: carsCubit,
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

            return const MainPage();
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
        wrapper: (page) => testPageActionCubitWrapper<CarsCubit, CarsState, CarsAction>(
          page: page,
          cubit: carsCubit,
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

            return const MainPage();
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
        wrapper: (page) => testPageActionCubitWrapper<CarsCubit, CarsState, CarsAction>(
          page: page,
          cubit: carsCubit,
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

            return const MainPage();
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
        wrapper: (page) => testPageActionCubitWrapper<CarsCubit, CarsState, CarsAction>(
          page: page,
          cubit: carsCubit,
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
