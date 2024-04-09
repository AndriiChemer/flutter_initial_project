import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/dimens.dart';

class CustomDrawerButton extends HookWidget {
  const CustomDrawerButton({
    required this.animation,
    required this.animationController,
    super.key,
  });

  final Animation<double> animation;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => animationController.isCompleted
          ? animationController.reverse()
          : animationController.forward(),
      child: Container(
        width: Dimens.drawerButtonSize,
        height: Dimens.drawerButtonSize,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            color: context.colors.icon,
            progress: animation,
          ),
        ),
      ),
    );
  }
}
