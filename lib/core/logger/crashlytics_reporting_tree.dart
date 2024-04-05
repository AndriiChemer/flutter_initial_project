import 'package:fimber/fimber.dart';

class CrashlyticsReportingTree implements LogTree {
  @override
  List<String> getLevels() => ['W', 'E', 'V'];
  /// Here send data to server
  @override
  void log(String level, String message, {String? tag, dynamic ex, StackTrace? stacktrace}) {

  }
}
