import 'dart:convert';
import 'dart:ui';

import 'package:easy_localization/src/localization.dart';
import 'package:easy_localization/src/translations.dart';
import 'package:flutter/services.dart';

Future<void> setupTestLocalization() async {
  final content = await rootBundle.loadString('assets/translations/pl.json');
  final data = jsonDecode(content) as Map<String, dynamic>;
  Localization.load(
    const Locale('pl'),
    translations: Translations(data),
  );
}
