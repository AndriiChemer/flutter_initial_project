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
