import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iteo_libraries_example/presentation/page/main/enum/bottom_navigation_pages.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page.dart';

import '../../../test/test_helpers/golden_test_app_wrappers.dart';
import 'cars_local_cubit_mock.dart';

class CarsLocalPageRobot {
  CarsLocalPageRobot(this.tester);

  late Widget page;
  final WidgetTester tester;
  late CarsLocalPageMock carsLocalPageMock;

  Future<void> initialize() async {
    carsLocalPageMock = CarsLocalPageMock();
    final getIt = await carsLocalPageMock.registerAndReturnGetIt();

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
    carsLocalPageMock.mockRemoteCarsLoaded();
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
    if (emptyListMock) {
      carsLocalPageMock.mockRemoteCarsLoaded();
      carsLocalPageMock.mockEmptyLocalCars();
    } else {
      carsLocalPageMock.mockLocalCarsLoaded();
    }

    final findedButton = find.byKey(Key(BottomNavigationPages.localCars.name));
    expect(findedButton, findsOneWidget);

    await tester.tap(findedButton);
    await tester.pumpAndSettle();
  }

  Future<void> saveCarsClick() async {
    carsLocalPageMock.mockCarsSavedToDatabase();
    final saveDatabaseFinder = find.byKey(const Key('cars_save_database'));
    expect(saveDatabaseFinder, findsOneWidget);

    await tester.press(saveDatabaseFinder);
    await tester.pumpAndSettle();
  }
}
