import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/core/auth/repository/auth_repository_impl.dart';
import 'package:rechef_app/src/core/connectivity_check/bloc/connectivity_cubit.dart';
import 'package:rechef_app/src/core/connectivity_check/repository/connectivity_repository.dart';
import 'package:rechef_app/src/routes/app_router.dart';

import 'core/auth/bloc/auth_bloc.dart';
import 'features/home/repository/home_repository_impl.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (ctx) => AuthRepositoryImpl(),
        ),
        RepositoryProvider(
          create: (context) => ConnectivityRepository(),
        ),
        RepositoryProvider(
          create: (ctx) => HomeRepositoryImpl(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepo: context.read<AuthRepositoryImpl>(),
            ),
          ),
          BlocProvider(
            create: (context) => ConnectivityCubit(
              connectRepo: context.read<ConnectivityRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
