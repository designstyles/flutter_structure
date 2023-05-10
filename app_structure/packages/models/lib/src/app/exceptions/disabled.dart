import 'package:models/src/app/exceptions/base.exception.dart';

class DisabledException implements AppBaseException {
  const DisabledException({
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
