import 'package:models/models.dart';

part './_login.response.dart';

class MockResponses extends AbsResponse {
  Future<AbsResponse> getLoginResponse() async {
    return AppResponse.fromMap(_MockLoginModel().asMap());
  }
}
