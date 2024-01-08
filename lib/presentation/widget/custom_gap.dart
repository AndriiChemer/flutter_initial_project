import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/spacings.dart';

class CustomGap extends StatelessWidget {
  const CustomGap(this.size, {super.key});

  /// 2.0
  const CustomGap.xxxsm({super.key}) : size = Spacings.xxxsm;

  /// 4.0
  const CustomGap.xxsm({super.key}) : size = Spacings.xxsm;

  /// 8.0
  const CustomGap.xsm({super.key}) : size = Spacings.xsm;

  /// 12.0
  const CustomGap.sm({super.key}) : size = Spacings.sm;

  /// 16.0
  const CustomGap.md({super.key}) : size = Spacings.md;

  /// 20.0
  const CustomGap.big({super.key}) : size = Spacings.big;

  /// 24.0
  const CustomGap.xbig({super.key}) : size = Spacings.xbig;

  /// 28.0
  const CustomGap.xxbig({super.key}) : size = Spacings.xxbig;

  /// 32.0
  const CustomGap.xxxbig({super.key}) : size = Spacings.xxxbig;

  /// 40.0
  const CustomGap.lg({super.key}) : size = Spacings.lg;

  /// 48.0
  const CustomGap.xlg({super.key}) : size = Spacings.xlg;

  /// 64.0
  const CustomGap.xxlg({super.key}) : size = Spacings.xxlg;

  /// 80.0
  const CustomGap.xxxlg({super.key}) : size = Spacings.xxxlg;

  /// 96.0
  const CustomGap.huge({super.key}) : size = Spacings.huge;

  /// 128.0
  const CustomGap.xhuge({super.key}) : size = Spacings.xhuge;

  /// 160.0
  const CustomGap.xxhuge({super.key}) : size = Spacings.xxhuge;

  /// 192.0
  const CustomGap.xxxhuge({super.key}) : size = Spacings.xxxhuge;

  final double size;

  @override
  Widget build(BuildContext context) {
    return Gap(size);
  }
}
