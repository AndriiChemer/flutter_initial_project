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
    final deviceWidth = MediaQuery.sizeOf(context).shortestSide;

    if (deviceWidth >= _desktopMinSize) return ScreenType.desktop;

    if (deviceWidth >= _mobileMaxSize && deviceWidth < _desktopMinSize) {
      return ScreenType.tablet;
    }

    return ScreenType.mobile;
  }
}
