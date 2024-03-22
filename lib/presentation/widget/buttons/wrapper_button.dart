import 'package:flutter/material.dart';

class WrapperButton extends StatelessWidget {
  const WrapperButton._({
    required this.child,
    required this.button,
    this.bottom,
  });

  factory WrapperButton.bottom({
    required Widget child,
    required Widget button,
  }) {
    return WrapperButton._(
      bottom: 0,
      button: button,
      child: child,
    );
  }

  final Widget child;
  final Widget button;
  final double? bottom;

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
          bottom: bottom,
          child: Center(
            child: button,
          ),
        ),
      ],
    );
  }
}
