import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/core/extension/build_context_extensions.dart';
import 'package:iteo_libraries_example/domain/app_theme/enum/app_theme_type.dart';
import 'package:iteo_libraries_example/generated/locale_keys.g.dart';
import 'package:iteo_libraries_example/presentation/navigation/app_router.dart';
import 'package:iteo_libraries_example/presentation/page/auth/auth_page.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cars_page.dart';
import 'package:iteo_libraries_example/presentation/page/cars_local/cars_local_page.dart';
import 'package:iteo_libraries_example/presentation/page/home/home_page.dart';
import 'package:iteo_libraries_example/presentation/page/main/enum/bottom_navigation_pages.dart';
import 'package:iteo_libraries_example/presentation/page/main/widget/custom_bottom_navigation_bar.dart';
import 'package:iteo_libraries_example/presentation/page/more/more_page.dart';
import 'package:iteo_libraries_example/presentation/page/user_form/user_form_page.dart';
import 'package:iteo_libraries_example/presentation/widget/theme/animation_durations.dart';

@RoutePage()
class MainPage extends HookWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final selectedPage = useState(BottomNavigationPages.home);
    final title = _mapBottomNavigationBar(selectedPage.value);

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
      body: PageView(
        controller: pageController,
        children: BottomNavigationPages.values.map(_mapPage).toList(),
        onPageChanged: (index) {
          selectedPage.value = BottomNavigationPages.values[index];
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        items: BottomNavigationPages.values,
        selectedIndex: BottomNavigationPages.values.indexOf(selectedPage.value),
        onTap: (index) {
          context.isFlutterTest
              ? pageController.jumpToPage(
                  index,
                )
              : pageController.animateToPage(
                  index,
                  duration: AnimationDurations.fast,
                  curve: Curves.linear,
                );
          selectedPage.value = BottomNavigationPages.values[index];
        },
      ),
    );
  }

  Widget _mapPage(BottomNavigationPages page) {
    switch (page) {
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
      case BottomNavigationPages.authForm:
        return const AuthPage();
    }
  }

  String _mapBottomNavigationBar(BottomNavigationPages page) {
    switch (page) {
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
      case BottomNavigationPages.authForm:
        return LocaleKeys.main_page_navigation_auth.tr();
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
