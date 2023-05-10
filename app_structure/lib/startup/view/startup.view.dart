import 'package:app_structure/page_args/page_redirects.dart';
import 'package:app_structure/shared/data/cubit_state.dart';
import 'package:app_structure/startup/cubit/startup_cubit.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AppBaseState>(
      state: context.select((StartupCubit cubit) => cubit.state),
      onGeneratePages: (startUpState, pages) {
        if (startUpState is StartupLoggedOut) {
          return [showHomePage(isLoggedIn: false)];
        }

        if (startUpState is StartupLoggedIn) {
          return [showHomePage(isLoggedIn: true)];
        }

        return [showSplashPage()];
      },
    );
  }
}
