import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/app_colors.dart';

const _fontFamilyMontserrat = 'Montserrat';

class AppTypo {
  AppTypo(this.colors);

  final AppColors colors;

  Map<String, TextStyle> get allStyles => {
        'Style 0': f24w700,
        'Style 1': f24w500,
        'Style 2': f20w600,
        'Style 3': f18w600,
        'Style 4_S': f18w500Strikethrough,
        'Style 5': f16w600,
        'Style 6': f15w700,
        'Style 6_U': f15w700Underline,
      };

  TextStyle get f24w700 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 24,
        height: 1.33,
        fontWeight: FontWeight.w700,
        debugLabel: 'f24w700',
      );

  TextStyle get f24w500 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 24,
        height: 1.33,
        letterSpacing: -0.2,
        fontWeight: FontWeight.w500,
        debugLabel: 'f24w500',
      );

  TextStyle get f20w600 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 20,
        debugLabel: 'Style 2',
        height: 1.4,
        letterSpacing: -0.2,
        fontWeight: FontWeight.w600,
      );

  TextStyle get f18w600 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 18,
        debugLabel: 'Style 3',
        height: 1.33,
        letterSpacing: -0.2,
        fontWeight: FontWeight.w600,
      );

  TextStyle get f18w500 => TextStyle(
    fontFamily: _fontFamilyMontserrat,
    color: colors.text,
    fontSize: 18,
    debugLabel: 'Style 3',
    height: 1.33,
    letterSpacing: -0.2,
    fontWeight: FontWeight.w500,
  );

  TextStyle get f18w500Strikethrough => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 18,
        debugLabel: 'Style 4_S',
        height: 1.33,
        letterSpacing: -0.2,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.lineThrough,
      );

  TextStyle get f16w600 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 16,
        debugLabel: 'Style 5',
        height: 1.0,
        letterSpacing: 0.3,
        fontWeight: FontWeight.w600,
      );

  TextStyle get f16w400 => TextStyle(
    fontFamily: _fontFamilyMontserrat,
    color: colors.text,
    fontSize: 16,
    debugLabel: 'Style 5',
    height: 1.0,
    letterSpacing: 0.3,
    fontWeight: FontWeight.w400,
  );

  TextStyle get f15w700 => TextStyle(
    fontFamily: _fontFamilyMontserrat,
    color: colors.typo,
    fontSize: 15,
    debugLabel: 'Style 6',
    height: 1.6,
    fontWeight: FontWeight.w700,
  );

  TextStyle get f15w700Underline => f15w700.copyWith(
    decoration: TextDecoration.underline,
    debugLabel: 'Style 6_U',
  );

  TextStyle get f15w600 => TextStyle(
    fontFamily: _fontFamilyMontserrat,
    color: colors.typo,
    fontSize: 15,
    debugLabel: 'Style 7',
    height: 1.6,
    fontWeight: FontWeight.w600,
  );

  TextStyle get f15w500 => TextStyle(
    fontFamily: _fontFamilyMontserrat,
    color: colors.typo,
    fontSize: 15,
    debugLabel: 'Style 8',
    height: 1.6,
    fontWeight: FontWeight.w500,
  );

  TextStyle get f14w500 => TextStyle(
    fontFamily: _fontFamilyMontserrat,
    color: colors.typo,
    fontSize: 14,
    debugLabel: 'Style 14',
    height: 1.33,
    letterSpacing: -0.2,
    fontWeight: FontWeight.w500,
  );

  TextStyle get f12w500 => TextStyle(
    fontFamily: _fontFamilyMontserrat,
    color: colors.typo,
    fontSize: 12,
    debugLabel: 'Style 13',
    height: 1.33,
    letterSpacing: -0.2,
    fontWeight: FontWeight.w500,
  );
}
