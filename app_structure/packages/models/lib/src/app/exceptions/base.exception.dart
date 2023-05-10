// * Use base abstract class so that all children exceptions
// * can inherit from here. UI can then do a single check on
// * typeof for AppBaseException
abstract class AppBaseException implements Exception {
  const AppBaseException({
    required this.statusCode,
    required this.message,
  });

  final int statusCode;
  final String message;

  @override
  String toString() {
    return message;
  }
}
