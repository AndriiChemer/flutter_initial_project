import 'package:chopper/chopper.dart';
import 'package:iteo_libraries_example/core/app_env.dart';
import 'package:iteo_libraries_example/data/network/interceptor/access_token_interceptor.dart';

final class AuthorizedApiClient extends ChopperClient {
  AuthorizedApiClient({
    required AppEnv appEnv,
    required AccessTokenInterceptor accessTokenInterceptor,
  }) : super(
    baseUrl: Uri.parse(appEnv.url),
    interceptors: [
      accessTokenInterceptor,
    ],
    converter: const JsonConverter(),
  );
}
