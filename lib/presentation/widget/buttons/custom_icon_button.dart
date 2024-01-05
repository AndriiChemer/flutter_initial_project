import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/spacings.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.onTap,
    this.svgAssetPath,
    this.icon,
    super.key,
    this.label,
    this.color,
    this.boxSize = Spacings.xxxbig,
    this.assetSize,
  });

  CustomIconButton.fromSvgPath({
    required String iconPath,
    required this.onTap,
    super.key,
    this.label,
    this.color,
    this.boxSize = Spacings.xxxbig,
    this.assetSize,
    this.icon,
  }) : svgAssetPath = iconPath;

  CustomIconButton.fromWidget({
    required Widget icon,
    required this.onTap,
    super.key,
    this.label,
    this.color,
    this.boxSize = Spacings.xxxbig,
    this.assetSize,
    this.svgAssetPath,
  }) : icon = icon;

  final String? svgAssetPath;
  final Widget? icon;
  final String? label;
  final Color? color;
  final double boxSize;
  final double? assetSize;
  final VoidCallback? onTap;

  Widget get _icon {
    if(svgAssetPath != null) {
      return SvgPicture.asset(
        svgAssetPath!,
        color: color,
        width: assetSize,
        height: assetSize,
      );
    } else if(icon != null) {
      return icon!;
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      constraints: BoxConstraints.tightFor(
        width: boxSize,
        height: boxSize,
      ),
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: _icon,
          ),
          if (label?.isNotEmpty == true) ...[
            CustomText.style9(
              label!,
              color: color,
            ),
          ],
        ],
      ),
    );
  }
}
