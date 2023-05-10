import 'package:flutter/material.dart';

class DisplayErrorWidget extends StatelessWidget {
  const DisplayErrorWidget({
    super.key,
    required this.errorMessage,
    this.retryOnTap,
  });

  final String errorMessage;
  final VoidCallback? retryOnTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'Ooops, something has gone wrong.',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            errorMessage,
            style: const TextStyle(fontSize: 16),
          ),
          if (retryOnTap != null) ...[
            TextButton(
              onPressed: () {
                if (retryOnTap != null) {
                  retryOnTap!.call();
                }
              },
              child: const Text(
                'Retry',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ],
      ),
    );
  }
}
