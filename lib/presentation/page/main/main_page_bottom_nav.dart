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
import 'package:iteo_libraries_example/presentation/page/main/enum/bottom_navigation_pages.dart';
import 'package:iteo_libraries_example/presentation/page/more/more_page.dart';
import 'package:iteo_libraries_example/presentation/page/user_form/user_form_page.dart';
import 'package:iteo_libraries_example/presentation/style/app_theme.dart';

@RoutePage()
class MainPageBottomNav extends HookWidget {
  const MainPageBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppTheme>()!;
    final selectedPage = useState(BottomNavigationPages.home);
    final title = _mapBottomNavigationBar(selectedPage.value).label ?? '';

    return Scaffold(
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: colors.bottomNavigationItem.activeItemColor,
        unselectedItemColor: colors.bottomNavigationItem.unselectedItemColor,
        currentIndex: BottomNavigationPages.values.indexOf(selectedPage.value),
        onTap: (index) => selectedPage.value = BottomNavigationPages.values[index],
        items: BottomNavigationPages.values.map(_mapBottomNavigationBar).toList(),
      ),
    );
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
