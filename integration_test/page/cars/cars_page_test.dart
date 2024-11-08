import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../config/localization_confog.dart';
import 'cars_page_robot.dart';

/// To run this test, execute the following command:
///
/// ```
/// flutter test integration_test/page/cars/cars_page_test.dart
/// ```
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await setupTestLocalization();
  });

  group('Cars load and save to database', () {
    testWidgets('Cars', (WidgetTester tester) async {
      final carsPageRobot = CarsPageRobot(tester);
      await carsPageRobot.initialize();

      await carsPageRobot.runPage();
      await carsPageRobot.navigateToCarsPage();
      await carsPageRobot.saveCarsClick();
    });
  });
}
