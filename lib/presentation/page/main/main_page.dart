import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/navigation/app_router.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cars_page.dart';
import 'package:iteo_libraries_example/presentation/page/cars_local/cars_local_page.dart';
import 'package:iteo_libraries_example/presentation/page/home/home_page.dart';
import 'package:iteo_libraries_example/presentation/page/main/widget/custom_bottom_navigation_bar.dart';
import 'package:iteo_libraries_example/presentation/page/more/more_page.dart';
import 'package:iteo_libraries_example/presentation/page/user_form/user_form_page.dart';

enum BottomNavigationPages {
  home,
  cars,
  localCars,
  userForms,
  more,
}

@RoutePage()
class MainPage extends HookWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPage = useState(BottomNavigationPages.home);
    final title = _mapBottomNavigationBar(selectedPage.value) ?? '';

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () => context.router.push(const SettingsRoute()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: _mapPage(selectedPage.value),
      bottomNavigationBar: CustomBottomNavigationBar(
        items: BottomNavigationPages.values,
        selectedIndex: BottomNavigationPages.values.indexOf(selectedPage.value),
        onTap: (index) => selectedPage.value = BottomNavigationPages.values[index],
      ),
    );

    // return AutoTabsRouter.tabBar(
    //   routes: BottomNavigationPages.values.map(_mapPage).toList(),
    //   builder: (context, child, _) {
    //     final tabsRouter = AutoTabsRouter.of(context);
    //     final label = _mapBottomNavigationBar(BottomNavigationPages.values[tabsRouter.activeIndex]).label;
    //     return Scaffold(
    //       appBar: AppBar(
    //         title: Text(label ?? ''),
    //         actions: [
    //           IconButton(
    //             onPressed: () => context.router.push(const SettingsRoute()),
    //             icon: const Icon(Icons.settings),
    //           ),
    //         ],
    //       ),
    //       body: child,
    //       bottomNavigationBar: BottomNavigationBar(
    //         currentIndex: tabsRouter.activeIndex,
    //         onTap: (index) => tabsRouter.setActiveIndex(index),
    //         items: BottomNavigationPages.values.map(_mapBottomNavigationBar).toList(),
    //       ),
    //     );
    //   },
    // );
  }

  Widget _mapPage(BottomNavigationPages page) {
    switch(page) {
      case BottomNavigationPages.home:
        return const HomePage();
      case BottomNavigationPages.userForms:
        return const UserFormPage();
      case BottomNavigationPages.more:
        return const MorePage();
      case BottomNavigationPages.cars:
        return const CarsPage();
      case BottomNavigationPages.localCars:
        return const CarsLocalPage();
    }
  }

  // PageRouteInfo<dynamic> _mapPage(BottomNavigationPages page) {
  //   switch(page) {
  //     case BottomNavigationPages.home:
  //       return const HomeRoute();
  //     case BottomNavigationPages.userForms:
  //       return const UserFormRoute();
  //     case BottomNavigationPages.more:
  //       return const MoreRoute();
  //     case BottomNavigationPages.localCars:
  //       return const CarsLocalRoute();
  //   }
  // }

  String _mapBottomNavigationBar(BottomNavigationPages page) {
    switch(page) {
      case BottomNavigationPages.home:
        return LocaleKeys.main_page_navigation_home.tr();
      case BottomNavigationPages.userForms:
        return LocaleKeys.main_page_navigation_user_form.tr();
      case BottomNavigationPages.more:
        return LocaleKeys.main_page_navigation_more.tr();
      case BottomNavigationPages.cars:
        return LocaleKeys.main_page_navigation_cars_cached.tr();
      case BottomNavigationPages.localCars:
        return LocaleKeys.main_page_navigation_cars_database.tr();
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
