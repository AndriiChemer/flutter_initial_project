import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/presentation/navigation/app_router.dart';
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
  });

  final double drawerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: drawerWidth,
      color: Colors.blueGrey[800],
      child: Padding(
        padding: const EdgeInsets.only(left: Spacings.md),
        child: Column(
          children: [
            const CustomGap.xhuge(),
            _DrawerItem(
              onTap: () => context.router.push(const DashboardRoute()),
            ),
          ],
        ),
      ),
    );
  }
}


class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.transparent,
        child: SizedBox(
          height: Dimens.defaultComponentHeight,
          child: Row(
            children: [
              const CustomGap.xbig(),
              const Icon(Icons.dashboard),
              const CustomGap.sm(),
              CustomText.f15w500('Dashboard'),
            ],
          ),
        ),
      ),
    );
  }
}
