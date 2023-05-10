import 'package:models/src/app/exceptions/base.exception.dart';

class NotFoundException implements AppBaseException {
  const NotFoundException({
    required this.statusCode,
    required this.message,
  });

  @override
  final int statusCode;
  @override
  final String message;

  @override
  String toString() {
    return message;
  }
}
