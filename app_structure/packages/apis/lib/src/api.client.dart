import 'package:apis/src/apis/login/api.login.dart';
import 'package:models/models.dart';

class ClientApi {
  const ClientApi();
  Future<ApiAuthentication> login({
    required String emailValue,
    required String passwordValue,
  }) async {
    final dtoJson = await DtoLogin.createEmptyItem(
      emailAddress: emailValue,
      password: passwordValue,
    );
    return const LoginApiEndpoints().login(loginJson: dtoJson.toJson());
  }
}
