part of './success_login.dart';

class _Login extends StatelessWidget {
  const _Login();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, AppBaseState>(
      builder: (BuildContext context, state) {
        return const _View();
      },
    );
  }
}

//https://github.com/NearHuscarl/flutter_login/blob/master/example/lib/login_screen.dart
class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final cubit = context.select((LoginCubit cubit) => cubit);
    return FlutterLogin(
      titleTag: 'TitleTag',
      navigateBackAfterRecovery: true,
      hideProvidersTitle: true,
      loginAfterSignUp: false,
      userValidator: (value) {
        // if (value!.isEmpty) {
        //   return 'Email is required';
        // }
        // if (!value.contains('@')) {
        //   return 'Email is not formatted correctly';
        // }
        return null;
      },
      passwordValidator: (value) {
        // if (value!.isEmpty) {
        //   return 'Password is required';
        // }
        return null;
      },
      onLogin: cubit.login,
      onSubmitAnimationCompleted: () async {
        await cubit.navigateToHome();
      },
      onRecoverPassword: (name) async {
        return null;
      },
      messages: LoginMessages(
        userHint: 'Email',
        confirmPasswordHint: 'Confirm',
        loginButton: 'LOG IN',
        recoverPasswordButton: 'Yes Please',
        goBackButton: 'GO BACK',
        recoverPasswordIntro: "Don't feel bad. Happens all the time.",
        recoverPasswordDescription:
            'This will send you and email with your new password',
        recoverPasswordSuccess: 'Password rescued successfully',
        flushbarTitleError: 'Oh no!',
        flushbarTitleSuccess: 'Succes!',
      ),
    );
  }
}
