import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/navigation/app_router.dart';
import 'package:iteo_libraries_example/presentation/page/main/enum/bottom_navigation_pages.dart';

@RoutePage()
class MainPageAutoRouteBottomNavPage extends HookWidget {
  const MainPageAutoRouteBottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: BottomNavigationPages.values.map(_mapPage).toList(),
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        final label = _mapBottomNavigationBar(BottomNavigationPages.values[tabsRouter.activeIndex]).label;
        return Scaffold(
          appBar: AppBar(
            title: Text(label ?? ''),
            actions: [
              IconButton(
                onPressed: () => context.router.push(const SettingsRoute()),
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            items: BottomNavigationPages.values.map(_mapBottomNavigationBar).toList(),
          ),
        );
      },
    );
  }

  PageRouteInfo<dynamic> _mapPage(BottomNavigationPages page) {
    switch(page) {
      case BottomNavigationPages.home:
        return const HomeRoute();
      case BottomNavigationPages.userForms:
        return const UserFormRoute();
      case BottomNavigationPages.more:
        return const MoreRoute();
      case BottomNavigationPages.localCars:
        return const CarsLocalRoute();
      case BottomNavigationPages.cars:
        return const CarsRoute();
    }
  }

  BottomNavigationBarItem _mapBottomNavigationBar(BottomNavigationPages page) {
    switch(page) {
      case BottomNavigationPages.home:
        return BottomNavigationBarItem(
          label: LocaleKeys.main_page_navigation_home.tr(),
          icon: const Icon(Icons.home),
        );
      case BottomNavigationPages.userForms:
        return BottomNavigationBarItem(
          label: LocaleKeys.main_page_navigation_user_form.tr(),
          icon: const Icon(Icons.insert_drive_file),
        );
      case BottomNavigationPages.more:
        return BottomNavigationBarItem(
          label: LocaleKeys.main_page_navigation_more.tr(),
          icon: const Icon(Icons.more_horiz),
        );
      case BottomNavigationPages.cars:
        return BottomNavigationBarItem(
          label: LocaleKeys.main_page_navigation_cars_cached.tr(),
          icon: const Icon(Icons.car_rental),
        );
      case BottomNavigationPages.localCars:
        return BottomNavigationBarItem(
          label: LocaleKeys.main_page_navigation_cars_database.tr(),
          icon: const Icon(Icons.car_repair_rounded),
        );
    }
  }
}

class RadioButton extends StatelessWidget {
  const RadioButton({
    required this.appThemeType,
    required this.selectedAppThemeType,
    required this.action,
    super.key,
  });

  final AppThemeType selectedAppThemeType;
  final AppThemeType appThemeType;
  final void Function(AppThemeType? appThemeType) action;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(appThemeType.name),
      leading: Radio<AppThemeType>(
        value: appThemeType,
        groupValue: selectedAppThemeType,
        onChanged: action,
      ),
    );
  }
}
