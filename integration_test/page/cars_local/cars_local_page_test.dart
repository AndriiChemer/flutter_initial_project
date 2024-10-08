import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../config/localization_confog.dart';
import 'cars_local_page_robot.dart';

/// To run this test, execute the following command:
///
/// ```
/// flutter test integration_test/page/cars_local/cars_local_page_test.dart
/// ```
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await setupTestLocalization();
  });

  group('Load cars, save cars, and load saved cars', () {
    testWidgets('Cars', (WidgetTester tester) async {
      final carsPageRobot = CarsLocalPageRobot(tester);
      await carsPageRobot.initializeRealData();
      // await carsPageRobot.initializeMock();

      await carsPageRobot.runPage();

      await carsPageRobot.navigateToCarsPage();
      await carsPageRobot.saveCarsClick();

      await carsPageRobot.navigateToLocalCarsPage(emptyListMock: false);
      await carsPageRobot.removeCarsFromDatabaseClick();
    });
  });
}
