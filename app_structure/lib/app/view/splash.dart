import 'package:app_structure/shared/widgets/crossfade.backgroud.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundCrossfade(),
        Center(
          child: Center(
            child: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                //color: Theme.of(context).colorScheme.tertiary,
              ),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
