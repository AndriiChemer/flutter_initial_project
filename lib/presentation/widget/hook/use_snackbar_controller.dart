import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iteo_libraries_example/presentation/widget/snackbar/snackbar_wrapper.dart';

SnackbarWrapperController useSnackbarController([
  List<Object?> keys = const <Object>[],
]) {
  final controller = useMemoized(() => SnackbarWrapperController(), keys);
  useEffect(() => controller.close, [controller]);

  return controller;
}
