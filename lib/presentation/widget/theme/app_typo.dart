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
        'Style 7': style7,
        'Style 7_U': style7Underline,
        'Style 8': style8,
        'Style 9': style9,
        'Style 10': style10,
        'Style 10_U': style10Underline,
        'Style 10_S': style10Strikethrough,
        'Style 11': style11,
        'Style 11_L': style11Italic,
        'Style 12': style12,
        'Style 13': style13,
        'Style 14': style14,
        'Style 15': style15,
        'Style 16': style16,
        'Style 16_S': style16Strikethrough,
        'Style 17': style17,
        'Style Overlay': styleOverlay,
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
        color: colors.text,
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
        color: colors.text,
        fontSize: 15,
        debugLabel: 'Style 7',
        height: 1.6,
        fontWeight: FontWeight.w600,
      );

  TextStyle get style7Underline => style7.copyWith(
        decoration: TextDecoration.underline,
        debugLabel: 'Style 7_U',
      );

  TextStyle get style8 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 15,
        debugLabel: 'Style 8',
        height: 1.6,
        fontWeight: FontWeight.w500,
      );

  TextStyle get style9 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 13,
        debugLabel: 'Style 9',
        height: 1.54,
        letterSpacing: 0.3,
        fontWeight: FontWeight.w700,
      );

  TextStyle get style10 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 13,
        debugLabel: 'Style 10',
        height: 1.54,
        fontWeight: FontWeight.w600,
      );

  TextStyle get style10Strikethrough => style10.copyWith(
        decoration: TextDecoration.lineThrough,
        debugLabel: 'Style 10_S',
      );

  TextStyle get style10Underline => style10.copyWith(
        decoration: TextDecoration.underline,
        debugLabel: 'Style 10_U',
      );

  TextStyle get style11 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 13,
        debugLabel: 'Style 11',
        height: 1.54,
        fontWeight: FontWeight.w500,
      );

  TextStyle get style11BoldUnderline => style11.copyWith(
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w600,
      );

  TextStyle get style11Italic => style11.copyWith(
        fontStyle: FontStyle.italic,
        debugLabel: 'Style 11_L',
      );

  TextStyle get style12 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 12,
        debugLabel: 'Style 12',
        height: 1.33,
        letterSpacing: -0.2,
        fontWeight: FontWeight.w600,
      );

  TextStyle get style13 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 12,
        debugLabel: 'Style 13',
        height: 1.33,
        letterSpacing: -0.2,
        fontWeight: FontWeight.w500,
      );

  TextStyle get style14 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 11,
        debugLabel: 'Style 14',
        height: 1.45,
        letterSpacing: 0.3,
        fontWeight: FontWeight.w700,
      );

  TextStyle get style15 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 11,
        debugLabel: 'Style 15',
        height: 1.45,
        letterSpacing: 0.3,
        fontWeight: FontWeight.w600,
      );

  TextStyle get style16 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 11,
        debugLabel: 'Style 16',
        height: 1.45,
        letterSpacing: 0.3,
        fontWeight: FontWeight.w500,
      );

  TextStyle get style16Strikethrough => style16.copyWith(
        decoration: TextDecoration.lineThrough,
        debugLabel: 'Style 16_S',
      );

  TextStyle get style17 => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 10,
        debugLabel: 'Style 17',
        height: 1.6,
        fontWeight: FontWeight.w500,
      );

  TextStyle get styleOverlay => TextStyle(
        fontFamily: _fontFamilyMontserrat,
        color: colors.text,
        fontSize: 24,
        debugLabel: 'Style Overlay',
        height: 1.6,
        fontWeight: FontWeight.w700,
      );
}
