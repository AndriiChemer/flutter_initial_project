// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fimber/fimber.dart' as _i299;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/app_theme/app_theme_type_storage_impl.dart' as _i721;
import '../../data/cars/car_local_repository_impl.dart' as _i174;
import '../../data/cars/car_repository_impl.dart' as _i304;
import '../../data/cars/mapper/car_dto_to_car_mapper.dart' as _i296;
import '../../data/cars/remote/car_remote_data_source.dart' as _i886;
import '../../data/database/drift_local_database.db.dart' as _i52;
import '../../data/deep_link/deep_link_repository_impl.dart' as _i671;
import '../../data/network/authorized_api_client.dart' as _i851;
import '../../data/network/interceptor/access_token_interceptor.dart' as _i535;
import '../../data/security/security_repository_impl.dart' as _i947;
import '../../data/user/local/user_local_storage_impl.dart' as _i280;
import '../../data/user/user_repository_impl.dart' as _i619;
import '../../domain/app_theme/app_theme_type_storage.dart' as _i67;
import '../../domain/app_theme/use_case/get_app_theme_type_use_case.dart'
    as _i238;
import '../../domain/app_theme/use_case/save_app_theme_type_use_case.dart'
    as _i284;
import '../../domain/cars/car_local_repository.dart' as _i946;
import '../../domain/cars/car_repository.dart' as _i499;
import '../../domain/cars/use_case/get_cars_from_isolate_executor_use_case.dart'
    as _i242;
import '../../domain/cars/use_case/get_cars_use_case.dart' as _i39;
import '../../domain/cars/use_case/load_cars_from_isolate_executor_use_case.dart'
    as _i580;
import '../../domain/cars/use_case/manage_local_cars_use_case.dart' as _i610;
import '../../domain/deep_link/deep_link_repository.dart' as _i180;
import '../../domain/deep_link/use_case/deep_link_stream_use_case.dart'
    as _i806;
import '../../domain/deep_link/use_case/trigger_deep_links_use_case.dart'
    as _i36;
import '../../domain/security/security_repository.dart' as _i582;
import '../../domain/user/user_repository.dart' as _i291;
import '../../domain/validator/email/email_validator.dart' as _i177;
import '../../domain/validator/name/name_validator.dart' as _i416;
import '../../domain/validator/phone/phone_number_validator.dart' as _i103;
import '../../presentation/page/auth/cubit/auth_bloc.dart' as _i801;
import '../../presentation/page/cars/cubit/cars_cubit.dart' as _i420;
import '../../presentation/page/cars_local/cubit/car_local_cubit.dart' as _i937;
import '../../presentation/page/main/cubit/main_page_cubit.dart' as _i186;
import '../../presentation/page/more/cubit/more_navigation_page_cubit.dart'
    as _i169;
import '../../presentation/page/settings/cubit/settings_page_cubit.dart'
    as _i678;
import '../../presentation/page/user_form/cubit/user_form_bloc.dart' as _i382;
import '../../presentation/widget/deep_links/cubit/deep_links_wrapper_cubit.dart'
    as _i550;
import '../../presentation/widget/forms/email/email_controller.dart' as _i287;
import '../../presentation/widget/forms/email/email_input_cubit.dart' as _i572;
import '../../presentation/widget/forms/name/name_input_cubit.dart' as _i384;
import '../../presentation/widget/forms/phone/phone_controller.dart' as _i770;
import '../../presentation/widget/snackbar/cubit/snackbar_wrapper_cubit.dart'
    as _i137;
import '../app_env.dart' as _i205;
import '../logger/crashlytics_reporting_tree.dart' as _i414;
import 'module/config_module.dart' as _i102;
import 'module/cubit_module.dart' as _i912;
import 'module/data_source_module.dart' as _i490;
import 'module/input_controller_module.dart' as _i11;
import 'module/networking_module.dart' as _i966;
import 'module/repository_module.dart' as _i1059;
import 'module/storage_module.dart' as _i847;
import 'module/use_case_module.dart' as _i741;
import 'module/validator_module.dart' as _i98;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
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
    gh.factory<_i186.MainPageCubit>(() => cubitModule.mainPageCubit);
    gh.factory<_i137.SnackbarWrapperCubit>(
        () => cubitModule.snackbarWrapperCubit);
    gh.factory<_i296.CarDTOToCarMapper>(
        () => repositoryModule.carDTOToCarMapper);
    gh.singleton<_i414.CrashlyticsReportingTree>(
        () => configModule.crashlyticsReporter);
    gh.singleton<_i299.DebugTree>(() => configModule.logger);
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => storageModule.secureStorage);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => storageModule.getPrefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i416.NameValidator>(() => validatorModule.nameValidator);
    gh.lazySingleton<_i177.EmailValidator>(
        () => validatorModule.emailValidator);
    gh.lazySingleton<_i103.PhoneNumberValidator>(
        () => validatorModule.phoneNumberValidator);
    gh.singleton<_i205.AppEnv>(
      () => configModule.envDev,
      registerFor: {_dev},
    );
    gh.lazySingleton<_i180.DeepLinkRepository>(
        () => repositoryModule.deepLinkRepository);
    gh.lazySingleton<_i582.SecurityRepository>(
        () => repositoryModule.securityRepository);
    await gh.lazySingletonAsync<_i52.DriftLocalDatabase>(
      () => storageModule.driftDatabase(gh<_i582.SecurityRepository>()),
      preResolve: true,
    );
    gh.factory<_i572.EmailInputCubit>(() => cubitModule.emailInputCubit);
    gh.factory<_i287.EmailController>(
        () => inputControllerModule.emailController);
    gh.factory<_i770.PhoneController>(
        () => inputControllerModule.phoneController);
    gh.factory<_i535.AccessTokenInterceptor>(
        () => networkingModule.accessTokenInterceptor);
    gh.singleton<_i205.AppEnv>(
      () => configModule.envProd,
      registerFor: {_prod},
    );
    gh.lazySingleton<_i280.UserLocalStorage>(
        () => storageModule.userLocalStorage);
    gh.lazySingleton<_i291.UserRepository>(
        () => repositoryModule.userRepository);
    gh.lazySingleton<_i67.AppThemeTypeStorage>(
        () => storageModule.appThemeTypeStorage);
    gh.lazySingleton<_i946.CarLocalRepository>(
        () => repositoryModule.carLocalRepository);
    gh.factory<_i384.NameInputCubit>(() => cubitModule.mameInputCubit);
    gh.factory<_i384.SurnameInputCubit>(() => cubitModule.surnameInputCubit);
    gh.factory<_i806.DeepLinkStreamUseCase>(
        () => useCaseModule.deepLinkStreamUseCase);
    gh.factory<_i36.TriggerDeepLinksUseCase>(
        () => useCaseModule.triggerDeepLinksUseCase);
    gh.lazySingleton<_i851.AuthorizedApiClient>(
        () => networkingModule.authorizedApiClient);
    gh.factory<_i550.DeepLinksWrapperCubit>(
        () => cubitModule.deepLinksWrapperCubit);
    gh.factory<_i801.AuthBloc>(() => cubitModule.authBloc);
    gh.lazySingleton<_i886.CarRemoteDataSource>(
        () => dataSourceModule.carRemoteDataSourceImpl);
    gh.factory<_i238.GetAppThemeTypeStreamUseCase>(
        () => useCaseModule.getAppThemeTypeStreamUseCase);
    gh.factory<_i284.SaveAppThemeTypeUseCase>(
        () => useCaseModule.saveAppThemeTypeUseCase);
    gh.factory<_i678.SettingsPageCubit>(() => cubitModule.settingsPageCubit);
    gh.factory<_i169.MoreNavigationPageCubit>(
        () => cubitModule.moreNavigationPageCubit);
    gh.factory<_i382.UserFormBloc>(() => cubitModule.userFormBloc);
    gh.factory<_i610.ManageLocalCarsUseCase>(
        () => useCaseModule.manageLocalCarsUseCase);
    gh.lazySingleton<_i499.CarRepository>(() => repositoryModule.carRepository);
    gh.factory<_i937.CarLocalCubit>(() => cubitModule.carLocalCubit);
    gh.factory<_i39.GetCarsUseCase>(() => useCaseModule.getCarsUseCase);
    gh.factory<_i242.GetCarsFromIsolateExecutorUseCase>(
        () => useCaseModule.getCarsFromIsolateExecutorUseCase);
    gh.factory<_i580.LoadCarsFromIsolateExecutorUseCase>(
        () => useCaseModule.loadCarsFromIsolateExecutorUseCase);
    gh.factory<_i420.CarsCubit>(() => cubitModule.carsCubit);
    return this;
  }
}

class _$CubitModule extends _i912.CubitModule {
  _$CubitModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i186.MainPageCubit get mainPageCubit => _i186.MainPageCubit();

  @override
  _i137.SnackbarWrapperCubit get snackbarWrapperCubit =>
      _i137.SnackbarWrapperCubit();

  @override
  _i572.EmailInputCubit get emailInputCubit =>
      _i572.EmailInputCubit(_getIt<_i177.EmailValidator>());

  @override
  _i384.NameInputCubit get mameInputCubit =>
      _i384.NameInputCubit(_getIt<_i416.NameValidator>());

  @override
  _i384.SurnameInputCubit get surnameInputCubit =>
      _i384.SurnameInputCubit(_getIt<_i416.NameValidator>());

  @override
  _i550.DeepLinksWrapperCubit get deepLinksWrapperCubit =>
      _i550.DeepLinksWrapperCubit(_getIt<_i806.DeepLinkStreamUseCase>());

  @override
  _i801.AuthBloc get authBloc => _i801.AuthBloc(
        _getIt<_i770.PhoneController>(),
        _getIt<_i287.EmailController>(),
      );

  @override
  _i678.SettingsPageCubit get settingsPageCubit => _i678.SettingsPageCubit(
        _getIt<_i284.SaveAppThemeTypeUseCase>(),
        _getIt<_i238.GetAppThemeTypeStreamUseCase>(),
      );

  @override
  _i169.MoreNavigationPageCubit get moreNavigationPageCubit =>
      _i169.MoreNavigationPageCubit(_getIt<_i36.TriggerDeepLinksUseCase>());

  @override
  _i382.UserFormBloc get userFormBloc =>
      _i382.UserFormBloc(_getIt<_i291.UserRepository>());

  @override
  _i937.CarLocalCubit get carLocalCubit => _i937.CarLocalCubit(
      manageLocalCarsUseCase: _getIt<_i610.ManageLocalCarsUseCase>());

  @override
  _i420.CarsCubit get carsCubit => _i420.CarsCubit(
        getCarsUseCase: _getIt<_i39.GetCarsUseCase>(),
        manageLocalCarsUseCase: _getIt<_i610.ManageLocalCarsUseCase>(),
        getCarsFromIsolateExecutorUseCase:
            _getIt<_i242.GetCarsFromIsolateExecutorUseCase>(),
        loadCarsFromIsolateExecutorUseCase:
            _getIt<_i580.LoadCarsFromIsolateExecutorUseCase>(),
      );
}

class _$RepositoryModule extends _i1059.RepositoryModule {
  _$RepositoryModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i296.CarDTOToCarMapper get carDTOToCarMapper => _i296.CarDTOToCarMapper();

  @override
  _i671.DeepLinkRepositoryImpl get deepLinkRepository =>
      _i671.DeepLinkRepositoryImpl();

  @override
  _i947.SecurityRepositoryImpl get securityRepository =>
      _i947.SecurityRepositoryImpl(_getIt<_i558.FlutterSecureStorage>());

  @override
  _i619.UserRepositoryImpl get userRepository =>
      _i619.UserRepositoryImpl(_getIt<_i280.UserLocalStorage>());

  @override
  _i174.CarLocalRepositoryImpl get carLocalRepository =>
      _i174.CarLocalRepositoryImpl(_getIt<_i52.DriftLocalDatabase>());

  @override
  _i304.CarRepositoryImpl get carRepository => _i304.CarRepositoryImpl(
        carRemoteDataSource: _getIt<_i886.CarRemoteDataSource>(),
        carDTOToCarMapper: _getIt<_i296.CarDTOToCarMapper>(),
      );
}

class _$ConfigModule extends _i102.ConfigModule {}

class _$StorageModule extends _i847.StorageModule {
  _$StorageModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i280.UserLocalStorageImpl get userLocalStorage =>
      _i280.UserLocalStorageImpl(_getIt<_i460.SharedPreferences>());

  @override
  _i721.AppThemeTypeStorageImpl get appThemeTypeStorage =>
      _i721.AppThemeTypeStorageImpl(_getIt<_i460.SharedPreferences>());
}

class _$ValidatorModule extends _i98.ValidatorModule {
  @override
  _i416.NameValidator get nameValidator => _i416.NameValidator();

  @override
  _i177.EmailValidator get emailValidator => _i177.EmailValidator();

  @override
  _i103.PhoneNumberValidator get phoneNumberValidator =>
      _i103.PhoneNumberValidator();
}

class _$InputControllerModule extends _i11.InputControllerModule {
  _$InputControllerModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i287.EmailController get emailController =>
      _i287.EmailController(_getIt<_i177.EmailValidator>());

  @override
  _i770.PhoneController get phoneController =>
      _i770.PhoneController(_getIt<_i103.PhoneNumberValidator>());
}

class _$NetworkingModule extends _i966.NetworkingModule {
  _$NetworkingModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i535.AccessTokenInterceptor get accessTokenInterceptor =>
      _i535.AccessTokenInterceptor(_getIt<_i205.AppEnv>());

  @override
  _i851.AuthorizedApiClient get authorizedApiClient =>
      _i851.AuthorizedApiClient(
        appEnv: _getIt<_i205.AppEnv>(),
        accessTokenInterceptor: _getIt<_i535.AccessTokenInterceptor>(),
      );
}

class _$UseCaseModule extends _i741.UseCaseModule {
  _$UseCaseModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i806.DeepLinkStreamUseCase get deepLinkStreamUseCase =>
      _i806.DeepLinkStreamUseCase(_getIt<_i180.DeepLinkRepository>());

  @override
  _i36.TriggerDeepLinksUseCase get triggerDeepLinksUseCase =>
      _i36.TriggerDeepLinksUseCase(_getIt<_i180.DeepLinkRepository>());

  @override
  _i238.GetAppThemeTypeStreamUseCase get getAppThemeTypeStreamUseCase =>
      _i238.GetAppThemeTypeStreamUseCase(_getIt<_i67.AppThemeTypeStorage>());

  @override
  _i284.SaveAppThemeTypeUseCase get saveAppThemeTypeUseCase =>
      _i284.SaveAppThemeTypeUseCase(_getIt<_i67.AppThemeTypeStorage>());

  @override
  _i610.ManageLocalCarsUseCase get manageLocalCarsUseCase =>
      _i610.ManageLocalCarsUseCase(_getIt<_i946.CarLocalRepository>());

  @override
  _i39.GetCarsUseCase get getCarsUseCase =>
      _i39.GetCarsUseCase(_getIt<_i499.CarRepository>());

  @override
  _i242.GetCarsFromIsolateExecutorUseCase
      get getCarsFromIsolateExecutorUseCase =>
          _i242.GetCarsFromIsolateExecutorUseCase(
              _getIt<_i499.CarRepository>());

  @override
  _i580.LoadCarsFromIsolateExecutorUseCase
      get loadCarsFromIsolateExecutorUseCase =>
          _i580.LoadCarsFromIsolateExecutorUseCase(
              _getIt<_i499.CarRepository>());
}

class _$DataSourceModule extends _i490.DataSourceModule {
  _$DataSourceModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i886.CarRemoteDataSourceImpl get carRemoteDataSourceImpl =>
      _i886.CarRemoteDataSourceImpl.create(_getIt<_i851.AuthorizedApiClient>());
}
