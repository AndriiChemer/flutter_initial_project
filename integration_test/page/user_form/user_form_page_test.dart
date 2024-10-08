import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../../config/localization_confog.dart';
import 'user_form_page_robot.dart';

/// To run this test, execute the following command:
///
/// ```
/// flutter test integration_test/page/user_form/user_form_page_test.dart
/// ```
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await setupTestLocalization();
  });

  group('User form', () {
    testWidgets('Valid form', (WidgetTester tester) async {
      final userFormPageRobot = UserFormPageRobot(tester);
      await userFormPageRobot.initialize();

      await userFormPageRobot.runPage();
      await userFormPageRobot.navigateToCarsPage();
      await userFormPageRobot.fillForms();
    });

    testWidgets('Invalid form', (WidgetTester tester) async {
      final userFormPageRobot = UserFormPageRobot(tester);
      await userFormPageRobot.initialize();

      await userFormPageRobot.runPage();
      await userFormPageRobot.navigateToCarsPage();
      await userFormPageRobot.fillInvalidEmailForms();
    });
  });
}
// flutter build apk 
// ./gradlew app:assembleAndroidTest 
// ./gradlew app:assembleDebug -Ptarget=integration_test/page/user_form/user_form_page_test.dart
// ./gradlew app:connectedAndroidTest -Ptarget=`pwd`/../integration_test/page/user_form/user_form_page_test.dart
