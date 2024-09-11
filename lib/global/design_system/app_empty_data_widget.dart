//import 'dart:developer' as developer;
import 'package:flutter/material.dart';

class AppEmptyDataWidget extends StatelessWidget {
  const AppEmptyDataWidget({super.key, this.title, this.width, this.height, this.icon});
  final String? title;
  final double? width;
  final double? height;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? const Icon(Icons.hourglass_empty),
          const SizedBox(
            height: 5,
          ),
          Text(
            title ?? 'No data',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
