import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/widget/snackbar/app_snackbar.dart';
import 'package:iteo_libraries_example/presentation/widget/snackbar/cubit/snackbar_wrapper_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/snackbar/snackbar_properties.f.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/animation_durations.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/spacings.dart';

part 'snackbar_wrapper_controller.dart';

class SnackbarWrapper extends HookWidget {
  const SnackbarWrapper({
    required this.child,
    required this.snackbarController,
    super.key,
  });

  final Widget child;
  final SnackbarWrapperController snackbarController;

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<SnackbarWrapperCubit>();
    final state =
        useBlocBuilder<SnackbarWrapperCubit, SnackbarWrapperState>(cubit);

    useEffect(
      () {
        snackbarController._infoListener = cubit.showInfoSnackbar;
        snackbarController._errorListener = cubit.showErrorSnackbar;
        snackbarController._closeListener = cubit.closeSnackbar;

        return snackbarController.close;
      },
      [snackbarController],
    );

    return SnackbarWrapperScope(
      snackbarController: snackbarController,
      child: Stack(
        children: [
          child,
          Positioned(
            top: Spacings.md,
            right: Spacings.big,
            left: Spacings.big,
            child: SafeArea(
              child: AnimatedSwitcher(
                duration: AnimationDurations.veryFast,
                child: switch(state) {
                  SnackbarWrapperIdle() => const SizedBox(),
                  SnackbarWrapperShowInfo() => AppSnackbar.fromProperties(
                    properties: state.properties,
                    svgIconPath: '',
                    onCloseTap: cubit.closeSnackbar,
                    onDismissed: cubit.closeSnackbar,
                  ),
                  SnackbarWrapperShowError() => AppSnackbar.fromProperties(
                    properties: state.properties,
                    onCloseTap: cubit.closeSnackbar,
                    onDismissed: cubit.closeSnackbar,
                    svgIconPath: '',
                  ),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SnackbarWrapperScope extends InheritedWidget {
  const SnackbarWrapperScope({
    required super.child,
    required this.snackbarController,
    super.key,
  });

  final SnackbarWrapperController snackbarController;

  @override
  bool updateShouldNotify(SnackbarWrapperScope oldWidget) {
    return child != oldWidget.child ||
        snackbarController != oldWidget.snackbarController;
  }
}
