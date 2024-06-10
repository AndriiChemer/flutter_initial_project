import 'package:injectable/injectable.dart';
import 'package:iteo_libraries_example/presentation/page/auth/cubit/auth_bloc.dart';
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

@module
abstract class CubitModule {
  @injectable
  MainPageCubit get mainPageCubit;

  @injectable
  SettingsPageCubit get settingsPageCubit;

  @injectable
  UserFormBloc get userFormBloc;

  @injectable
  MoreNavigationPageCubit get moreNavigationPageCubit;

  @injectable
  DeepLinksWrapperCubit get deepLinksWrapperCubit;

  @injectable
  CarsCubit get carsCubit;

  @injectable
  CarLocalCubit get carLocalCubit;

  @injectable
  SnackbarWrapperCubit get snackbarWrapperCubit;

  @injectable
  NameInputCubit get mameInputCubit;

  @injectable
  SurnameInputCubit get surnameInputCubit;

  @injectable
  EmailInputCubit get emailInputCubit;

  @injectable
  AuthBloc get authBloc;
}
