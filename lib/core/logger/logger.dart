import 'package:fimber/fimber.dart';
import 'package:iteo_libraries_example/core/di/di_config.dart';

class Logger {
  static void setupLogger() {
    for (final logTree in getIt<List<LogTree>>()) {
      Fimber.plantTree(logTree);
    }
  }

  static final DebugTree debugTree = DebugTree(useColors: true)
    ..colorizeMap = _customColorizeMap;

  /// Logs DEBUG level message.
  static void d(String message, {dynamic ex, StackTrace? stacktrace}) {
    Fimber.d(message, ex: ex, stacktrace: stacktrace);
  }

  /// Logs INFO level message.
  static void i(String message, {dynamic ex, StackTrace? stacktrace}) {
    Fimber.i(message, ex: ex, stacktrace: stacktrace);
  }

  /// Logs WARNING level message.
  static void w(String message, {dynamic ex, StackTrace? stacktrace}) {
    Fimber.w(message, ex: ex, stacktrace: stacktrace);
  }

  /// Logs ERROR level message.
  static void e(String message, {dynamic ex, StackTrace? stacktrace}) {
    Fimber.e(message, ex: ex, stacktrace: stacktrace);
  }

  static final Map<String, ColorizeStyle> _customColorizeMap = {
    'D': ColorizeStyle([AnsiStyle.foreground(AnsiColor.white)]),
    'I': ColorizeStyle([AnsiStyle.foreground(AnsiColor.blue)]),
    'W': ColorizeStyle([AnsiStyle.foreground(AnsiColor.yellow)]),
    'E': ColorizeStyle([AnsiStyle.foreground(AnsiColor.red)]),
  };
}
