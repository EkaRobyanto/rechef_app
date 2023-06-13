import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/routes/routes/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () => context.go('/auth/login'));
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
