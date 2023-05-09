import 'package:loggy/loggy.dart' as loggy;

class AppLogger {
  void logDebug(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      loggy.logDebug(message, error, stackTrace);

  void logInfo(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      loggy.logInfo(message, error, stackTrace);

  void logWarning(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      loggy.logWarning(message, error, stackTrace);

  void logError(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      loggy.logError(message, error, stackTrace);
}
