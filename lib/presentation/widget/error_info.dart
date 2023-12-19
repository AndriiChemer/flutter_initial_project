import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/presentation/widget/custom_text.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/spacings.dart';

class ErrorInfo extends StatelessWidget {
  const ErrorInfo({
    required this.error,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.padding = const EdgeInsets.all(Spacings.xsm),
  });

  final MainAxisAlignment mainAxisAlignment;
  final String error;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          const Icon(Icons.warning_amber),
          const SizedBox(width: Spacings.xsm),
          Flexible(
            flex: 1,
            child: CustomText.style9(
              error,
              color: context.colors.error,
            ),
          ),
        ],
      ),
    );
  }
}
