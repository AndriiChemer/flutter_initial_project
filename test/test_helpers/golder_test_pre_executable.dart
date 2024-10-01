import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'flutter_test_config.dart';

Future<void> testPreExecutable({FutureOr<void> Function()? preExecutable}) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await loadAppFonts();
  await setupLocalization();
  await preExecutable?.call();
}
