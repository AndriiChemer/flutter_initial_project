const _envKey = 'ENV';

class AppEnv {
  AppEnv._(
    this.name,
    this.key,
  );

  factory AppEnv.development() {
    return AppEnv._(
      _devName,
      _key,
    );
  }

  factory AppEnv.production() {
    return AppEnv._(
      _prodName,
      _key,
    );
  }
  
  static const _devName = 'dev';
  static const _prodName = 'prod';
  static const _key = String.fromEnvironment(_envKey, defaultValue: _devName);

  bool get isDev => name == _devName;
  bool get isProd => name == _prodName;
  
  final String name;
  final String key;
}
