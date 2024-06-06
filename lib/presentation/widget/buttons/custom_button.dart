import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/presentation/style/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.action,
    this.isActive = true,
    this.fullWidth = false,
    this.padding,
    super.key,
  });

  factory CustomButton.fullWidth({
    required String title,
    required VoidCallback action,
  }) {
    return CustomButton(
      fullWidth: true,
      title: title,
      action: action,
    );
  }

  final String title;
  final bool isActive;
  final bool fullWidth;
  final VoidCallback action;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppTheme>()!;

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.elevateButtonTheme.elevatedBackground,
            disabledBackgroundColor:
                colors.elevateButtonTheme.elevatedBackground.withOpacity(0.5),
            elevation: 0,
          ),
          onPressed: isActive ? action : null,
          child: Text(
            title,
            style: TextStyle(
              color: colors.elevateButtonTheme.elevatedText,
            ),
          ),
        ),
      ),
    );
  }
}
