import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:iteo_libraries_example/core/app_env.dart';

const _headerName = 'x-apikey';

class AccessTokenInterceptor implements RequestInterceptor {
  AccessTokenInterceptor(this.appEnv);

  final AppEnv appEnv;

  @override
  FutureOr<Request> onRequest(Request request) async {
    return applyHeader(request, _headerName, appEnv.apiKey);
  }
}
