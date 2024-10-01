import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page.dart';

import '../../../test_helpers/golder_test_pre_executable.dart';
import '../../../test_helpers/test_theme.dart';

void main() {
  setUp(() async {
    await testPreExecutable(() {});
  });
  testGoldens(
    'Home page',
    (tester) async {
      final builder = DeviceBuilder();

      builder.addScenario(
        name: 'Home page',
        widget: Builder(
          builder: (context) {
            return const MainPage();
          },
        ),
      );

      await tester.pumpDeviceBuilder(
        builder,
        wrapper: materialAppWrapper(
          theme: getAppTheme(),
        ),
      );

      await screenMatchesGolden(
        tester,
        'home_page',
      );
    },
  );
}
