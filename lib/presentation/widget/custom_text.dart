import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Widgets;
import 'package:iteo_libraries_example/presentation/style/app_theme.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/app_typo.dart';

const evenTextHeightBehavior = TextHeightBehavior(
  applyHeightToFirstAscent: true,
  applyHeightToLastDescent: true,
  leadingDistribution: TextLeadingDistribution.even,
);

class CustomText extends StatelessWidget {
  const CustomText.withTypo(
    this.data, {
    required TextStyle Function(AppTypo appTypo) typo,
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = typo;

  CustomText.style0(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style0);

  CustomText.style1(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style1);

  CustomText.style2(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style2);

  CustomText.style3(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style3);

  CustomText.style4Strikethrough(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style4Strikethrough);

  CustomText.style5(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style5);

  CustomText.style6(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style6);

  CustomText.style6Underline(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style6Underline);

  CustomText.style7(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style7);

  CustomText.style7Underline(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style7Underline);

  CustomText.style8(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style8);

  CustomText.style9(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style9);

  CustomText.style10(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style10);

  CustomText.style10Strikethrough(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style10Strikethrough);

  CustomText.style10Underline(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style10Underline);

  CustomText.style11(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style11);

  CustomText.style11Italic(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style11Italic);

  CustomText.style12(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style12);

  CustomText.style13(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style13);

  CustomText.style14(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style14);

  CustomText.style15(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style15);

  CustomText.style16(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style16);

  CustomText.style16Strikethrough(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style16Strikethrough);

  CustomText.style17(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.style17);

  CustomText.styleOverlay(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.styleOverlay);

  final String data;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color? color;
  final TextStyle Function(AppTypo appTypo) _withTypo;
  final bool autoSize;

  @override
  Widget build(BuildContext context) {
    // final style = _withTypo(context.text).copyWith(color: color ?? Colors.red);
    AppTypo;
    if (autoSize) {
      return AutoSizeText(
        data,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: textAlign,
        minFontSize: 5,
        // style: style,
      );
    }

    return Widgets.Text(
      data,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      textHeightBehavior: evenTextHeightBehavior,
      textAlign: textAlign,
      // style: style,
    );
  }
}
