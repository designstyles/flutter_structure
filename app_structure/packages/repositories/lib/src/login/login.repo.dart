import 'package:apis/apis.dart';
import 'package:repositories/src/login/login.converter.dart';

class LoginRepository {
  const LoginRepository();
  Future<bool> login({required String email, required String password}) async {
    // final userDetails = await const ClientApi().login(
    //   emailValue: email,
    //   passwordValue: password,
    // );

    final userDetails = await const MockApi().login(
      email: email,
      password: password,
    );
    await LoginConverter().setUserDetails(userDetails);
    return true;
  }
}
