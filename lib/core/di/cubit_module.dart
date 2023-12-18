import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/save_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/presentation/page/main/cubit/main_page_cubit.dart';

Future<void> injectCubitModule(GetIt getIt) async {
  getIt.registerFactory<MainPageCubit>(() => MainPageCubit(
      getIt<SaveAppThemeTypeUseCase>(),
      getIt<GetAppThemeTypeStreamUseCase>(),
  ));
}
