part of 'login_cubit.dart';

class LoginInitial extends AppBaseState {
  LoginInitial() : super();
}

class LoggingIn extends AppBaseState {
  LoggingIn() : super();
}

class LoginSuccess extends AppBaseSuccessState {
  LoginSuccess() : super();
}

class LoginFailed extends AppBaseFailedState {
  LoginFailed(
    super.errorMessage,
    super.appbarTitle,
  );
}
