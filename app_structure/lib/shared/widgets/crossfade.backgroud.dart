import 'package:flutter/material.dart';

class BackgroundCrossfade extends StatelessWidget {
  const BackgroundCrossfade({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // Colors.green,
            // Colors.yellowAccent
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          //stops: [],
          stops: const [0.5, 0.98],
        ),
      ),
      child: const SizedBox.expand(),
    );
  }
}
