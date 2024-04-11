import 'package:flutter/material.dart';

const _mobileMaxSize = 850;
const _desktopMinSize = 1100;

enum ScreenType {
  mobile,
  tablet,
  desktop;
}

class ScreenTypeBuilder extends StatelessWidget {
  const ScreenTypeBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(ScreenType type) builder;

  @override
  Widget build(BuildContext context) {
    return builder(_getScreenSize(context));
  }

  ScreenType _getScreenSize(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;

    if (deviceWidth >= _desktopMinSize) return ScreenType.desktop;

    if (deviceWidth >= _mobileMaxSize && deviceWidth < _desktopMinSize) {
      return ScreenType.tablet;
    }

    return ScreenType.mobile;
  }
}

extension ScreenTypeExtension on BuildContext {
  bool get isMobileScreenSize =>
      MediaQuery.of(this).size.width < _mobileMaxSize;

  bool get isTabletScreenSize =>
      MediaQuery.of(this).size.width < _desktopMinSize &&
          MediaQuery.of(this).size.width >= _mobileMaxSize;

  bool get isDesktopScreenSize =>
      MediaQuery.of(this).size.width >= _desktopMinSize;

  bool get isMobileOrTabletScreenSize =>
      isMobileScreenSize || isTabletScreenSize;
}
