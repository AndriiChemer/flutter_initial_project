import 'package:flutter/material.dart';

enum ScreenSize {
  small(300),
  normal(400),
  large(600),
  extraLarge(1200);

  const ScreenSize(this.size);

  final double size;
}

ScreenSize getScreenSize(BuildContext context) {
  final deviceWidth = MediaQuery.sizeOf(context).shortestSide;

  if (deviceWidth > ScreenSize.extraLarge.size) return ScreenSize.extraLarge;
  if (deviceWidth > ScreenSize.large.size) return ScreenSize.large;
  if (deviceWidth > ScreenSize.normal.size) return ScreenSize.normal;
  return ScreenSize.small;
}
