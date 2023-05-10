import 'package:app_structure/login/cubit/login_cubit.dart';
import 'package:app_structure/shared/data/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';

part './_login.dart';

class LoginSuccessChild extends StatelessWidget {
  const LoginSuccessChild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, AppBaseState>(
      builder: (BuildContext context, state) {
        return const _Login();
      },
    );
  }
}
