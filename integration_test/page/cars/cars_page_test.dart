import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'cars_page_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

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
