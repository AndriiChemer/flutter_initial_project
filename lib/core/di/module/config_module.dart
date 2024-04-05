import 'package:fimber/fimber.dart';
import 'package:injectable/injectable.dart';
import 'package:iteo_libraries_example/core/app_env.dart';
import 'package:iteo_libraries_example/core/logger/crashlytics_reporting_tree.dart';
import 'package:iteo_libraries_example/core/logger/logger.dart';

@module
abstract class ConfigModule {
  @dev
  @Singleton()
  AppEnv get envDev => AppEnv.development();

  @prod
  @Singleton()
  AppEnv get envProd => AppEnv.production();

  @Singleton()
  CrashlyticsReportingTree get crashlyticsReporter => CrashlyticsReportingTree();

  @Singleton()
  DebugTree get logger => DebugTree(useColors: true)
    ..colorizeMap = Logger.customColorizeMap;
}
