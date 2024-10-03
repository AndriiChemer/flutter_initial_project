import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cubit/cars_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/main/enum/bottom_navigation_pages.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page.dart';
import 'package:mockito/mockito.dart';

import '../../../test/presentation/page/cars/cars_cubit_test.mocks.dart';
import '../../../test/test_helpers/golden_test_app_wrappers.dart';

class CarsPageRobot {
  CarsPageRobot(this.tester);

  final WidgetTester tester;
  late Widget page;
  final cars = <Car>[
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
  ];

  Future<void> initialize() async {
    final carsCubit = CarsCubit(
      getCarsUseCase: MockGetCarsUseCase(),
      saveCarsToDatabaseUseCase: MockSaveCarsToDatabaseUseCase(),
      getCarsFromIsolateExecutorUseCase: MockGetCarsFromIsolateExecutorUseCase(),
      loadCarsFromIsolateExecutorUseCase: MockLoadCarsFromIsolateExecutorUseCase(),
    );

    when(carsCubit.getCarsUseCase.call()).thenAnswer((_) => Future.value(cars));

    page = testPageActionCubitWrapper<CarsCubit, CarsState, CarsAction>(
      page: const MainPage(),
      cubit: carsCubit,
    );
  }

  Future<void> runPage() async {
    await tester.pumpWidget(page);
    await tester.pumpAndSettle();
  }

  Future<void> navigateToCarsPage() async {
    final findedButton = find.byKey(Key(BottomNavigationPages.cars.name));
    expect(findedButton, findsOneWidget);

    await tester.tap(findedButton);
    await tester.pumpAndSettle();
  }

  Future<void> saveCarsClick() async {
    final saveDatabaseFinder = find.byKey(const Key('cars_save_database'));
    expect(saveDatabaseFinder, findsOneWidget);

    await tester.press(saveDatabaseFinder);
    await tester.pumpAndSettle();
  }
}
