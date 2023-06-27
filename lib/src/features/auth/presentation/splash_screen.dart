import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/routes/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    Timer(
      const Duration(seconds: 3),
      () => router.pushReplacement('/auth/login'),
    );
    return Scaffold(
      body: Center(
        child: Text(
          'ini logo keren',
          style: Styles.font.bxl3,
        ),
      ),
    );
  }
}
