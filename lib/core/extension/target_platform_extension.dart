import 'package:flutter/foundation.dart';

extension TargetPlatformExtension on TargetPlatform {
  bool get isMobile => switch (this) {
        TargetPlatform.iOS || TargetPlatform.android => true,
        _ => false,
      };

  bool get isDesktop => switch (this) {
        TargetPlatform.macOS || TargetPlatform.windows => true,
        _ => false,
      };
}
