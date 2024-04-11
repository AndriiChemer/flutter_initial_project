import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/model/recent_file.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    super.key,
  });

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
        children: [
          CustomText.f15w500('Recent Files'),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: Spacings.md,
              columns: [
                DataColumn(
                  label: CustomText.f14w500('File Name'),
                ),
                DataColumn(
                  label: CustomText.f14w500('Date'),
                ),
                DataColumn(
                  label: CustomText.f14w500('Size'),
                ),
              ],
              rows: List.generate(
                demoRecentFiles.length,
                (index) => recentFileDataRow(demoRecentFiles[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon,
              height: Dimens.thirty,
              width: Dimens.thirty,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacings.md),
              child: CustomText.f14w500(fileInfo.title),
            ),
          ],
        ),
      ),
      DataCell(CustomText.f14w500(fileInfo.date)),
      DataCell(CustomText.f14w500(fileInfo.size)),
    ],
  );
}
