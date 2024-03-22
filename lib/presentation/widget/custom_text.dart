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

  CustomText.f24w700(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.f24w700);

  CustomText.f24w500(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.f24w500);

  CustomText.f20w600(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.f20w600);

  CustomText.f18w600(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.f18w600);

  CustomText.f18w500Strikethrough(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.f18w500Strikethrough);

  CustomText.f16w600(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.f16w600);

  CustomText.f15w700(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.f15w700);

  CustomText.f15w600(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.f15w600);

  CustomText.f15w500(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.f15w500);

  CustomText.f12w500(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.f12w500);

  CustomText.f15w700Underline(
    this.data, {
    super.key,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.color,
    this.textAlign,
    this.autoSize = false,
  }) : _withTypo = ((typo) => typo.f15w700Underline);

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
