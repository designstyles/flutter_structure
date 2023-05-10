import 'package:models/src/app/exceptions/base.exception.dart';

class TimeoutException implements AppBaseException {
  const TimeoutException({
    required this.statusCode,
    required this.message,
  });

  @override
  final int statusCode;
  @override
  final String message;

  @override
  String toString() {
    return 'Request timed out: -> $message';
  }
}
