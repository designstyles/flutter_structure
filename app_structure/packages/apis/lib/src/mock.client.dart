import 'package:apis/src/mocks/login_api/mock.login.dart';
import 'package:models/models.dart';

class MockApi {
  const MockApi();
  Future<ApiAuthentication> login({
    required String email,
    required String password,
  }) async {
    final dtoJson = await DtoLogin.createEmptyItem(
      emailAddress: email,
      password: password,
    );
    return const MockLoginApiEndpoints().login(loginJson: dtoJson.toJson());
  }
}
