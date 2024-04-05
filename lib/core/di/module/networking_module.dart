import 'package:injectable/injectable.dart';
import 'package:iteo_libraries_example/data/network/authorized_api_client.dart';
import 'package:iteo_libraries_example/data/network/interceptor/access_token_interceptor.dart';

@module
abstract class NetworkingModule {
  @injectable
  AccessTokenInterceptor get accessTokenInterceptor;

  @lazySingleton
  AuthorizedApiClient get authorizedApiClient;
}
