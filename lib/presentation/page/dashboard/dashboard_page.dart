import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/responsive.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/header.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/my_files.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/recent_files.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/side_menu.dart';
import 'package:iteo_libraries_example/presentation/page/dashboard/widget/storage_details.dart';

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
                        if (Responsive.isMobile(context))
                          SizedBox(height: 16),
                        if (Responsive.isMobile(context)) StorageDetails(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: 16),
                  // On Mobile means if the screen is less than 850 we don't want to show it
                  // if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: StorageDetails(),
                    ),
                ],
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
            if (Responsive.isDesktop(context))
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

