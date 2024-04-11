import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/model/cloud_storage_info.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';

const _cardSize = 40.0;
const _cardOpacity = 0.1;

class FileItemCard extends StatelessWidget {
  const FileItemCard({
    required this.cloudStorageInfo,
    super.key,
  });

  final CloudStorageInfo cloudStorageInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacings.md),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: const BorderRadius.all(Radius.circular(Dimens.ten)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Header(cloudStorageInfo: cloudStorageInfo),
          CustomText.f14w500(cloudStorageInfo.title),
          ProgressLine(
            color: cloudStorageInfo.color,
            percentage: cloudStorageInfo.percentage,
          ),
          _Info(cloudStorageInfo: cloudStorageInfo),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.cloudStorageInfo,
  });

  final CloudStorageInfo cloudStorageInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(Spacings.sm),
          height: _cardSize,
          width: _cardSize,
          decoration: BoxDecoration(
            color: cloudStorageInfo.color.withOpacity(_cardOpacity),
            borderRadius: const BorderRadius.all(Radius.circular(Spacings.sm)),
          ),
          child: SvgPicture.asset(
            cloudStorageInfo.svgSrc,
            colorFilter: ColorFilter.mode(
              cloudStorageInfo.color,
              BlendMode.srcIn,
            ),
          ),
        ),
        const Icon(Icons.more_vert, color: Colors.white54),
      ],
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({
    required this.cloudStorageInfo,
  });

  final CloudStorageInfo cloudStorageInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText.f14w500('${cloudStorageInfo.numOfFiles} Files'),
        CustomText.f14w500(cloudStorageInfo.totalStorage),
      ],
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    required this.percentage,
    this.color = const Color(0xFF2697FF),
    super.key,
  });

  final Color color;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: Dimens.progressHeight,
          decoration: BoxDecoration(
            color: color.withOpacity(_cardOpacity),
            borderRadius: const BorderRadius.all(Radius.circular(Dimens.ten)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: Dimens.progressHeight,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(Dimens.ten)),
            ),
          ),
        ),
      ],
    );
  }
}
