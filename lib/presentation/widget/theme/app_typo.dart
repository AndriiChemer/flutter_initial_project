import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/app_colors.dart';

const _fontFamilyMontserrat = 'Montserrat';

class AppTypo {
  AppTypo(this.colors);

  final AppColors colors;

  Map<String, TextStyle> get allStyles => {
        'Style 0': style0,
        'Style 1': style1,
        'Style 2': style2,
        'Style 3': style3,
        'Style 4_S': style4Strikethrough,
        'Style 5': style5,
        'Style 6': style6,
        'Style 6_U': style6Underline,
      };

  TextStyle get style0 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 24,
        height: 1.33,
        fontWeight: FontWeight.w700,
        debugLabel: 'Style 0',
      );

  TextStyle get style1 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 24,
        height: 1.33,
        letterSpacing: -0.2,
        fontWeight: FontWeight.w500,
        debugLabel: 'Style 1',
      );

  TextStyle get style2 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 20,
        debugLabel: 'Style 2',
        height: 1.4,
        letterSpacing: -0.2,
        fontWeight: FontWeight.w600,
      );

  TextStyle get style3 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 18,
        debugLabel: 'Style 3',
        height: 1.33,
        letterSpacing: -0.2,
        fontWeight: FontWeight.w600,
      );

  TextStyle get style4Strikethrough => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 18,
        debugLabel: 'Style 4_S',
        height: 1.33,
        letterSpacing: -0.2,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.lineThrough,
      );

  TextStyle get style5 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 16,
        debugLabel: 'Style 5',
        height: 1.0,
        letterSpacing: 0.3,
        fontWeight: FontWeight.w600,
      );

  TextStyle get style6 => TextStyle(
    fontFamily: _fontFamilyMontserrat,
    color: colors.typo,
    fontSize: 15,
    debugLabel: 'Style 6',
    height: 1.6,
    fontWeight: FontWeight.w700,
  );

  TextStyle get style6Underline => style6.copyWith(
    decoration: TextDecoration.underline,
    debugLabel: 'Style 6_U',
  );

  TextStyle get style7 => TextStyle(
    fontFamily: _fontFamilyMontserrat,
    color: colors.typo,
    fontSize: 15,
    debugLabel: 'Style 7',
    height: 1.6,
    fontWeight: FontWeight.w600,
  );

  TextStyle get style8 => TextStyle(
    fontFamily: _fontFamilyMontserrat,
    color: colors.typo,
    fontSize: 15,
    debugLabel: 'Style 8',
    height: 1.6,
    fontWeight: FontWeight.w500,
  );



  TextStyle get style9 => TextStyle(
    fontFamily: _fontFamilyMontserrat,
    color: colors.typo,
    fontSize: 12,
    debugLabel: 'Style 13',
    height: 1.33,
    letterSpacing: -0.2,
    fontWeight: FontWeight.w500,
  );
}
