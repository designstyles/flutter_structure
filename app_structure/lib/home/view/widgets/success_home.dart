import 'package:app_structure/home/cubit/home_cubit.dart';
import 'package:app_structure/shared/data/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './_counter_text.dart';

class HomeSuccessChild extends StatelessWidget {
  const HomeSuccessChild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, AppBaseState>(
      builder: (BuildContext context, state) {
        return const _CounterText();
      },
    );
  }
}
