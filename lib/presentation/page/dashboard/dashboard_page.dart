import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/files.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/recent_files.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/search_profile.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/side_menu.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/storage_details.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';
import 'package:iteo_libraries_example/presentation/widget/responsive/export.dart';

const _partScreen5 = 5;
const _partScreen2 = 2;

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      drawer: context.isMobileOrTabletScreenSize ? const SideMenu() : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (context.isDesktopScreenSize)
              const Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: _partScreen5,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(Spacings.md),
                  primary: false,
                  child: Column(
                    children: [
                      const SearchAndProfile(),
                      const CustomGap.md(),
                      ScreenTypeBuilder(
                        builder: (type) => switch(type) {
                          ScreenType.desktop => const _Desktop(),
                          _ => const _Mobile(),
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: _partScreen5,
          child: Column(
            children: [
              Files(),
              CustomGap.md(),
              RecentFiles(),
            ],
          ),
        ),
        CustomGap.md(),
        Expanded(
          flex: _partScreen2,
          child: StorageDetails(),
        ),
      ],
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Files(),
        CustomGap.md(),
        RecentFiles(),
        CustomGap.md(),
        StorageDetails(),
      ],
    );
  }
}
