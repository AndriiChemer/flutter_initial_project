import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/snackbar/snackbar_properties.f.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/spacings.dart';

const _key = 'AppSnackbar';

class AppSnackbar extends StatelessWidget {
  const AppSnackbar({
    required this.title,
    required this.message,
    required this.svgPath,
    required this.closable,
    required this.onCloseTap,
    required this.onDismissed,
    super.key,
  });

  factory AppSnackbar.fromProperties({
    required SnackbarProperties properties,
    required String svgIconPath,
    required VoidCallback onCloseTap,
    required VoidCallback onDismissed,
  }) =>
      AppSnackbar(
        title: properties.title,
        message: properties.message,
        svgPath: properties.iconPath ?? svgIconPath,
        closable: properties.closable,
        onCloseTap: onCloseTap,
        onDismissed: onDismissed,
      );

  final String? title;
  final String message;
  final String svgPath;
  final bool closable;
  final VoidCallback onCloseTap;
  final VoidCallback onDismissed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final shadows = context.shadows;

    return Dismissible(
      key: const Key(_key),
      direction: DismissDirection.up,
      onDismissed: (direction) => onDismissed(),
      child: Material(
        color: colors.tile,
        borderRadius: BorderRadius.circular(Spacings.xsm),
        child: Container(
          padding: const EdgeInsets.all(Spacings.md),
          decoration: BoxDecoration(
            color: colors.tile,
            borderRadius: BorderRadius.circular(Spacings.xsm),
            boxShadow: shadows.shadowsBelowList,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgIcon(
                svgAssetPath: svgPath,
                width: Spacings.lg,
                height: Spacings.lg,
              ),
              const Gap(Spacings.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null) CustomText.style9(title!),
                    CustomText.style7(message),
                  ],
                ),
              ),
              if (closable) ...[
                const Gap(Spacings.md),
                _CloseButton(onCloseTap: onCloseTap),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({
    required this.onCloseTap,
  });

  final VoidCallback onCloseTap;

  @override
  Widget build(BuildContext context) {
    return CustomIconButton.fromWidget(
      icon: const Icon(Icons.close),
      boxSize: Spacings.xbig,
      onTap: onCloseTap,
    );
  }
}
