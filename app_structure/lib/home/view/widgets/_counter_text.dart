part of 'success_home.dart';

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, AppBaseState>(
      builder: (BuildContext context, state) {
        if (state is HomeLoaded) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.countValue}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
