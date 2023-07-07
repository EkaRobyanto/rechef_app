import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rechef_app/src/core/auth/bloc/auth_bloc.dart';
import 'package:rechef_app/src/core/auth/bloc/auth_event.dart';
import 'package:rechef_app/src/core/auth/bloc/auth_states.dart';
import 'package:rechef_app/src/features/account/presentation/favorite.dart';
import 'package:rechef_app/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:rechef_app/src/features/feed/presentation/feed.dart';
import 'package:rechef_app/src/features/home/presentation/category_list.dart';
import 'package:rechef_app/src/features/home/presentation/home.dart';
import 'package:rechef_app/src/routes/bottom_navbar.dart';

import '../features/auth/presentation/register/register_steps/register_step.dart';
import '../features/auth/presentation/register/register.dart';
import '../features/auth/presentation/login/login.dart';
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

CustomTransitionPage<dynamic> fadeTransition(page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
  );
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/auth',
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/auth',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SplashScreen()),
      redirect: (context, state) {
        final authBloc = context.watch<AuthBloc>();
        authBloc.add(AuthenticationChecked());
        if (authBloc.state is Authenticated) {
          return '/home';
        } else if (authBloc.state is Unauthenticated) {
          return '/login';
        }
        return null;
      },
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => slideTransitionRL(
        const LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/register',
      parentNavigatorKey: _rootNavigatorKey,
      name: 'register',
      pageBuilder: (context, state) => slideTransitionBT(
        const Register(),
      ),
      routes: [
        GoRoute(
          path: 'registrationStep',
          name: 'registrationStep',
          pageBuilder: (context, state) {
            return slideTransitionRL(
              RegistrationStep(
                registerbloc: state.extra as RegisterBloc,
              ),
            );
          },
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => MainScaffold(child: child),
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Home(),
          ),
          routes: [
            GoRoute(
              path: 'category-list',
              name: 'kategori',
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) =>
                  slideTransitionRL(const CategoryList()),
            ),
            GoRoute(
              path: 'search',
              name: 'search',
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder: (context, state) => fadeTransition(
                const Scaffold(
                  body: Center(
                    child: Text('ini search'),
                  ),
                ),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/feed',
          name: 'feed',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Feed(),
          ),
        ),
        GoRoute(
          path: '/favorite',
          name: 'favorite',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Favorite(),
          ),
        ),
        GoRoute(
          path: '/account',
          name: 'account',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: Scaffold(
              body: Center(child: Text('akun')),
            ),
          ),
        ),
      ],
    ),
  ],
);
