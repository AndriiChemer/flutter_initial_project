import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
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
    final style = _withTypo(context.typo).copyWith(color: color ?? context.colors.typo);

    if (autoSize) {
      return AutoSizeText(
        data,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: textAlign,
        minFontSize: 5,
        style: style,
      );
    }

    return Text(
      data,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      textHeightBehavior: evenTextHeightBehavior,
      textAlign: textAlign,
      style: style,
    );
  }
}
