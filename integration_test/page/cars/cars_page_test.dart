import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:iteo_libraries_example/domain/cars/model/car.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cubit/cars_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/main/enum/bottom_navigation_pages.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page.dart';
import 'package:iteo_libraries_example/main.dart' as appMain;
import 'package:mockito/mockito.dart';

import '../../../test/presentation/page/cars/cars_cubit_test.mocks.dart';
import '../../../test/test_helpers/golden_test_app_wrappers.dart';

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

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late Widget page;
  late CarsCubit carsCubit;

  setUp(() async {
    carsCubit = CarsCubit(
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
  });

  group('Cars load and save to database', () {
    testWidgets('Cars', (WidgetTester tester) async {
      await tester.pumpWidget(page);
      await tester.pumpAndSettle();

      final finder = find.byKey(Key(BottomNavigationPages.cars.name));
      expect(finder, findsOneWidget);

      await tester.tap(finder);
      await tester.pumpAndSettle();

      final saveDatabaseFinder = find.byKey(const Key('cars_save_database'));
      expect(saveDatabaseFinder, findsOneWidget);

      await tester.press(saveDatabaseFinder);
      await tester.pumpAndSettle();
    });
  });
}
