import 'package:app_structure/login/cubit/login_cubit.dart';
import 'package:app_structure/login/view/widgets/success_login.dart';
import 'package:app_structure/shared/base.scaffold.dart';
import 'package:app_structure/shared/data/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
        loginRepository: context.read<LoginRepository>(),
      )..init(),
      child: const _GenericView(),
    );
  }
}

class _GenericView extends StatelessWidget {
  const _GenericView();

  Future<bool> _loadData(BuildContext context) async {
    return true;
  }

  Future<void> _retry(BuildContext context) async {}

  String _loadTitle(AppBaseState state, BuildContext context) {
    return 'Log in';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, AppBaseState>(
      builder: (context, state) {
        return GenericScafold<LoginCubit>(
          getScaffoldTitle: () => _loadTitle(state, context),
          getFutureBuilder: _loadData,
          retryFailed: () => _retry(context),
          successChild: const LoginSuccessChild(),
        );
      },
    );
  }
}
