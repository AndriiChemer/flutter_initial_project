import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/presentation/page/auth/auth_page.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cars_page.dart';
import 'package:iteo_libraries_example/presentation/page/cars_local/cars_local_page.dart';
import 'package:iteo_libraries_example/presentation/page/deep_links/deep_links_page.dart';
import 'package:iteo_libraries_example/presentation/page/home/home_page.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page_auto_route_bottom_nav.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page_bottom_nav.dart';
import 'package:iteo_libraries_example/presentation/page/more/more_page.dart';
import 'package:iteo_libraries_example/presentation/page/settings/settings_page.dart';
import 'package:iteo_libraries_example/presentation/page/user_form/user_form_page.dart';

part 'app_router.gr.dart';

const _animationDuration = 200;

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: MainRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: UserFormRoute.page,
            ),
            AutoRoute(
              page: CarsRoute.page,
            ),
            AutoRoute(
              page: CarsLocalRoute.page,
            ),
            AutoRoute(
              page: AuthRoute.page,
            ),
            AutoRoute(
              page: MoreRoute.page,
              keepHistory: false,
            ),
          ],
        ),
        CustomRoute(
          page: SettingsRoute.page,
          durationInMilliseconds: _animationDuration,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        CustomRoute(
          page: MainRouteAutoRouteBottomNavRoute.page,
          durationInMilliseconds: _animationDuration,
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: UserFormRoute.page,
            ),
            AutoRoute(
              page: CarsRoute.page,
            ),
            AutoRoute(
              page: CarsLocalRoute.page,
            ),
            AutoRoute(
              page: AuthRoute.page,
            ),
            AutoRoute(
              page: MoreRoute.page,
              keepHistory: false,
            ),
          ],
        ),
        CustomRoute(
          page: MainRouteBottomNav.page,
          durationInMilliseconds: _animationDuration,
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: UserFormRoute.page,
            ),
            AutoRoute(
              page: CarsRoute.page,
            ),
            AutoRoute(
              page: CarsLocalRoute.page,
            ),
            AutoRoute(
              page: AuthRoute.page,
            ),
            AutoRoute(
              page: MoreRoute.page,
              keepHistory: false,
            ),
          ],
        ),
        AutoRoute(
          path: '/deeplinks/:id/:name',
          page: DeepLinksRoute.page,
        ),
      ];
}
