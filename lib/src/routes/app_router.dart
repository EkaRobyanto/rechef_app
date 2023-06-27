import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/register/register_steps/register_step.dart';
import '../features/auth/presentation/register/register.dart';
import '../features/auth/presentation/login.dart';
import '../features/auth/presentation/splash_screen.dart';

CustomTransitionPage<dynamic> slideTransitionRL(page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

CustomTransitionPage<dynamic> slideTransitionBT(page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

final GoRouter router = GoRouter(
  initialLocation: '/auth',
  routes: [
    GoRoute(
      path: '/auth',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SplashScreen()),
      routes: [
        GoRoute(
          path: 'login',
          name: 'login',
          pageBuilder: (context, state) => slideTransitionRL(
            LoginScreen(),
          ),
        ),
        GoRoute(
          path: 'register',
          name: 'register',
          pageBuilder: (context, state) => slideTransitionBT(
            const Register(),
          ),
        ),
        GoRoute(
          path: 'optionalRegistration',
          name: 'optionalRegistration',
          pageBuilder: (context, state) => slideTransitionRL(
            const OptionalStep(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Scaffold(),
      ),
    )
  ],
);
