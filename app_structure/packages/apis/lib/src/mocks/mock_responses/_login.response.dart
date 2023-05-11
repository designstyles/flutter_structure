part of './mocks.responses.dart';

class _MockLoginModel {
  _MockLoginModel();

  Map<String, dynamic> asMap() {
    final jsonMap = {
      'Result': <dynamic>[_resultMap()],
      'Status': 200,
      'Error': null,
      'Date': DateTime.now(),
    };
    return jsonMap;
  }

  Map<String, dynamic> _resultMap() {
    final jsonMap = {
      'Token': 'auth random JWT token',
      'DisplayName': 'Test user',
    };
    return jsonMap;
  }
}
