import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/src/localization.dart';
import 'package:easy_localization/src/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

/// Golden tests will pass if the pixel difference is equal to or below 0.5%
const _kGoldenTestsThreshold = 0.5 / 100;
const _accessibility = false;

const devices = [
  Device(
    name: 'small',
    size: Size(320, 568),
    devicePixelRatio: 2,
  ),
  Device(
    name: 'huge',
    size: Size(430, 932),
    devicePixelRatio: 3,
    safeArea: EdgeInsets.only(top: 59, bottom: 34),
  ),
  if (_accessibility) ...[
    Device(
      name: 'small_accessibility',
      size: Size(320, 568),
      devicePixelRatio: 2,
      textScale: 1.5,
    ),
    Device(
      name: 'huge_accessibility',
      size: Size(430, 932),
      devicePixelRatio: 3,
      textScale: 1.5,
      safeArea: EdgeInsets.only(top: 59, bottom: 34),
    ),
  ],
];

Future<void> testPreExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // await _loadProjectFonts();
  // await _setupLocalization();
  _setupLocalizationSync();

  // await configureDependencies(AppEnv.development().environment);
  // if (goldenFileComparator is LocalFileComparator) {
  //   final testUrl = (goldenFileComparator as LocalFileComparator).basedir;

  //   // goldenFileComparator = LocalFileComparatorWithThreshold(
  //   //   // flutter_test's LocalFileComparator expects the test's URI to be passed
  //   //   // as an argument, but it only uses it to parse the baseDir in order to
  //   //   // obtain the directory where the golden tests will be placed.
  //   //   // As such, we use the default `testUrl`, which is only the `baseDir` and
  //   //   // append a generically named `test.dart` so that the `baseDir` is
  //   //   // properly extracted.
  //   //   Uri.parse('$testUrl/test.dart'),
  //   //   _kGoldenTestsThreshold,
  //   // );
  // } else {
  //   throw Exception(
  //     'Expected `goldenFileComparator` to be of type `LocalFileComparator`, '
  //     'but it is of type `${goldenFileComparator.runtimeType}`',
  //   );
  // }

  return GoldenToolkit.runWithConfiguration(
    testMain,
    config: GoldenToolkitConfiguration(
      enableRealShadows: true,
      defaultDevices: devices,
      skipGoldenAssertion: () => !Platform.isMacOS,
      deviceFileNameFactory: (name, device) {
        return '../../goldens/${device.name}/${device.brightness.name}/$name.png';
      },
    ),
  );
}

Future<void> _setupLocalization() async {
  final content = await File(
    'assets/translations/pl.json',
  ).readAsString();
  final data = jsonDecode(content) as Map<String, dynamic>;
  Localization.load(
    const Locale('pl'),
    translations: Translations(data),
  );
}

void _setupLocalizationSync() {
  final content = File(
    'assets/translations/pl.json',
  ).readAsStringSync();
  final data = jsonDecode(content) as Map<String, dynamic>;
  Localization.load(
    const Locale('pl'),
    translations: Translations(data),
  );
}

// Future<void> _loadProjectFonts() async {
//   await AssetsManager.loadFontAsset(
//     path: 'packages/design_system/fonts/OpenSans-Regular.ttf',
//     fontName: 'OpenSans',
//   );
//   await AssetsManager.loadFontAsset(
//     path: 'packages/design_system/fonts/WorkSans-Regular.ttf',
//     fontName: 'WorkSans',
//   );

//   await loadAppFonts();
// }
