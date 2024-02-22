import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iteo_libraries_example/presentation/page/deep_links/deep_links_page.dart';
import 'package:iteo_libraries_example/presentation/page/home/home_page.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page.dart';
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
    AutoRoute(
      path: '/deeplinks/:id/:name',
      page: DeepLinksRoute.page,
    ),
  ];
}
