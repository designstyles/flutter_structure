import 'package:apis/src/apis/login/api.login.dart';
import 'package:models/models.dart';

class ClientApi {
  const ClientApi();
  Future<ApiAuthentication> login({
    required String email,
    required String password,
  }) async {
    final dtoJson = await DtoLogin.createEmptyItem(
      emailAddress: email,
      password: password,
    );
    return const LoginApiEndpoints().login(loginJson: dtoJson.toJson());
  }
}
