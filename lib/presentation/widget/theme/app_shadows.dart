import 'package:flutter/cupertino.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/app_colors.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/dimens.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/spacings.dart';

class AppShadows {
  AppShadows(this._colors);

  final AppColors _colors;

  List<BoxShadow> get shadowsAboveList => [
        BoxShadow(
          blurRadius: Spacings.md,
          color: _colors.aboveShadow,
          offset: const Offset(Dimens.zero, -Dimens.eight),
        )
      ];

  List<BoxShadow> get shadowsBelowList => [
        BoxShadow(
          blurRadius: Spacings.md,
          color: _colors.overlay.withOpacity(0.1),
          offset: const Offset(Dimens.zero, Dimens.eight),
        )
      ];
}
