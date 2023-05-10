part of './mocks.responses.dart';

class _MockLoginModel {
  _MockLoginModel();
  Map<String, dynamic> asMap() {
    final jsonMap = {
      'Token': 'auth random JWT token',
      'DisplayName': 'Test user',
    };
    return jsonMap;
  }
}
