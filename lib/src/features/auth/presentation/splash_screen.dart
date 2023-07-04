import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/constants/image_path.dart';

import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/core/auth/bloc/auth_event.dart';

import '../../../core/auth/bloc/auth_bloc.dart';
import '../../../core/auth/bloc/auth_states.dart';

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
