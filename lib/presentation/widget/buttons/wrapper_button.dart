import 'package:flutter/material.dart';

class WrapperButton extends StatelessWidget {
  const WrapperButton._({
    required this.child,
    required this.button,
    this.bottom,
    this.top,
  });

  factory WrapperButton.bottom({
    required Widget child,
    required Widget button,
    double bottom = 0.0,
  }) {
    return WrapperButton._(
      bottom: bottom,
      button: button,
      child: child,
    );
  }

  factory WrapperButton.top({
    required Widget child,
    required Widget button,
    double top = 0.0,
  }) {
    return WrapperButton._(
      top: top,
      button: button,
      child: child,
    );
  }

  final Widget child;
  final Widget button;
  final double? bottom;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: child,
        ),
        Positioned(
          left: 0,
          right: 0,
          top: top,
          bottom: bottom,
          child: Center(
            child: button,
          ),
        ),
      ],
    );
  }
}
