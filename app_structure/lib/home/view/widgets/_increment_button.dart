import 'package:app_structure/home/cubit/home_cubit.dart';
import 'package:app_structure/shared/data/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeIncrementButton extends StatelessWidget {
  const HomeIncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, AppBaseState>(
      builder: (BuildContext context, state) {
        if (state is HomeLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'decrement',
                onPressed: () {
                  context.read<HomeCubit>().decrement();
                },
                tooltip: 'Decrement',
                backgroundColor: Colors.yellow,
                child: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                heroTag: 'increment',
                onPressed: () {
                  context.read<HomeCubit>().increment();
                },
                tooltip: 'Increment',
                backgroundColor: Colors.yellow,
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
