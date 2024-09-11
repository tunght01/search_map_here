//import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final dynamic error;
  final VoidCallback tryAgain;
  const AppErrorWidget(this.error, {super.key, required this.tryAgain});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 8,
        ),
        Center(
          child: Text(
            '$error',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: tryAgain,
          child: Column(
            children: [
              const Icon(Icons.refresh, color: Colors.black),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Thử lại',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
