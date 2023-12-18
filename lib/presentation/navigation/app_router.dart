import 'package:auto_route/auto_route.dart';
import 'package:iteo_libraries_example/presentation/page/main/main_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: MainRoute.page,
    ),
  ];
}