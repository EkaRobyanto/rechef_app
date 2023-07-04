import 'package:flutter/material.dart';
import 'package:rechef_app/src/constants/styles.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.error, required this.onRetry});

  final String error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error,
            style: Styles.font.bxl,
          ),
          const SizedBox(
            height: 20,
          ),
          IconButton(
            onPressed: onRetry,
            icon: Icon(
              Icons.restart_alt_outlined,
              color: Styles.color.primary,
            ),
          )
        ],
      ),
    );
  }
}
