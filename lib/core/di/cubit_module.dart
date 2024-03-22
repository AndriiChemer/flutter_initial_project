import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/get_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/domain/app_theme/use_case/save_app_theme_type_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/clear_cars_from_local_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_isolate_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_from_local_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/get_cars_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_executor_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/load_cars_from_isolate_use_case.dart';
import 'package:iteo_libraries_example/domain/cars/use_case/save_cars_to_database_use_case.dart';
import 'package:iteo_libraries_example/domain/deep_link/use_case/deep_link_stream_use_case.dart';
import 'package:iteo_libraries_example/domain/deep_link/use_case/trigger_deep_links_use_case.dart';
import 'package:iteo_libraries_example/domain/validator/email/email_validator.dart';
import 'package:iteo_libraries_example/domain/validator/name/name_validator.dart';
import 'package:iteo_libraries_example/presentation/page/cars/cubit/cars_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/cars_local/cubit/car_local_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/main/cubit/main_page_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/more/cubit/more_navigation_page_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/settings/cubit/settings_page_cubit.dart';
import 'package:iteo_libraries_example/presentation/page/user_form/cubit/user_form_bloc.dart';
import 'package:iteo_libraries_example/presentation/widget/deep_links/cubit/deep_links_wrapper_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/email/email_input_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/forms/name/name_input_cubit.dart';
import 'package:iteo_libraries_example/presentation/widget/snackbar/cubit/snackbar_wrapper_cubit.dart';

Future<void> injectCubitModule(GetIt getIt) async {
  getIt.registerFactory<MainPageCubit>(() => MainPageCubit());

  getIt.registerFactory<SettingsPageCubit>(() => SettingsPageCubit(
    getIt<SaveAppThemeTypeUseCase>(),
    getIt<GetAppThemeTypeStreamUseCase>(),
  ),);

  getIt.registerFactory<UserFormBloc>(() => UserFormBloc());

  getIt.registerFactory<MoreNavigationPageCubit>(
    () => MoreNavigationPageCubit(getIt<TriggerDeepLinksUseCase>()),
  );
  getIt.registerFactory<DeepLinksWrapperCubit>(
    () => DeepLinksWrapperCubit(getIt<DeepLinkStreamUseCase>()),
  );

  getIt.registerFactory<CarsCubit>(() => CarsCubit(
    getCarsUseCase: getIt<GetCarsUseCase>(),
    getCarsFromIsolateUseCase: getIt<GetCarsFromIsolateUseCase>(),
    loadCarsFromIsolateUseCase: getIt<LoadCarsFromIsolateUseCase>(),
    getCarsFromIsolateExecutorUseCase: getIt<GetCarsFromIsolateExecutorUseCase>(),
    loadCarsFromIsolateExecutorUseCase: getIt<LoadCarsFromIsolateExecutorUseCase>(),
    saveCarsToDatabaseUseCase: getIt<SaveCarsToDatabaseUseCase>(),
  ),);

  getIt.registerFactory<CarLocalCubit>(() => CarLocalCubit(
    getCarsFromLocalUseCase: getIt<GetCarsFromLocalUseCase>(),
    clearCarsFromLocalUseCase: getIt<ClearCarsFromLocalUseCase>(),
  ),);

  await injectWidgetsCubits(getIt);
}

Future<void> injectWidgetsCubits(GetIt getIt) async {
  getIt.registerFactory<SnackbarWrapperCubit>(() => SnackbarWrapperCubit());

  getIt.registerFactory<NameInputCubit>(() => NameInputCubit(
    getIt<NameValidator>(),
  ),);

  getIt.registerFactory<EmailInputCubit>(() => EmailInputCubit(
    getIt<EmailValidator>(),
  ),);
}
