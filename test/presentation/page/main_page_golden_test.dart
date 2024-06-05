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

class MockCarsCubit extends MockCubit<CarsState> implements CarsCubit {}

// @GenerateMocks(
//   [
//     GetAppThemeTypeStreamUseCase,
//   ],
// )
// @GenerateNiceMocks()
void main() {
  final mockedCars = <Car>[
    Car(
        id: '1',
        brand: 'brand1',
        model: 'model1',
        registration: 'registration1'),
    Car(
        id: '2',
        brand: 'brand2',
        model: 'model2',
        registration: 'registration2'),
    Car(
        id: '3',
        brand: 'brand3',
        model: 'model3',
        registration: 'registration3'),
    Car(
        id: '4',
        brand: 'brand4',
        model: 'model4',
        registration: 'registration4'),
    Car(
        id: '5',
        brand: 'brand5',
        model: 'model5',
        registration: 'registration5'),
  ];

  testGoldens(
    'Main Page',
    (tester) async {
      final getIt = GetIt.instance;

      final carsCubit = MockCarsCubit();
      final mockGetAppThemeTypeStreamUseCase = mockGetAppThemeTypeStream();
      getIt.registerSingleton<CarsCubit>(carsCubit);

      when(() => carsCubit.getCars()).thenAnswer((_) async {});

      final builder = DeviceBuilder();

      final widgetTested = HookedBlocConfigProvider(
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

      builder.addScenario(
        name: 'Home page',
        widget: Builder(
          builder: (context) {
            return widgetTested;
          },
        ),
      );

      builder.addScenario(
        name: 'Cars page Loading',
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

            return widgetTested;
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

      builder.addScenario(
        name: 'Cars page Loaded',
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
              Stream<CarsAction>.fromIterable([]),
            );

            return widgetTested;
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

      await screenMatchesGolden(
        tester,
        'main_page',
        // customPump: (tester) => tester.pump(const Duration(milliseconds: 300)),
      );
    },
  );
}
