import 'package:loggy/loggy.dart' as loggy;

class AppLogger {
  static void logDebug(
    dynamic message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      loggy.logDebug(message, error, stackTrace);

  static void logInfo(
    dynamic message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      loggy.logInfo(message, error, stackTrace);

  static void logWarning(
    dynamic message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      loggy.logWarning(message, error, stackTrace);

  static void logError(
    dynamic message, [
    Object? error,
    StackTrace? stackTrace,
  ]) =>
      loggy.logError(message, error, stackTrace);
}
