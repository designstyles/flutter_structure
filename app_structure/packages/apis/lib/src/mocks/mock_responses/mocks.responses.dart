import 'package:models/models.dart';

part './_login.response.dart';

class MockResponses extends AbsResponse {
  Future<AbsResponse> getLoginResponse() async {
    final loginResponseValue = await AppResponse.createEmptyItem(
      resultValue: _MockLoginModel().asMap(),
    );
    return loginResponseValue;
  }
}
