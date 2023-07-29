import 'package:rechef_app/src/core/bloc/auth_event.dart';
import 'package:rechef_app/src/core/repository/storage_repository.dart';

import 'features/recipe/repository/recipe_repository_impl.dart';
import 'features/account/repository/user_repository_impl.dart';
import 'features/home/repository/home_repository_impl.dart';
import 'core/repository/auth_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'routes/app_router.dart';

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
          create: (ctx) => HomeRepositoryImpl(),
        ),
        RepositoryProvider(
          create: (ctx) => RecipeRepositoryImpl(),
        ),
        RepositoryProvider(
          create: (ctx) => UserRepositoryImpl(),
        ),
        RepositoryProvider(
          create: (ctx) => StorageRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepo: context.read<AuthRepositoryImpl>(),
              storageRepo: context.read<StorageRepository>(),
            )..add(AuthenticationChecked()),
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
