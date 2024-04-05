// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fimber/fimber.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../../data/app_theme/app_theme_type_storage_impl.dart' as _i48;
import '../../data/cars/car_local_repository_impl.dart' as _i44;
import '../../data/cars/car_repository_impl.dart' as _i45;
import '../../data/cars/mapper/car_dto_to_car_mapper.dart' as _i6;
import '../../data/cars/remote/car_remote_data_source.dart' as _i26;
import '../../data/database/drift_local_database.db.dart' as _i16;
import '../../data/deep_link/deep_link_repository_impl.dart' as _i42;
import '../../data/network/authorized_api_client.dart' as _i24;
import '../../data/network/interceptor/access_token_interceptor.dart' as _i18;
import '../../data/security/security_repository_impl.dart' as _i43;
import '../../domain/app_theme/app_theme_type_storage.dart' as _i19;
import '../../domain/app_theme/use_case/get_app_theme_type_use_case.dart'
    as _i27;
import '../../domain/app_theme/use_case/save_app_theme_type_use_case.dart'
    as _i28;
import '../../domain/cars/car_local_repository.dart' as _i20;
import '../../domain/cars/car_repository.dart' as _i35;
import '../../domain/cars/use_case/clear_cars_from_local_use_case.dart' as _i31;
import '../../domain/cars/use_case/get_cars_from_isolate_executor_use_case.dart'
    as _i37;
import '../../domain/cars/use_case/get_cars_from_local_use_case.dart' as _i32;
import '../../domain/cars/use_case/get_cars_use_case.dart' as _i36;
import '../../domain/cars/use_case/load_cars_from_isolate_executor_use_case.dart'
    as _i38;
import '../../domain/cars/use_case/save_cars_to_database_use_case.dart' as _i33;
import '../../domain/deep_link/deep_link_repository.dart' as _i14;
import '../../domain/deep_link/use_case/deep_link_stream_use_case.dart' as _i22;
import '../../domain/deep_link/use_case/trigger_deep_links_use_case.dart'
    as _i23;
import '../../domain/security/security_repository.dart' as _i15;
import '../../domain/validator/email/email_validator.dart' as _i12;
import '../../domain/validator/name/name_validator.dart' as _i11;
import '../../presentation/page/cars/cubit/cars_cubit.dart' as _i39;
import '../../presentation/page/cars_local/cubit/car_local_cubit.dart' as _i34;
import '../../presentation/page/main/cubit/main_page_cubit.dart' as _i3;
import '../../presentation/page/more/cubit/more_navigation_page_cubit.dart'
    as _i30;
import '../../presentation/page/settings/cubit/settings_page_cubit.dart'
    as _i29;
import '../../presentation/page/user_form/cubit/user_form_bloc.dart' as _i4;
import '../../presentation/widget/deep_links/cubit/deep_links_wrapper_cubit.dart'
    as _i25;
import '../../presentation/widget/forms/email/email_input_cubit.dart' as _i17;
import '../../presentation/widget/forms/name/name_input_cubit.dart' as _i21;
import '../../presentation/widget/snackbar/cubit/snackbar_wrapper_cubit.dart'
    as _i5;
import '../app_env.dart' as _i13;
import '../logger/crashlytics_reporting_tree.dart' as _i7;
import 'module/config_module.dart' as _i46;
import 'module/cubit_module.dart' as _i40;
import 'module/data_source_module.dart' as _i52;
import 'module/networking_module.dart' as _i50;
import 'module/repository_module.dart' as _i41;
import 'module/storage_module.dart' as _i47;
import 'module/use_case_module.dart' as _i51;
import 'module/validator_module.dart' as _i49;

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
    final networkingModule = _$NetworkingModule(this);
    final useCaseModule = _$UseCaseModule(this);
    final dataSourceModule = _$DataSourceModule(this);
    gh.factory<_i3.MainPageCubit>(() => cubitModule.mainPageCubit);
    gh.factory<_i4.UserFormBloc>(() => cubitModule.userFormBloc);
    gh.factory<_i5.SnackbarWrapperCubit>(
        () => cubitModule.snackbarWrapperCubit);
    gh.factory<_i6.CarDTOToCarMapper>(() => repositoryModule.carDTOToCarMapper);
    gh.singleton<_i7.CrashlyticsReportingTree>(
        () => configModule.crashlyticsReporter);
    gh.singleton<_i8.DebugTree>(() => configModule.logger);
    gh.lazySingleton<_i9.FlutterSecureStorage>(
        () => storageModule.secureStorage);
    await gh.lazySingletonAsync<_i10.SharedPreferences>(
      () => storageModule.getPrefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i11.NameValidator>(() => validatorModule.nameValidator);
    gh.lazySingleton<_i12.EmailValidator>(() => validatorModule.emailValidator);
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
    gh.factory<_i18.AccessTokenInterceptor>(
        () => networkingModule.accessTokenInterceptor);
    gh.singleton<_i13.AppEnv>(
      () => configModule.envProd,
      registerFor: {_prod},
    );
    gh.lazySingleton<_i19.AppThemeTypeStorage>(
        () => storageModule.appThemeTypeStorage);
    gh.lazySingleton<_i20.CarLocalRepository>(
        () => repositoryModule.carLocalRepository);
    gh.factory<_i21.NameInputCubit>(() => cubitModule.mameInputCubit);
    gh.factory<_i22.DeepLinkStreamUseCase>(
        () => useCaseModule.deepLinkStreamUseCase);
    gh.factory<_i23.TriggerDeepLinksUseCase>(
        () => useCaseModule.triggerDeepLinksUseCase);
    gh.lazySingleton<_i24.AuthorizedApiClient>(
        () => networkingModule.authorizedApiClient);
    gh.factory<_i25.DeepLinksWrapperCubit>(
        () => cubitModule.deepLinksWrapperCubit);
    gh.lazySingleton<_i26.CarRemoteDataSource>(
        () => dataSourceModule.carRemoteDataSourceImpl);
    gh.factory<_i27.GetAppThemeTypeStreamUseCase>(
        () => useCaseModule.getAppThemeTypeStreamUseCase);
    gh.factory<_i28.SaveAppThemeTypeUseCase>(
        () => useCaseModule.saveAppThemeTypeUseCase);
    gh.factory<_i29.SettingsPageCubit>(() => cubitModule.settingsPageCubit);
    gh.factory<_i30.MoreNavigationPageCubit>(
        () => cubitModule.moreNavigationPageCubit);
    gh.factory<_i31.ClearCarsFromLocalUseCase>(
        () => useCaseModule.clearCarsFromLocalUseCase);
    gh.factory<_i32.GetCarsFromLocalUseCase>(
        () => useCaseModule.getCarsFromLocalUseCase);
    gh.factory<_i33.SaveCarsToDatabaseUseCase>(
        () => useCaseModule.saveCarsToDatabaseUseCase);
    gh.factory<_i34.CarLocalCubit>(() => cubitModule.carLocalCubit);
    gh.lazySingleton<_i35.CarRepository>(() => repositoryModule.carRepository);
    gh.factory<_i36.GetCarsUseCase>(() => useCaseModule.getCarsUseCase);
    gh.factory<_i37.GetCarsFromIsolateExecutorUseCase>(
        () => useCaseModule.getCarsFromIsolateExecutorUseCase);
    gh.factory<_i38.LoadCarsFromIsolateExecutorUseCase>(
        () => useCaseModule.loadCarsFromIsolateExecutorUseCase);
    gh.factory<_i39.CarsCubit>(() => cubitModule.carsCubit);
    return this;
  }
}

class _$CubitModule extends _i40.CubitModule {
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
  _i17.EmailInputCubit get emailInputCubit =>
      _i17.EmailInputCubit(_getIt<_i12.EmailValidator>());

  @override
  _i21.NameInputCubit get mameInputCubit =>
      _i21.NameInputCubit(_getIt<_i11.NameValidator>());

  @override
  _i25.DeepLinksWrapperCubit get deepLinksWrapperCubit =>
      _i25.DeepLinksWrapperCubit(_getIt<_i22.DeepLinkStreamUseCase>());

  @override
  _i29.SettingsPageCubit get settingsPageCubit => _i29.SettingsPageCubit(
        _getIt<_i28.SaveAppThemeTypeUseCase>(),
        _getIt<_i27.GetAppThemeTypeStreamUseCase>(),
      );

  @override
  _i30.MoreNavigationPageCubit get moreNavigationPageCubit =>
      _i30.MoreNavigationPageCubit(_getIt<_i23.TriggerDeepLinksUseCase>());

  @override
  _i34.CarLocalCubit get carLocalCubit => _i34.CarLocalCubit(
        getCarsFromLocalUseCase: _getIt<_i32.GetCarsFromLocalUseCase>(),
        clearCarsFromLocalUseCase: _getIt<_i31.ClearCarsFromLocalUseCase>(),
      );

  @override
  _i39.CarsCubit get carsCubit => _i39.CarsCubit(
        getCarsUseCase: _getIt<_i36.GetCarsUseCase>(),
        saveCarsToDatabaseUseCase: _getIt<_i33.SaveCarsToDatabaseUseCase>(),
        getCarsFromIsolateExecutorUseCase:
            _getIt<_i37.GetCarsFromIsolateExecutorUseCase>(),
        loadCarsFromIsolateExecutorUseCase:
            _getIt<_i38.LoadCarsFromIsolateExecutorUseCase>(),
      );
}

class _$RepositoryModule extends _i41.RepositoryModule {
  _$RepositoryModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i6.CarDTOToCarMapper get carDTOToCarMapper => _i6.CarDTOToCarMapper();

  @override
  _i42.DeepLinkRepositoryImpl get deepLinkRepository =>
      _i42.DeepLinkRepositoryImpl();

  @override
  _i43.SecurityRepositoryImpl get securityRepository =>
      _i43.SecurityRepositoryImpl(_getIt<_i9.FlutterSecureStorage>());

  @override
  _i44.CarLocalRepositoryImpl get carLocalRepository =>
      _i44.CarLocalRepositoryImpl(_getIt<_i16.DriftLocalDatabase>());

  @override
  _i45.CarRepositoryImpl get carRepository => _i45.CarRepositoryImpl(
        carRemoteDataSource: _getIt<_i26.CarRemoteDataSource>(),
        carDTOToCarMapper: _getIt<_i6.CarDTOToCarMapper>(),
      );
}

class _$ConfigModule extends _i46.ConfigModule {}

class _$StorageModule extends _i47.StorageModule {
  _$StorageModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i48.AppThemeTypeStorageImpl get appThemeTypeStorage =>
      _i48.AppThemeTypeStorageImpl(_getIt<_i10.SharedPreferences>());
}

class _$ValidatorModule extends _i49.ValidatorModule {
  @override
  _i11.NameValidator get nameValidator => _i11.NameValidator();

  @override
  _i12.EmailValidator get emailValidator => _i12.EmailValidator();
}

class _$NetworkingModule extends _i50.NetworkingModule {
  _$NetworkingModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i18.AccessTokenInterceptor get accessTokenInterceptor =>
      _i18.AccessTokenInterceptor(_getIt<_i13.AppEnv>());

  @override
  _i24.AuthorizedApiClient get authorizedApiClient => _i24.AuthorizedApiClient(
        appEnv: _getIt<_i13.AppEnv>(),
        accessTokenInterceptor: _getIt<_i18.AccessTokenInterceptor>(),
      );
}

class _$UseCaseModule extends _i51.UseCaseModule {
  _$UseCaseModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i22.DeepLinkStreamUseCase get deepLinkStreamUseCase =>
      _i22.DeepLinkStreamUseCase(_getIt<_i14.DeepLinkRepository>());

  @override
  _i23.TriggerDeepLinksUseCase get triggerDeepLinksUseCase =>
      _i23.TriggerDeepLinksUseCase(_getIt<_i14.DeepLinkRepository>());

  @override
  _i27.GetAppThemeTypeStreamUseCase get getAppThemeTypeStreamUseCase =>
      _i27.GetAppThemeTypeStreamUseCase(_getIt<_i19.AppThemeTypeStorage>());

  @override
  _i28.SaveAppThemeTypeUseCase get saveAppThemeTypeUseCase =>
      _i28.SaveAppThemeTypeUseCase(_getIt<_i19.AppThemeTypeStorage>());

  @override
  _i31.ClearCarsFromLocalUseCase get clearCarsFromLocalUseCase =>
      _i31.ClearCarsFromLocalUseCase(_getIt<_i20.CarLocalRepository>());

  @override
  _i32.GetCarsFromLocalUseCase get getCarsFromLocalUseCase =>
      _i32.GetCarsFromLocalUseCase(_getIt<_i20.CarLocalRepository>());

  @override
  _i33.SaveCarsToDatabaseUseCase get saveCarsToDatabaseUseCase =>
      _i33.SaveCarsToDatabaseUseCase(_getIt<_i20.CarLocalRepository>());

  @override
  _i36.GetCarsUseCase get getCarsUseCase =>
      _i36.GetCarsUseCase(_getIt<_i35.CarRepository>());

  @override
  _i37.GetCarsFromIsolateExecutorUseCase
      get getCarsFromIsolateExecutorUseCase =>
          _i37.GetCarsFromIsolateExecutorUseCase(_getIt<_i35.CarRepository>());

  @override
  _i38.LoadCarsFromIsolateExecutorUseCase
      get loadCarsFromIsolateExecutorUseCase =>
          _i38.LoadCarsFromIsolateExecutorUseCase(_getIt<_i35.CarRepository>());
}

class _$DataSourceModule extends _i52.DataSourceModule {
  _$DataSourceModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i26.CarRemoteDataSourceImpl get carRemoteDataSourceImpl =>
      _i26.CarRemoteDataSourceImpl.create(_getIt<_i24.AuthorizedApiClient>());
}
