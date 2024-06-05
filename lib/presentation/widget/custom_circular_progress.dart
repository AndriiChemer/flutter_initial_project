import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';

const _progressValue = 79.0;

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: context.isFlutterTest
          ? const CircularProgressIndicator(value: _progressValue)
          : const CircularProgressIndicator(),
    );
  }
}
