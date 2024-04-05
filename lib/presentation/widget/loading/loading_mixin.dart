import 'dart:async';

import 'package:flutter/foundation.dart';

mixin LoadingMixin implements _Base {
  final _completers = <Completer>[];
  final _shouldShowLoading = ValueNotifier(false);

  ValueNotifier<bool> get shouldShowLoading => _shouldShowLoading;

  @override
  @protected
  Future<T> processWithLoading<T>(Future<T> Function() fn) async {
    final completer = Completer<T>();
    _shouldShowLoading.value = true;
    _completers.add(completer);

    try {
      completer.complete(await fn());
    } catch (e, s) {
      completer.completeError(e, s);
    } finally {
      _completers.remove(completer);
    }

    return completer.future.whenComplete(() {
      _shouldShowLoading.value = _completers.any((e) => !e.isCompleted);
    });
  }
}

abstract class _Base {
  Future<T> processWithLoading<T>(Future<T> Function() fn);
}
