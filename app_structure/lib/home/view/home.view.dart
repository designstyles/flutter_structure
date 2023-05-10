import 'package:app_structure/home/cubit/home_cubit.dart';
import 'package:app_structure/home/view/widgets/_appbar_actions.dart';
import 'package:app_structure/home/view/widgets/_increment_button.dart';
import 'package:app_structure/home/view/widgets/success_home.dart';
import 'package:app_structure/page_args/home_view_args.dart';
import 'package:app_structure/shared/base.scaffold.dart';
import 'package:app_structure/shared/data/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.args});
  final HomePageArgs args;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        homeRepository: context.read<HomeRepository>(),
      )..initializeView(isLoggedIn: args.isLoggedIn),
      child: const _GenericView(),
    );
  }
}

class _GenericView extends StatelessWidget {
  const _GenericView();

  Future<bool> _loadData(BuildContext context) async {
    return true;
  }

  Future<void> _retry(BuildContext context) async {
    await context.read<HomeCubit>().retry();
  }

  String _loadTitle(AppBaseState state, BuildContext context) {
    return state.appbarTitle;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, AppBaseState>(
      builder: (context, state) {
        return GenericScafold<HomeCubit>(
          getScaffoldTitle: () => _loadTitle(state, context),
          getFutureBuilder: _loadData,
          retryFailed: () => _retry(context),
          getScaffoldActions: const [HomeScaffoldAction()],
          successChild: const HomeSuccessChild(),
          fabActionButton: const HomeIncrementButton(),
        );
      },
    );
  }
}
