import 'package:flutter/material.dart';

const _mobileMaxSize = 850;
const _desktopMinSize = 1100;

class Responsive extends StatelessWidget {
  const Responsive({
    required this.mobile,
    required this.desktop,
    this.tablet,
    super.key,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < _mobileMaxSize;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < _desktopMinSize &&
          MediaQuery.of(context).size.width >= _mobileMaxSize;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= _desktopMinSize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    if (size.width >= _desktopMinSize) {
      return desktop;
    } else if (size.width >= _mobileMaxSize && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
