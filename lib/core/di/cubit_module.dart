import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/save_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/domain/validator/name/name_validator.dart';
import 'package:iteo_libraries_example/presentation/page/main/cubit/main_page_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/settings/cubit/settings_page_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/user_form/cubit/user_form_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/name/name_input_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/snackbar/cubit/snackbar_wrapper_cubit.dart';

Future<void> injectCubitModule(GetIt getIt) async {
  getIt.registerFactory<MainPageCubit>(() => MainPageCubit());

  getIt.registerFactory<SettingsPageCubit>(() => SettingsPageCubit(
    getIt<SaveAppThemeTypeUseCase>(),
    getIt<GetAppThemeTypeStreamUseCase>(),
  ));

  getIt.registerFactory<SnackbarWrapperCubit>(() => SnackbarWrapperCubit());

  getIt.registerFactory<UserFormBloc>(() => UserFormBloc());

  getIt.registerFactory<NameInputCubit>(() => NameInputCubit(
    getIt<NameValidator>(),
  ));
}
