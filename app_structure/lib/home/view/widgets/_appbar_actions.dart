import 'package:app_structure/home/cubit/home_cubit.dart';
import 'package:app_structure/shared/data/cubit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_provider/theme_provider.dart';

class HomeScaffoldAction extends StatelessWidget {
  const HomeScaffoldAction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, AppBaseState>(
      builder: (BuildContext context, state) {
        if (state is HomeLoaded) {
          if (state.isLoggedIn) {
            return const _LoggedInOptions();
          }
          return const _LoggedOutOptions();
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _LoggedOutOptions extends StatelessWidget {
  const _LoggedOutOptions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoSwitch(
          onChanged: (value) async {
            ThemeProvider.controllerOf(context).nextTheme();
          },
          value: ThemeProvider.themeOf(context).id == 'light',
        ),
        IconButton(
          onPressed: () async {
            await context.read<HomeCubit>().login();
          },
          icon: const Icon(Icons.person),
        )
      ],
    );
  }
}

class _LoggedInOptions extends StatelessWidget {
  const _LoggedInOptions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoSwitch(
          onChanged: (value) async {
            ThemeProvider.controllerOf(context).nextTheme();
          },
          value: ThemeProvider.themeOf(context).id == 'light',
        ),
        IconButton(
          onPressed: () async {
            await context.read<HomeCubit>().logout();
          },
          icon: const Icon(Icons.exit_to_app),
        )
      ],
    );
  }
}
