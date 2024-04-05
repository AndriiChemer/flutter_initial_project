import 'package:injectable/injectable.dart';
import 'package:iteo_libraries_example/core/app_env.dart';

@module
abstract class ConfigModule {
  @dev
  @Singleton()
  AppEnv get envDev => AppEnv.development();

  @prod
  @Singleton()
  AppEnv get envProd => AppEnv.production();
}
