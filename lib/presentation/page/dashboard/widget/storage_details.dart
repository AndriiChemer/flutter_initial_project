import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/chart.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.only(left: Spacings.md),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: const BorderRadius.all(Radius.circular(Dimens.ten)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.f18w500('Storage Details'),
          const CustomGap.md(),
          const Chart(),

          const StorageInfoCard(
            svgSrc: 'assets/icons/Documents.svg',
            title: 'Documents Files',
            amountOfFiles: '1.3GB',
            numOfFiles: 1328,
          ),
          const StorageInfoCard(
            svgSrc: 'assets/icons/media.svg',
            title: 'Media Files',
            amountOfFiles: '15.3GB',
            numOfFiles: 1328,
          ),
          const StorageInfoCard(
            svgSrc: 'assets/icons/folder.svg',
            title: 'Other Files',
            amountOfFiles: '1.3GB',
            numOfFiles: 1328,
          ),
          const StorageInfoCard(
            svgSrc: 'assets/icons/unknown.svg',
            title: 'Unknown',
            amountOfFiles: '1.3GB',
            numOfFiles: 140,
          ),
        ],
      ),
    );
  }
}

class StorageInfoCard extends StatelessWidget {
  const StorageInfoCard({
    required this.title,
    required this.svgSrc,
    required this.amountOfFiles,
    required this.numOfFiles,
    super.key,
  });

  final String title;
  final String svgSrc;
  final int numOfFiles;
  final String amountOfFiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Spacings.md),
      padding: const EdgeInsets.all(Spacings.md),
      decoration: BoxDecoration(
        border: Border.all(
          width: Dimens.borderWidth,
          color: const Color(0xFF2697FF).withOpacity(0.15),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(Spacings.md)),
      ),
      child: Row(
        children: [
          SizedBox(
            height: Dimens.twenty,
            width: Dimens.twenty,
            child: SvgPicture.asset(svgSrc),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacings.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.f14w500(title),
                  CustomText.f12w500('$numOfFiles Files'),
                ],
              ),
            ),
          ),
          Text(amountOfFiles),
        ],
      ),
    );
  }
}
