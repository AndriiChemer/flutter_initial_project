// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fimber/fimber.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../data/app_theme/app_theme_type_storage_impl.dart' as _i55;
import '../../data/cars/car_local_repository_impl.dart' as _i51;
import '../../data/cars/car_repository_impl.dart' as _i52;
import '../../data/cars/mapper/car_dto_to_car_mapper.dart' as _i5;
import '../../data/cars/remote/car_remote_data_source.dart' as _i31;
import '../../data/database/drift_local_database.db.dart' as _i16;
import '../../data/deep_link/deep_link_repository_impl.dart' as _i48;
import '../../data/network/authorized_api_client.dart' as _i28;
import '../../data/network/interceptor/access_token_interceptor.dart' as _i20;
import '../../data/security/security_repository_impl.dart' as _i49;
import '../../data/user/local/user_local_storage_impl.dart' as _i21;
import '../../data/user/user_repository_impl.dart' as _i50;
import '../../domain/app_theme/app_theme_type_storage.dart' as _i23;
import '../../domain/app_theme/use_case/get_app_theme_type_use_case.dart'
    as _i32;
import '../../domain/app_theme/use_case/save_app_theme_type_use_case.dart'
    as _i33;
import '../../domain/cars/car_local_repository.dart' as _i24;
import '../../domain/cars/car_repository.dart' as _i41;
import '../../domain/cars/use_case/clear_cars_from_local_use_case.dart' as _i37;
import '../../domain/cars/use_case/get_cars_from_isolate_executor_use_case.dart'
    as _i43;
import '../../domain/cars/use_case/get_cars_from_local_use_case.dart' as _i38;
import '../../domain/cars/use_case/get_cars_use_case.dart' as _i42;
import '../../domain/cars/use_case/load_cars_from_isolate_executor_use_case.dart'
    as _i44;
import '../../domain/cars/use_case/save_cars_to_database_use_case.dart' as _i39;
import '../../domain/deep_link/deep_link_repository.dart' as _i14;
import '../../domain/deep_link/use_case/deep_link_stream_use_case.dart' as _i26;
import '../../domain/deep_link/use_case/trigger_deep_links_use_case.dart'
    as _i27;
import '../../domain/security/security_repository.dart' as _i15;
import '../../domain/user/user_repository.dart' as _i22;
import '../../domain/validator/email/email_validator.dart' as _i11;
import '../../domain/validator/name/name_validator.dart' as _i10;
import '../../domain/validator/phone/phone_number_validator.dart' as _i12;
import '../../presentation/page/auth/cubit/auth_bloc.dart' as _i30;
import '../../presentation/page/cars/cubit/cars_cubit.dart' as _i45;
import '../../presentation/page/cars_local/cubit/car_local_cubit.dart' as _i40;
import '../../presentation/page/main/cubit/main_page_cubit.dart' as _i3;
import '../../presentation/page/more/cubit/more_navigation_page_cubit.dart'
    as _i35;
import '../../presentation/page/settings/cubit/settings_page_cubit.dart'
    as _i34;
import '../../presentation/page/user_form/cubit/user_form_bloc.dart' as _i36;
import '../../presentation/widget/deep_links/cubit/deep_links_wrapper_cubit.dart'
    as _i29;
import '../../presentation/widget/forms/email/email_controller.dart' as _i18;
import '../../presentation/widget/forms/email/email_input_cubit.dart' as _i17;
import '../../presentation/widget/forms/name/name_input_cubit.dart' as _i25;
import '../../presentation/widget/forms/phone/phone_controller.dart' as _i19;
import '../../presentation/widget/snackbar/cubit/snackbar_wrapper_cubit.dart'
    as _i4;
import '../app_env.dart' as _i13;
import '../logger/crashlytics_reporting_tree.dart' as _i6;
import 'module/config_module.dart' as _i53;
import 'module/cubit_module.dart' as _i46;
import 'module/data_source_module.dart' as _i60;
import 'module/input_controller_module.dart' as _i57;
import 'module/networking_module.dart' as _i58;
import 'module/repository_module.dart' as _i47;
import 'module/storage_module.dart' as _i54;
import 'module/use_case_module.dart' as _i59;
import 'module/validator_module.dart' as _i56;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final cubitModule = _$CubitModule(this);
    final repositoryModule = _$RepositoryModule(this);
    final configModule = _$ConfigModule();
    final storageModule = _$StorageModule(this);
    final validatorModule = _$ValidatorModule();
    final inputControllerModule = _$InputControllerModule(this);
    final networkingModule = _$NetworkingModule(this);
    final useCaseModule = _$UseCaseModule(this);
    final dataSourceModule = _$DataSourceModule(this);
    gh.factory<_i3.MainPageCubit>(() => cubitModule.mainPageCubit);
    gh.factory<_i4.SnackbarWrapperCubit>(
        () => cubitModule.snackbarWrapperCubit);
    gh.factory<_i5.CarDTOToCarMapper>(() => repositoryModule.carDTOToCarMapper);
    gh.singleton<_i6.CrashlyticsReportingTree>(
        () => configModule.crashlyticsReporter);
    gh.singleton<_i7.DebugTree>(() => configModule.logger);
    gh.lazySingleton<_i8.FlutterSecureStorage>(
        () => storageModule.secureStorage);
    await gh.lazySingletonAsync<_i9.SharedPreferences>(
      () => storageModule.getPrefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i10.NameValidator>(() => validatorModule.nameValidator);
    gh.lazySingleton<_i11.EmailValidator>(() => validatorModule.emailValidator);
    gh.lazySingleton<_i12.PhoneNumberValidator>(
        () => validatorModule.phoneNumberValidator);
    gh.singleton<_i13.AppEnv>(
      () => configModule.envDev,
      registerFor: {_dev},
    );
    gh.lazySingleton<_i14.DeepLinkRepository>(
        () => repositoryModule.deepLinkRepository);
    gh.lazySingleton<_i15.SecurityRepository>(
        () => repositoryModule.securityRepository);
    await gh.lazySingletonAsync<_i16.DriftLocalDatabase>(
      () => storageModule.driftDatabase(gh<_i15.SecurityRepository>()),
      preResolve: true,
    );
    gh.factory<_i17.EmailInputCubit>(() => cubitModule.emailInputCubit);
    gh.factory<_i18.EmailController>(
        () => inputControllerModule.emailController);
    gh.factory<_i19.PhoneController>(
        () => inputControllerModule.phoneController);
    gh.factory<_i20.AccessTokenInterceptor>(
        () => networkingModule.accessTokenInterceptor);
    gh.singleton<_i13.AppEnv>(
      () => configModule.envProd,
      registerFor: {_prod},
    );
    gh.lazySingleton<_i21.UserLocalStorage>(
        () => storageModule.userLocalStorage);
    gh.lazySingleton<_i22.UserRepository>(
        () => repositoryModule.userRepository);
    gh.lazySingleton<_i23.AppThemeTypeStorage>(
        () => storageModule.appThemeTypeStorage);
    gh.lazySingleton<_i24.CarLocalRepository>(
        () => repositoryModule.carLocalRepository);
    gh.factory<_i25.NameInputCubit>(() => cubitModule.mameInputCubit);
    gh.factory<_i25.SurnameInputCubit>(() => cubitModule.surnameInputCubit);
    gh.factory<_i26.DeepLinkStreamUseCase>(
        () => useCaseModule.deepLinkStreamUseCase);
    gh.factory<_i27.TriggerDeepLinksUseCase>(
        () => useCaseModule.triggerDeepLinksUseCase);
    gh.lazySingleton<_i28.AuthorizedApiClient>(
        () => networkingModule.authorizedApiClient);
    gh.factory<_i29.DeepLinksWrapperCubit>(
        () => cubitModule.deepLinksWrapperCubit);
    gh.factory<_i30.AuthBloc>(() => cubitModule.authBloc);
    gh.lazySingleton<_i31.CarRemoteDataSource>(
        () => dataSourceModule.carRemoteDataSourceImpl);
    gh.factory<_i32.GetAppThemeTypeStreamUseCase>(
        () => useCaseModule.getAppThemeTypeStreamUseCase);
    gh.factory<_i33.SaveAppThemeTypeUseCase>(
        () => useCaseModule.saveAppThemeTypeUseCase);
    gh.factory<_i34.SettingsPageCubit>(() => cubitModule.settingsPageCubit);
    gh.factory<_i35.MoreNavigationPageCubit>(
        () => cubitModule.moreNavigationPageCubit);
    gh.factory<_i36.UserFormBloc>(() => cubitModule.userFormBloc);
    gh.factory<_i37.ClearCarsFromLocalUseCase>(
        () => useCaseModule.clearCarsFromLocalUseCase);
    gh.factory<_i38.GetCarsFromLocalUseCase>(
        () => useCaseModule.getCarsFromLocalUseCase);
    gh.factory<_i39.SaveCarsToDatabaseUseCase>(
        () => useCaseModule.saveCarsToDatabaseUseCase);
    gh.factory<_i40.CarLocalCubit>(() => cubitModule.carLocalCubit);
    gh.lazySingleton<_i41.CarRepository>(() => repositoryModule.carRepository);
    gh.factory<_i42.GetCarsUseCase>(() => useCaseModule.getCarsUseCase);
    gh.factory<_i43.GetCarsFromIsolateExecutorUseCase>(
        () => useCaseModule.getCarsFromIsolateExecutorUseCase);
    gh.factory<_i44.LoadCarsFromIsolateExecutorUseCase>(
        () => useCaseModule.loadCarsFromIsolateExecutorUseCase);
    gh.factory<_i45.CarsCubit>(() => cubitModule.carsCubit);
    return this;
  }
}

class _$CubitModule extends _i46.CubitModule {
  _$CubitModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.MainPageCubit get mainPageCubit => _i3.MainPageCubit();

  @override
  _i4.SnackbarWrapperCubit get snackbarWrapperCubit =>
      _i4.SnackbarWrapperCubit();

  @override
  _i17.EmailInputCubit get emailInputCubit =>
      _i17.EmailInputCubit(_getIt<_i11.EmailValidator>());

  @override
  _i25.NameInputCubit get mameInputCubit =>
      _i25.NameInputCubit(_getIt<_i10.NameValidator>());

  @override
  _i25.SurnameInputCubit get surnameInputCubit =>
      _i25.SurnameInputCubit(_getIt<_i10.NameValidator>());

  @override
  _i29.DeepLinksWrapperCubit get deepLinksWrapperCubit =>
      _i29.DeepLinksWrapperCubit(_getIt<_i26.DeepLinkStreamUseCase>());

  @override
  _i30.AuthBloc get authBloc => _i30.AuthBloc(
        _getIt<_i19.PhoneController>(),
        _getIt<_i18.EmailController>(),
      );

  @override
  _i34.SettingsPageCubit get settingsPageCubit => _i34.SettingsPageCubit(
        _getIt<_i33.SaveAppThemeTypeUseCase>(),
        _getIt<_i32.GetAppThemeTypeStreamUseCase>(),
      );

  @override
  _i35.MoreNavigationPageCubit get moreNavigationPageCubit =>
      _i35.MoreNavigationPageCubit(_getIt<_i27.TriggerDeepLinksUseCase>());

  @override
  _i36.UserFormBloc get userFormBloc =>
      _i36.UserFormBloc(_getIt<_i22.UserRepository>());

  @override
  _i40.CarLocalCubit get carLocalCubit => _i40.CarLocalCubit(
        getCarsFromLocalUseCase: _getIt<_i38.GetCarsFromLocalUseCase>(),
        clearCarsFromLocalUseCase: _getIt<_i37.ClearCarsFromLocalUseCase>(),
      );

  @override
  _i45.CarsCubit get carsCubit => _i45.CarsCubit(
        getCarsUseCase: _getIt<_i42.GetCarsUseCase>(),
        saveCarsToDatabaseUseCase: _getIt<_i39.SaveCarsToDatabaseUseCase>(),
        getCarsFromIsolateExecutorUseCase:
            _getIt<_i43.GetCarsFromIsolateExecutorUseCase>(),
        loadCarsFromIsolateExecutorUseCase:
            _getIt<_i44.LoadCarsFromIsolateExecutorUseCase>(),
      );
}

class _$RepositoryModule extends _i47.RepositoryModule {
  _$RepositoryModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i5.CarDTOToCarMapper get carDTOToCarMapper => _i5.CarDTOToCarMapper();

  @override
  _i48.DeepLinkRepositoryImpl get deepLinkRepository =>
      _i48.DeepLinkRepositoryImpl();

  @override
  _i49.SecurityRepositoryImpl get securityRepository =>
      _i49.SecurityRepositoryImpl(_getIt<_i8.FlutterSecureStorage>());

  @override
  _i50.UserRepositoryImpl get userRepository =>
      _i50.UserRepositoryImpl(_getIt<_i21.UserLocalStorage>());

  @override
  _i51.CarLocalRepositoryImpl get carLocalRepository =>
      _i51.CarLocalRepositoryImpl(_getIt<_i16.DriftLocalDatabase>());

  @override
  _i52.CarRepositoryImpl get carRepository => _i52.CarRepositoryImpl(
        carRemoteDataSource: _getIt<_i31.CarRemoteDataSource>(),
        carDTOToCarMapper: _getIt<_i5.CarDTOToCarMapper>(),
      );
}

class _$ConfigModule extends _i53.ConfigModule {}

class _$StorageModule extends _i54.StorageModule {
  _$StorageModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i21.UserLocalStorageImpl get userLocalStorage =>
      _i21.UserLocalStorageImpl(_getIt<_i9.SharedPreferences>());

  @override
  _i55.AppThemeTypeStorageImpl get appThemeTypeStorage =>
      _i55.AppThemeTypeStorageImpl(_getIt<_i9.SharedPreferences>());
}

class _$ValidatorModule extends _i56.ValidatorModule {
  @override
  _i10.NameValidator get nameValidator => _i10.NameValidator();

  @override
  _i11.EmailValidator get emailValidator => _i11.EmailValidator();

  @override
  _i12.PhoneNumberValidator get phoneNumberValidator =>
      _i12.PhoneNumberValidator();
}

class _$InputControllerModule extends _i57.InputControllerModule {
  _$InputControllerModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i18.EmailController get emailController =>
      _i18.EmailController(_getIt<_i11.EmailValidator>());

  @override
  _i19.PhoneController get phoneController =>
      _i19.PhoneController(_getIt<_i12.PhoneNumberValidator>());
}

class _$NetworkingModule extends _i58.NetworkingModule {
  _$NetworkingModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i20.AccessTokenInterceptor get accessTokenInterceptor =>
      _i20.AccessTokenInterceptor(_getIt<_i13.AppEnv>());

  @override
  _i28.AuthorizedApiClient get authorizedApiClient => _i28.AuthorizedApiClient(
        appEnv: _getIt<_i13.AppEnv>(),
        accessTokenInterceptor: _getIt<_i20.AccessTokenInterceptor>(),
      );
}

class _$UseCaseModule extends _i59.UseCaseModule {
  _$UseCaseModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i26.DeepLinkStreamUseCase get deepLinkStreamUseCase =>
      _i26.DeepLinkStreamUseCase(_getIt<_i14.DeepLinkRepository>());

  @override
  _i27.TriggerDeepLinksUseCase get triggerDeepLinksUseCase =>
      _i27.TriggerDeepLinksUseCase(_getIt<_i14.DeepLinkRepository>());

  @override
  _i32.GetAppThemeTypeStreamUseCase get getAppThemeTypeStreamUseCase =>
      _i32.GetAppThemeTypeStreamUseCase(_getIt<_i23.AppThemeTypeStorage>());

  @override
  _i33.SaveAppThemeTypeUseCase get saveAppThemeTypeUseCase =>
      _i33.SaveAppThemeTypeUseCase(_getIt<_i23.AppThemeTypeStorage>());

  @override
  _i37.ClearCarsFromLocalUseCase get clearCarsFromLocalUseCase =>
      _i37.ClearCarsFromLocalUseCase(_getIt<_i24.CarLocalRepository>());

  @override
  _i38.GetCarsFromLocalUseCase get getCarsFromLocalUseCase =>
      _i38.GetCarsFromLocalUseCase(_getIt<_i24.CarLocalRepository>());

  @override
  _i39.SaveCarsToDatabaseUseCase get saveCarsToDatabaseUseCase =>
      _i39.SaveCarsToDatabaseUseCase(_getIt<_i24.CarLocalRepository>());

  @override
  _i42.GetCarsUseCase get getCarsUseCase =>
      _i42.GetCarsUseCase(_getIt<_i41.CarRepository>());

  @override
  _i43.GetCarsFromIsolateExecutorUseCase
      get getCarsFromIsolateExecutorUseCase =>
          _i43.GetCarsFromIsolateExecutorUseCase(_getIt<_i41.CarRepository>());

  @override
  _i44.LoadCarsFromIsolateExecutorUseCase
      get loadCarsFromIsolateExecutorUseCase =>
          _i44.LoadCarsFromIsolateExecutorUseCase(_getIt<_i41.CarRepository>());
}

class _$DataSourceModule extends _i60.DataSourceModule {
  _$DataSourceModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i31.CarRemoteDataSourceImpl get carRemoteDataSourceImpl =>
      _i31.CarRemoteDataSourceImpl.create(_getIt<_i28.AuthorizedApiClient>());
}
