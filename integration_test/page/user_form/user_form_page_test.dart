import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'user_form_page_robot.dart';

// TODO when we jump to page all cubits from previous page should be initialized because
// pager open all pages when jump to page
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('User form', () {
    testWidgets('Valid form', (WidgetTester tester) async {
      final userFormPageRobot = UserFormPageRobot(tester);
      await userFormPageRobot.initialize();

      await userFormPageRobot.runPage();
      await userFormPageRobot.navigateToCarsPage();
      await userFormPageRobot.fillForms();
    });

    // testWidgets('Invalid form', (WidgetTester tester) async {
    //   final userFormPageRobot = UserFormPageRobot(tester);
    //   await userFormPageRobot.initialize();

    //   await userFormPageRobot.runPage();
    //   await userFormPageRobot.navigateToCarsPage();
    //   await userFormPageRobot.fillForms();
    // });
  });
}
