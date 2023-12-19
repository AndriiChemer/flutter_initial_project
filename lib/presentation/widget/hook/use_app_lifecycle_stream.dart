import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Stream<AppLifecycleState?> useAppLifecycleStream() {
  final controller =
      useMemoized(() => StreamController<AppLifecycleState>(), []);
  useOnAppLifecycleStateChange((previous, current) => controller.add(current));
  final stream = useMemoized(() => controller.stream, [controller]);
  useEffect(() => controller.close, [controller]);

  return stream;
}
