import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/core/extension/future_extensions.dart';
import 'package:iteo_libraries_example/core/extension/target_platform_extension.dart';
import 'package:iteo_libraries_example/presentation/widget/providers/app_colors_provider.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/animation_durations.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/app_colors.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/app_shadows.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/app_typo.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/spacings.dart';
import 'package:provider/provider.dart';

extension BuildContextExtensions on BuildContext {
  AppColors get colors => Provider.of<AppColorsProvider>(this).colors;

  AppTypo get typo => Provider.of<AppTypo>(this);

  AppShadows get shadows => Provider.of<AppShadows>(this);

  EdgeInsetsGeometry safeBottomPadding({double minimum = Spacings.md}) {
    return EdgeInsets.only(
      bottom: math.max(minimum, MediaQuery.of(this).padding.bottom),
    );
  }

  bool get isMobile => Theme.of(this).platform.isMobile;
}

extension NullableBuildContentExtensions on BuildContext? {
  Future<void> ensureVisible({
    double alignment = 0.0,
    Duration duration = AnimationDurations.veryFast,
    Duration scrollDelay = Duration.zero,
    ScrollPositionAlignmentPolicy alignmentPolicy =
        ScrollPositionAlignmentPolicy.explicit,
  }) async {
    final self = this;
    if (self == null) return;
    final renderObject = self.findRenderObject();
    if (renderObject == null) return;

    await ignoreAwaited(
      () => Future.delayed(
        scrollDelay,
        () => Scrollable.of(self).position.ensureVisible(
              renderObject,
              duration: duration,
              alignmentPolicy: alignmentPolicy,
              alignment: alignment,
            ),
      ),
    );
  }
}
