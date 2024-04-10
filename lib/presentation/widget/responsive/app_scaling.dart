import 'dart:math';

import 'package:iteo_libraries_example/presentation/widget/responsive/range_mapper.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/spacings.dart';


final class AppScaling {
  const AppScaling._();

  static const desktopSidebarRangeMapper = RangeMapper(
    inRange: (1280, 1600),
    outRange: (384, 437),
  );

  /// Depth will be clamped to 0...4
  /// Values taken from the DS, outRange takes into account list padding
  static RangeMapper desktopContactsListTileRangeMapper(int depth) {
    final effectiveDepth = min(depth, 4);
    final effectivePadding = Spacings.sm * effectiveDepth;

    return RangeMapper(
      inRange: (384, 438),
      outRange:(287 - effectivePadding, 342 - effectivePadding),
    );
  }
}
