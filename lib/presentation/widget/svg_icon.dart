import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    required this.svgAssetPath,
    super.key,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.width,
    this.height,
    this.color,
  });

  const SvgIcon.withColor({
    required this.svgAssetPath,
    required this.color,
    super.key,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.width,
    this.height,
  });

  SvgIcon.platform({
    required String androidIcon,
    required String iosIcon,
    super.key,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.width,
    this.height,
  }) : svgAssetPath = Platform.isAndroid ? androidIcon : iosIcon;

  final String svgAssetPath;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgAssetPath,
      fit: fit,
      width: width,
      height: height,
      alignment: alignment,
      color: color,
    );
  }
}
