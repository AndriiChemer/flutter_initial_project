import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/presentation/widget/custom_gap.dart';
import 'package:iteo_libraries_example/presentation/widget/custom_text.dart';
import 'package:iteo_libraries_example/presentation/widget/responsive/export.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/header.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/my_files.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/recent_files.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/side_menu.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/storage_details.dart';
import 'package:responsive_builder/responsive_builder.dart';
// import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    return _MainWrapper(
      child: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Header(),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        MyFiles(),
                        SizedBox(height: 16),
                        RecentFiles(),
                        if (context.isMobileScreenSize)
                          SizedBox(height: 16),
                        if (context.isMobileScreenSize) StorageDetails(),
                      ],
                    ),
                  ),
                  if (!context.isMobileScreenSize)
                    SizedBox(width: 16),
                  // On Mobile means if the screen is less than 850 we don't want to show it
                  // if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: StorageDetails(),
                    ),
                ],
              ),
              CustomGap.xbig(),
              ResponsiveBuilder(
                builder: (BuildContext context, SizingInformation sizingInformation) {

                  print('ResponsiveBuilder ${sizingInformation.deviceScreenType.name} - ${sizingInformation.screenSize}');
                  // print('ResponsiveBuilder sizingInformation: ${sizingInformation.toString()}');
                  return CustomText.f24w500('ResponsiveBuilder deviceScreenType: ${sizingInformation.deviceScreenType} | ScreenSize: (width: ${sizingInformation.screenSize.width}, height: ${sizingInformation.screenSize.height})');
                },
              ),
              CustomGap.xbig(),
              ScreenTypeBuilder(
                builder: (ScreenType type) {
                  print('ScreenType: ${type.name} | ScreenWidth: ${MediaQuery.sizeOf(context).width}\n\n');

                  return Column(
                    children: [
                      CustomGap.xbig(),
                      CustomText.f24w500('ScreenType: ${type.name}'),
                      CustomGap.md(),
                      // CustomText.f24w500('Responsive: isMobile-$isMobile isTablet-$isTablet isDesktop: $isDesktop'),
                      // CustomGap.md(),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MainWrapper extends StatelessWidget {
  const _MainWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (context.isDesktopScreenSize)
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

