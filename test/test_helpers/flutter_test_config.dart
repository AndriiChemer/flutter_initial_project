import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/src/localization.dart';
import 'package:easy_localization/src/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

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

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  await loadAppFonts();
  await setupLocalization();

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

Future<void> setupLocalization() async {
  final content = await File(
    'assets/translations/pl.json',
  ).readAsString();
  final data = jsonDecode(content) as Map<String, dynamic>;
  Localization.load(
    const Locale('pl'),
    translations: Translations(data),
  );
}
