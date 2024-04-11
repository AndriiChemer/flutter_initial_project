import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/responsive/export.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class SearchAndProfile extends StatelessWidget {
  const SearchAndProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!context.isDesktopScreenSize)
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              if (!scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.openDrawer();
              }
            },
          ),
        if (!context.isMobileScreenSize)
          CustomText.f18w500('Dashboard'),
        if (!context.isMobileScreenSize)
          Spacer(flex: context.isDesktopScreenSize ? 2 : 1),
        const Expanded(child: SearchField()),
        const ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: Dimens.defaultComponentHeight,
      margin: const EdgeInsets.only(left: Spacings.md),
      padding: const EdgeInsets.symmetric(
        horizontal: Spacings.md,
        vertical: Spacings.xsm,
      ),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: const BorderRadius.all(Radius.circular(Dimens.ten)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/profile_pic.png',
            height: Dimens.smallButtonHeight,
          ),
          if (!context.isMobileScreenSize)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacings.xsm),
              child: CustomText.f15w500('Angelina Jolie'),
            ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: colors.card,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(Dimens.ten)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(Spacings.xsm),
            margin: const EdgeInsets.symmetric(horizontal: Spacings.xsm),
            decoration: BoxDecoration(
              color: colors.iconBackground,
              borderRadius: const BorderRadius.all(Radius.circular(Dimens.ten)),
            ),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
        ),
      ),
    );
  }
}