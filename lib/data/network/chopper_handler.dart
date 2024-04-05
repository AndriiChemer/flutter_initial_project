import 'package:chopper/chopper.dart';

Future<T> chopperCaller<T>(Future<Response<T>> Function() call) async {
  final result = await call();

  if (result.body != null && result.error == null) {
    return result.body as T;
  } else {
    throw Exception();
  }
}
