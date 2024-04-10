import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/model/recent_file.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2A2D3E),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.f15w500(
            "Recent Files",
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: 16,
              // minWidth: 600,
              columns: [
                DataColumn(
                  label: CustomText.f14w500("File Name"),
                ),
                DataColumn(
                  label: CustomText.f14w500("Date"),
                ),
                DataColumn(
                  label: CustomText.f14w500("Size"),
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
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomText.f14w500(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(CustomText.f14w500(fileInfo.date!)),
      DataCell(CustomText.f14w500(fileInfo.size!)),
    ],
  );
}