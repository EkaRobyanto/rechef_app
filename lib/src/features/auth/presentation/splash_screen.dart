import 'package:flutter/material.dart';

import 'package:rechef_app/src/constants/image_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      body: Center(
        child: Image.asset(logo),
      ),
    );
  }
}
