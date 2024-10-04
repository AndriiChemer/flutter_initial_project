import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cubit/cars_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/cars_local/cubit/car_local_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/main/enum/bottom_navigation_pages.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page.dart';
import 'package:mockito/mockito.dart';

import '../../../test/presentation/page/cars/cars_cubit_test.mocks.dart';
import '../../../test/test_helpers/golden_test_app_wrappers.dart';
import '../../config/when_extension.dart';

class CarsLocalPageRobot {
  CarsLocalPageRobot(this.tester);

  late Widget page;
  final WidgetTester tester;

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
    final getIt = GetIt.instance;
    await getIt.reset();

    final carsCubit = CarsCubit(
      getCarsUseCase: MockGetCarsUseCase(),
      manageLocalCarsUseCase: MockManageLocalCarsUseCase(),
      getCarsFromIsolateExecutorUseCase: MockGetCarsFromIsolateExecutorUseCase(),
      loadCarsFromIsolateExecutorUseCase: MockLoadCarsFromIsolateExecutorUseCase(),
    );
    final carLocalCubit = CarLocalCubit(manageLocalCarsUseCase: MockManageLocalCarsUseCase());

    getIt.registerFactory<CarsCubit>(() => carsCubit);
    getIt.registerFactory<CarLocalCubit>(() => carLocalCubit);

// first when return cars, second return empty list
    when(carLocalCubit.manageLocalCarsUseCase.getCars()).whenWithAnswersCount([cars, List<Car>.empty()]);
    when(carsCubit.getCarsUseCase.call()).thenAnswer((_) => Future.value(cars));

    page = testPageGetItWrapper(
      page: const MainPage(),
      getItInstance: getIt,
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

  Future<void> saveCarsToDatabaseClick() async {
    final saveDatabaseFinder = find.byKey(const Key('cars_save_database'));
    expect(saveDatabaseFinder, findsOneWidget);

    await tester.press(saveDatabaseFinder);
    await tester.pumpAndSettle();
  }

  Future<void> navigateToLocalCarsPage({required bool emptyListMock}) async {
    final findedButton = find.byKey(Key(BottomNavigationPages.localCars.name));
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

  Future<void> removeCarsFromDatabaseClick() async {
    final saveDatabaseFinder = find.byKey(const Key('remove_cars_database'));
    expect(saveDatabaseFinder, findsOneWidget);

    await tester.tap(saveDatabaseFinder);
    await tester.pumpAndSettle();
  }
}
