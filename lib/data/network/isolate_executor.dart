import 'dart:async';
import 'dart:isolate';

Future<T> executeIsolate<T>({
  required Future<T> Function() execute,
  void Function(T value)? onSuccess,
  void Function(String error, String stacktrace)? onError,
}) async {
  final completer = Completer<T>();
  final port = ReceivePort();
  final errorPort = ReceivePort();

  await Isolate.spawn(
    (sendPort) async {
      final value = await execute();
      Isolate.exit(sendPort, value.toString());
    },
    port.sendPort,
    onError: errorPort.sendPort,
  );

  errorPort.listen((message) {
    final errors = message as List;
    final error = errors.first as String;
    final stacktrace = errors[1] as String;

    errorPort.close();
    onError?.call(error, stacktrace);
    completer.completeError(error);
  });

  port.listen((message) {
    print('ANDRII 3 Message received!');
    final value = message as T;
    port.close();
    onSuccess?.call(value);
    completer.complete(value);
  });

  return completer.future;
}
