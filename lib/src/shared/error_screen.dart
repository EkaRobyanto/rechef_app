import 'package:flutter/material.dart';
import 'package:rechef_app/src/constants/styles.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.error, required this.onRetry});

  final String error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            error,
            style: Styles.font.bxl,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: onRetry,
            child: Icon(
              Icons.restart_alt_outlined,
              color: Styles.color.primary,
              size: 100,
            ),
          ),
        ],
      ),
    );
  }
}
