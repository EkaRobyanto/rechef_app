import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rechef_app/src/presentation/auth/login.dart';
import 'package:rechef_app/src/presentation/auth/register/optional_step.dart';
import 'package:rechef_app/src/presentation/auth/register/register.dart';
import 'package:rechef_app/src/presentation/auth/splash_screen.dart';

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
          pageBuilder: (context, state) => slideTransitionRL(
            const LoginScreen(),
          ),
        ),
        GoRoute(
          path: 'register',
          pageBuilder: (context, state) => slideTransitionBT(
            const Register(),
          ),
        ),
        GoRoute(
          path: 'optionalRegistration',
          pageBuilder: (context, state) => slideTransitionRL(
            const OptionalStep(),
          ),
        ),
      ],
    )
  ],
);
