import 'package:models/src/app/exceptions/base.exception.dart';

class ServerUnavailableException implements AppBaseException {
  const ServerUnavailableException({
    required this.statusCode,
    required this.message,
  });

  @override
  final int statusCode;
  @override
  final String message;

  @override
  String toString() {
    return 'Server is unavailable at the moment';
  }
}
