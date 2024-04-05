// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../data/app_theme/app_theme_type_storage_impl.dart' as _i45;
import '../../data/cars/car_local_repository_impl.dart' as _i41;
import '../../data/cars/car_repository_impl.dart' as _i43;
import '../../data/cars/mapper/car_dto_to_car_mapper.dart' as _i6;
import '../../data/cars/remote/car_remote_data_source.dart' as _i23;
import '../../data/database/drift_local_database.db.dart' as _i8;
import '../../data/deep_link/deep_link_repository_impl.dart' as _i40;
import '../../data/network/authorized_api_client.dart' as _i21;
import '../../data/network/interceptor/access_token_interceptor.dart' as _i14;
import '../../data/security/security_repository_impl.dart' as _i42;
import '../../domain/app_theme/app_theme_type_storage.dart' as _i16;
import '../../domain/app_theme/use_case/get_app_theme_type_use_case.dart'
    as _i25;
import '../../domain/app_theme/use_case/save_app_theme_type_use_case.dart'
    as _i26;
import '../../domain/cars/car_local_repository.dart' as _i17;
import '../../domain/cars/car_repository.dart' as _i33;
import '../../domain/cars/use_case/clear_cars_from_local_use_case.dart' as _i29;
import '../../domain/cars/use_case/get_cars_from_isolate_executor_use_case.dart'
    as _i35;
import '../../domain/cars/use_case/get_cars_from_local_use_case.dart' as _i30;
import '../../domain/cars/use_case/get_cars_use_case.dart' as _i34;
import '../../domain/cars/use_case/load_cars_from_isolate_executor_use_case.dart'
    as _i36;
import '../../domain/cars/use_case/save_cars_to_database_use_case.dart' as _i31;
import '../../domain/deep_link/deep_link_repository.dart' as _i12;
import '../../domain/deep_link/use_case/deep_link_stream_use_case.dart' as _i19;
import '../../domain/deep_link/use_case/trigger_deep_links_use_case.dart'
    as _i20;
import '../../domain/security/security_repository.dart' as _i24;
import '../../domain/validator/email/email_validator.dart' as _i10;
import '../../domain/validator/name/name_validator.dart' as _i9;
import '../../presentation/page/cars/cubit/cars_cubit.dart' as _i37;
import '../../presentation/page/cars_local/cubit/car_local_cubit.dart' as _i32;
import '../../presentation/page/main/cubit/main_page_cubit.dart' as _i3;
import '../../presentation/page/more/cubit/more_navigation_page_cubit.dart'
    as _i28;
import '../../presentation/page/settings/cubit/settings_page_cubit.dart'
    as _i27;
import '../../presentation/page/user_form/cubit/user_form_bloc.dart' as _i4;
import '../../presentation/widget/deep_links/cubit/deep_links_wrapper_cubit.dart'
    as _i22;
import '../../presentation/widget/forms/email/email_input_cubit.dart' as _i13;
import '../../presentation/widget/forms/name/name_input_cubit.dart' as _i18;
import '../../presentation/widget/snackbar/cubit/snackbar_wrapper_cubit.dart'
    as _i5;
import '../app_env.dart' as _i11;
import 'module/config_module.dart' as _i47;
import 'module/cubit_module.dart' as _i38;
import 'module/data_source_module.dart' as _i50;
import 'module/networking_module.dart' as _i48;
import 'module/repository_module.dart' as _i39;
import 'module/storage_module.dart' as _i44;
import 'module/use_case_module.dart' as _i49;
import 'module/validator_module.dart' as _i46;

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
    final storageModule = _$StorageModule(this);
    final validatorModule = _$ValidatorModule();
    final configModule = _$ConfigModule();
    final networkingModule = _$NetworkingModule(this);
    final useCaseModule = _$UseCaseModule(this);
    final dataSourceModule = _$DataSourceModule(this);
    gh.factory<_i3.MainPageCubit>(() => cubitModule.mainPageCubit);
    gh.factory<_i4.UserFormBloc>(() => cubitModule.userFormBloc);
    gh.factory<_i5.SnackbarWrapperCubit>(
        () => cubitModule.snackbarWrapperCubit);
    gh.factory<_i6.CarDTOToCarMapper>(() => repositoryModule.carDTOToCarMapper);
    await gh.lazySingletonAsync<_i7.SharedPreferences>(
      () => storageModule.getPrefs(),
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i8.DriftLocalDatabase>(
      () => storageModule.driftDatabase(),
      preResolve: true,
    );
    gh.lazySingleton<_i9.NameValidator>(() => validatorModule.nameValidator);
    gh.lazySingleton<_i10.EmailValidator>(() => validatorModule.emailValidator);
    gh.singleton<_i11.AppEnv>(
      () => configModule.envDev,
      registerFor: {_dev},
    );
    gh.lazySingleton<_i12.DeepLinkRepository>(
        () => repositoryModule.deepLinkRepository);
    gh.factory<_i13.EmailInputCubit>(() => cubitModule.emailInputCubit);
    gh.factory<_i14.AccessTokenInterceptor>(
        () => networkingModule.accessTokenInterceptor);
    gh.lazySingleton<_i15.FlutterSecureStorage>(
        () => storageModule.flutterSecureStorage);
    gh.singleton<_i11.AppEnv>(
      () => configModule.envProd,
      registerFor: {_prod},
    );
    gh.lazySingleton<_i16.AppThemeTypeStorage>(
        () => storageModule.appThemeTypeStorage);
    gh.lazySingleton<_i17.CarLocalRepository>(
        () => repositoryModule.carLocalRepository);
    gh.factory<_i18.NameInputCubit>(() => cubitModule.mameInputCubit);
    gh.factory<_i19.DeepLinkStreamUseCase>(
        () => useCaseModule.deepLinkStreamUseCase);
    gh.factory<_i20.TriggerDeepLinksUseCase>(
        () => useCaseModule.triggerDeepLinksUseCase);
    gh.lazySingleton<_i21.AuthorizedApiClient>(
        () => networkingModule.authorizedApiClient);
    gh.factory<_i22.DeepLinksWrapperCubit>(
        () => cubitModule.deepLinksWrapperCubit);
    gh.lazySingleton<_i23.CarRemoteDataSource>(
        () => dataSourceModule.carRemoteDataSourceImpl);
    gh.lazySingleton<_i24.SecurityRepository>(
        () => repositoryModule.securityRepository);
    gh.factory<_i25.GetAppThemeTypeStreamUseCase>(
        () => useCaseModule.getAppThemeTypeStreamUseCase);
    gh.factory<_i26.SaveAppThemeTypeUseCase>(
        () => useCaseModule.saveAppThemeTypeUseCase);
    gh.factory<_i27.SettingsPageCubit>(() => cubitModule.settingsPageCubit);
    gh.factory<_i28.MoreNavigationPageCubit>(
        () => cubitModule.moreNavigationPageCubit);
    gh.factory<_i29.ClearCarsFromLocalUseCase>(
        () => useCaseModule.clearCarsFromLocalUseCase);
    gh.factory<_i30.GetCarsFromLocalUseCase>(
        () => useCaseModule.getCarsFromLocalUseCase);
    gh.factory<_i31.SaveCarsToDatabaseUseCase>(
        () => useCaseModule.saveCarsToDatabaseUseCase);
    gh.factory<_i32.CarLocalCubit>(() => cubitModule.carLocalCubit);
    gh.lazySingleton<_i33.CarRepository>(() => repositoryModule.carRepository);
    gh.factory<_i34.GetCarsUseCase>(() => useCaseModule.getCarsUseCase);
    gh.factory<_i35.GetCarsFromIsolateExecutorUseCase>(
        () => useCaseModule.getCarsFromIsolateExecutorUseCase);
    gh.factory<_i36.LoadCarsFromIsolateExecutorUseCase>(
        () => useCaseModule.loadCarsFromIsolateExecutorUseCase);
    gh.factory<_i37.CarsCubit>(() => cubitModule.carsCubit);
    return this;
  }
}

class _$CubitModule extends _i38.CubitModule {
  _$CubitModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.MainPageCubit get mainPageCubit => _i3.MainPageCubit();

  @override
  _i4.UserFormBloc get userFormBloc => _i4.UserFormBloc();

  @override
  _i5.SnackbarWrapperCubit get snackbarWrapperCubit =>
      _i5.SnackbarWrapperCubit();

  @override
  _i13.EmailInputCubit get emailInputCubit =>
      _i13.EmailInputCubit(_getIt<_i10.EmailValidator>());

  @override
  _i18.NameInputCubit get mameInputCubit =>
      _i18.NameInputCubit(_getIt<_i9.NameValidator>());

  @override
  _i22.DeepLinksWrapperCubit get deepLinksWrapperCubit =>
      _i22.DeepLinksWrapperCubit(_getIt<_i19.DeepLinkStreamUseCase>());

  @override
  _i27.SettingsPageCubit get settingsPageCubit => _i27.SettingsPageCubit(
        _getIt<_i26.SaveAppThemeTypeUseCase>(),
        _getIt<_i25.GetAppThemeTypeStreamUseCase>(),
      );

  @override
  _i28.MoreNavigationPageCubit get moreNavigationPageCubit =>
      _i28.MoreNavigationPageCubit(_getIt<_i20.TriggerDeepLinksUseCase>());

  @override
  _i32.CarLocalCubit get carLocalCubit => _i32.CarLocalCubit(
        getCarsFromLocalUseCase: _getIt<_i30.GetCarsFromLocalUseCase>(),
        clearCarsFromLocalUseCase: _getIt<_i29.ClearCarsFromLocalUseCase>(),
      );

  @override
  _i37.CarsCubit get carsCubit => _i37.CarsCubit(
        getCarsUseCase: _getIt<_i34.GetCarsUseCase>(),
        saveCarsToDatabaseUseCase: _getIt<_i31.SaveCarsToDatabaseUseCase>(),
        getCarsFromIsolateExecutorUseCase:
            _getIt<_i35.GetCarsFromIsolateExecutorUseCase>(),
        loadCarsFromIsolateExecutorUseCase:
            _getIt<_i36.LoadCarsFromIsolateExecutorUseCase>(),
      );
}

class _$RepositoryModule extends _i39.RepositoryModule {
  _$RepositoryModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i6.CarDTOToCarMapper get carDTOToCarMapper => _i6.CarDTOToCarMapper();

  @override
  _i40.DeepLinkRepositoryImpl get deepLinkRepository =>
      _i40.DeepLinkRepositoryImpl();

  @override
  _i41.CarLocalRepositoryImpl get carLocalRepository =>
      _i41.CarLocalRepositoryImpl(_getIt<_i8.DriftLocalDatabase>());

  @override
  _i42.SecurityRepositoryImpl get securityRepository =>
      _i42.SecurityRepositoryImpl(_getIt<_i15.FlutterSecureStorage>());

  @override
  _i43.CarRepositoryImpl get carRepository => _i43.CarRepositoryImpl(
        carRemoteDataSource: _getIt<_i23.CarRemoteDataSource>(),
        carDTOToCarMapper: _getIt<_i6.CarDTOToCarMapper>(),
      );
}

class _$StorageModule extends _i44.StorageModule {
  _$StorageModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i15.FlutterSecureStorage get flutterSecureStorage =>
      _i15.FlutterSecureStorage(
        iOptions: _getIt<_i15.IOSOptions>(),
        aOptions: _getIt<_i15.AndroidOptions>(),
        lOptions: _getIt<_i15.LinuxOptions>(),
        wOptions: _getIt<_i15.WindowsOptions>(),
        webOptions: _getIt<_i15.WebOptions>(),
        mOptions: _getIt<_i15.MacOsOptions>(),
      );

  @override
  _i45.AppThemeTypeStorageImpl get appThemeTypeStorage =>
      _i45.AppThemeTypeStorageImpl(_getIt<_i7.SharedPreferences>());
}

class _$ValidatorModule extends _i46.ValidatorModule {
  @override
  _i9.NameValidator get nameValidator => _i9.NameValidator();

  @override
  _i10.EmailValidator get emailValidator => _i10.EmailValidator();
}

class _$ConfigModule extends _i47.ConfigModule {}

class _$NetworkingModule extends _i48.NetworkingModule {
  _$NetworkingModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i14.AccessTokenInterceptor get accessTokenInterceptor =>
      _i14.AccessTokenInterceptor(_getIt<_i11.AppEnv>());

  @override
  _i21.AuthorizedApiClient get authorizedApiClient => _i21.AuthorizedApiClient(
        appEnv: _getIt<_i11.AppEnv>(),
        accessTokenInterceptor: _getIt<_i14.AccessTokenInterceptor>(),
      );
}

class _$UseCaseModule extends _i49.UseCaseModule {
  _$UseCaseModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i19.DeepLinkStreamUseCase get deepLinkStreamUseCase =>
      _i19.DeepLinkStreamUseCase(_getIt<_i12.DeepLinkRepository>());

  @override
  _i20.TriggerDeepLinksUseCase get triggerDeepLinksUseCase =>
      _i20.TriggerDeepLinksUseCase(_getIt<_i12.DeepLinkRepository>());

  @override
  _i25.GetAppThemeTypeStreamUseCase get getAppThemeTypeStreamUseCase =>
      _i25.GetAppThemeTypeStreamUseCase(_getIt<_i16.AppThemeTypeStorage>());

  @override
  _i26.SaveAppThemeTypeUseCase get saveAppThemeTypeUseCase =>
      _i26.SaveAppThemeTypeUseCase(_getIt<_i16.AppThemeTypeStorage>());

  @override
  _i29.ClearCarsFromLocalUseCase get clearCarsFromLocalUseCase =>
      _i29.ClearCarsFromLocalUseCase(_getIt<_i17.CarLocalRepository>());

  @override
  _i30.GetCarsFromLocalUseCase get getCarsFromLocalUseCase =>
      _i30.GetCarsFromLocalUseCase(_getIt<_i17.CarLocalRepository>());

  @override
  _i31.SaveCarsToDatabaseUseCase get saveCarsToDatabaseUseCase =>
      _i31.SaveCarsToDatabaseUseCase(_getIt<_i17.CarLocalRepository>());

  @override
  _i34.GetCarsUseCase get getCarsUseCase =>
      _i34.GetCarsUseCase(_getIt<_i33.CarRepository>());

  @override
  _i35.GetCarsFromIsolateExecutorUseCase
      get getCarsFromIsolateExecutorUseCase =>
          _i35.GetCarsFromIsolateExecutorUseCase(_getIt<_i33.CarRepository>());

  @override
  _i36.LoadCarsFromIsolateExecutorUseCase
      get loadCarsFromIsolateExecutorUseCase =>
          _i36.LoadCarsFromIsolateExecutorUseCase(_getIt<_i33.CarRepository>());
}

class _$DataSourceModule extends _i50.DataSourceModule {
  _$DataSourceModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i23.CarRemoteDataSourceImpl get carRemoteDataSourceImpl =>
      _i23.CarRemoteDataSourceImpl.create(_getIt<_i21.AuthorizedApiClient>());
}
