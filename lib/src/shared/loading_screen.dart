import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rechef_app/src/constants/styles.dart';

import '../constants/lottie_path.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(loading),
          Text(
            'Mohon Tunggu Sebentar...',
            style: Styles.font.bold,
          ),
        ],
      ),
    );
  }
}
