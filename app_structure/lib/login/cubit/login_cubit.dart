import 'package:app_structure/app/engine/navigator.dart';
import 'package:app_structure/app/engine/page.routes.dart';
import 'package:app_structure/page_args/home_view_args.dart';
import 'package:app_structure/shared/data/cubit_state.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:models/models.dart';
import 'package:repositories/repositories.dart';

part 'login_state.dart';

class LoginCubit extends AppBaseCubit {
  LoginCubit({
    required LoginRepository loginRepository,
  })  : _loginRepository = loginRepository,
        super(LoginInitial());

  final LoginRepository _loginRepository;

  Future<void> init() async {
    emit(LoginSuccess());
  }

  Future<String?> login(LoginData requestData) async {
    try {
      final _ = await _loginRepository.login(
        email: requestData.name,
        password: requestData.password,
      );
      return null;
    } on AppBaseException catch (ex) {
      return ex.message;
    } on Exception {
      return 'Something went wrong!';
    }
  }

  Future<void> navigateToHome() async {
    await Navi.clearStackToPage(
      pageRoute: PageRoutes.routeHome,
      objArgs: const HomePageArgs.load(isLoggedIn: true),
    );
  }

  @override
  Future<void> retry() async {}
}
