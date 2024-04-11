import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/model/cloud_storage_info.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/file_item_card.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/responsive/export.dart';

const _mobileMaxSize = 650.0;
const _desktopSize = 1400.0;

class Files extends StatelessWidget {
  const Files({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      children: [
        const _TitleHeader(),
        const CustomGap.md(),
        ScreenTypeBuilder(
          builder: (type) => switch(type) {
            ScreenType.mobile => FileInfoCardGridView(
              crossAxisCount: size.width < _mobileMaxSize
                  ? Dimens.two.toInt()
                  : Dimens.four.toInt(),
              childAspectRatio: size.width < _mobileMaxSize
                  && size.width > 350
                  ? 1.3 : 1,
            ),
            ScreenType.tablet => const FileInfoCardGridView(),
            ScreenType.desktop => FileInfoCardGridView(
              childAspectRatio: size.width < _desktopSize ? 1.1 : 1.4,
            ),
          },
        ),
      ],
    );
  }
}

class _TitleHeader extends StatelessWidget {
  const _TitleHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText.f15w500('My Files'),
        CustomButton(
          title: 'Add New',
          action: () {},
        ),
      ],
    );
  }
}


class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: Spacings.md,
        mainAxisSpacing: Spacings.md,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileItemCard(
        cloudStorageInfo: demoMyFiles[index],
      ),
    );
  }
}
