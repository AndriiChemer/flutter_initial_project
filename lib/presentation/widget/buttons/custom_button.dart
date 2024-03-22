import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/presentation/style/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.action,
    this.isActive = true,
    super.key,
  });

  final String title;
  final bool isActive;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppTheme>()!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.elevateButtonTheme.elevatedBackground,
        disabledBackgroundColor: colors.elevateButtonTheme.elevatedBackground.withOpacity(0.5),
        elevation: 0,
      ),
      onPressed: isActive ? action : null,
      child: Text(
        title,
        style: TextStyle(color: colors.elevateButtonTheme.elevatedText),
      ),
    );
  }
}
