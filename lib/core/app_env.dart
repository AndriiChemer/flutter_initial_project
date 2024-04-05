import 'package:injectable/injectable.dart';

const _envKey = 'ENV';

class AppEnv {
  AppEnv._(
    this.environment,
    this.key,
    this.url,
    this.apiKey,
  );

  factory AppEnv.development() {
    return AppEnv._(
      _devName,
      _key,
      'https://iteorecruitment-591c.restdb.io/rest',
      '795ad45e4dc222bc0e5bd1c163bb885e3635e',
    );
  }

  factory AppEnv.production() {
    return AppEnv._(
      _prodName,
      _key,
      'https://iteorecruitment-591c.restdb.io/rest',
      '795ad45e4dc222bc0e5bd1c163bb885e3635e',
    );
  }
  
  static const _devName = Environment.dev;
  static const _prodName = Environment.prod;
  static const _key = String.fromEnvironment(_envKey, defaultValue: _devName);

  bool get isDev => environment == _devName;
  bool get isProd => environment == _prodName;
  
  final String environment;
  final String key;
  final String url;
  final String apiKey;
}
