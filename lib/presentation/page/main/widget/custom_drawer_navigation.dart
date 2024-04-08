import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/presentation/page/main/widget/custom_drawer_button.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';

const _drawerWidth = 280.0;
const _degree180 = 180.0;
const _childCornerDegree = 24.0;
const _childScale = 0.8;
const _rotationValue = 0.001;

// TODO add light and dark mode
class CustomDrawerNavigation extends HookWidget {
  const CustomDrawerNavigation({
    required this.child,
    this.drawerWidth = _drawerWidth,
    super.key,
  });

  final Widget child;
  final double drawerWidth;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: AnimationDurations.fast,
    );

    final animationDrawerOpenClose = useMemoized(() =>
        Tween<double>(begin: Dimens.zero, end: Dimens.one).animate(animationController),);

    final animationScalingChild = useMemoized(() =>
        Tween<double>(begin: Dimens.one, end: _childScale).animate(animationController),);

    final animationChildCorners = useMemoized(() =>
        Tween<double>(begin: Dimens.zero, end: _childCornerDegree).animate(animationController),);

    return Container(
      color: Colors.blueGrey[800],
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return Stack(
            children: [
              _DrawerMenu(drawerWidth: drawerWidth),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(Dimens.three.toInt(), Dimens.two.toInt(), _rotationValue)
                  ..rotateY(animationDrawerOpenClose.value - Dimens.thirty * animationDrawerOpenClose.value * pi / _degree180),
                child: Transform.translate(
                  offset: Offset(animationDrawerOpenClose.value * drawerWidth, Dimens.zero),
                  child: Transform.scale(
                    scale: animationScalingChild.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(animationChildCorners.value),
                      child: child,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: Spacings.xxbig,
                left: Spacings.md * animationDrawerOpenClose.value,
                child: CustomDrawerButton(
                  animation: animationDrawerOpenClose,
                  animationController: animationController,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DrawerMenu extends StatelessWidget {
  const _DrawerMenu({
    required this.drawerWidth,
    super.key,
  });

  final double drawerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: drawerWidth,
      color: Colors.blueGrey[800],
      child: Column(

      ),
    );
  }
}

