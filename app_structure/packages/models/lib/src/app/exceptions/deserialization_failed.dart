import 'package:models/src/app/exceptions/base.exception.dart';

class DataDeserializationException implements AppBaseException {
  const DataDeserializationException({
    required this.statusCode,
    required this.message,
  });

  @override
  final int statusCode;
  @override
  final String message;

  @override
  String toString() {
    return 'Data failed to deserialize: -> $message';
  }
}
