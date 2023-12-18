Future<T?> ignoreAwaited<T>(Future<T> Function() fn) async {
  try {
    return await fn();
  } catch (e, s) {
    print('ignoreAwaited error. $e. $s');
    return null;
  }
}
