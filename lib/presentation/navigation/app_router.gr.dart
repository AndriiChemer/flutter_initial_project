// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthPage(),
      );
    },
    CarsLocalRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CarsLocalPage(),
      );
    },
    CarsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CarsPage(),
      );
    },
    DeepLinksRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DeepLinksRouteArgs>(
          orElse: () => DeepLinksRouteArgs(
                id: pathParams.getInt('id'),
                name: pathParams.getString('name'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DeepLinksPage(
          id: args.id,
          name: args.name,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    MainRouteAutoRouteBottomNavRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPageAutoRouteBottomNavPage(),
      );
    },
    MainRouteBottomNav.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPageBottomNav(),
      );
    },
    MoreRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MorePage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    UserFormRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserFormPage(),
      );
    },
  };
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CarsLocalPage]
class CarsLocalRoute extends PageRouteInfo<void> {
  const CarsLocalRoute({List<PageRouteInfo>? children})
      : super(
          CarsLocalRoute.name,
          initialChildren: children,
        );

  static const String name = 'CarsLocalRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CarsPage]
class CarsRoute extends PageRouteInfo<void> {
  const CarsRoute({List<PageRouteInfo>? children})
      : super(
          CarsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CarsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DeepLinksPage]
class DeepLinksRoute extends PageRouteInfo<DeepLinksRouteArgs> {
  DeepLinksRoute({
    required int id,
    required String name,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DeepLinksRoute.name,
          args: DeepLinksRouteArgs(
            id: id,
            name: name,
            key: key,
          ),
          rawPathParams: {
            'id': id,
            'name': name,
          },
          initialChildren: children,
        );

  static const String name = 'DeepLinksRoute';

  static const PageInfo<DeepLinksRouteArgs> page =
      PageInfo<DeepLinksRouteArgs>(name);
}

class DeepLinksRouteArgs {
  const DeepLinksRouteArgs({
    required this.id,
    required this.name,
    this.key,
  });

  final int id;

  final String name;

  final Key? key;

  @override
  String toString() {
    return 'DeepLinksRouteArgs{id: $id, name: $name, key: $key}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPageAutoRouteBottomNavPage]
class MainRouteAutoRouteBottomNavRoute extends PageRouteInfo<void> {
  const MainRouteAutoRouteBottomNavRoute({List<PageRouteInfo>? children})
      : super(
          MainRouteAutoRouteBottomNavRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRouteAutoRouteBottomNavRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPageBottomNav]
class MainRouteBottomNav extends PageRouteInfo<void> {
  const MainRouteBottomNav({List<PageRouteInfo>? children})
      : super(
          MainRouteBottomNav.name,
          initialChildren: children,
        );

  static const String name = 'MainRouteBottomNav';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MorePage]
class MoreRoute extends PageRouteInfo<void> {
  const MoreRoute({List<PageRouteInfo>? children})
      : super(
          MoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserFormPage]
class UserFormRoute extends PageRouteInfo<void> {
  const UserFormRoute({List<PageRouteInfo>? children})
      : super(
          UserFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserFormRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
