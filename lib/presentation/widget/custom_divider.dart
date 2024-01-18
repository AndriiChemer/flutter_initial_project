import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/dimens.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    this.color,
    super.key,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = this.color ?? colors.border_50;

    return Divider(
      color: color,
      height: Dimens.one,
      thickness: Dimens.one,
    );
  }
}
