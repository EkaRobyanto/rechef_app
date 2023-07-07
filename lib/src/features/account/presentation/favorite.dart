import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/constants/styles.dart';

import 'package:rechef_app/src/features/account/blocs/fav/favorite_cubit.dart';
import 'package:rechef_app/src/shared/error_screen.dart';
import 'package:rechef_app/src/shared/loading_screen.dart';

import '../../../shared/recipe_card.dart';
import '../blocs/fav/favorite_state.dart';
import '../repository/user_repository_impl.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FavCubit(
          RepositoryProvider.of<UserRepositoryImpl>(context),
        )..loadFav(''),
        child: BlocBuilder<FavCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return const LoadingScreen();
            } else if (state is FavoriteError) {
              return ErrorScreen(
                error: state.message,
                onRetry: () {
                  context.read<FavCubit>().loadFav('');
                },
              );
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Resep Favorit Kamu', style: Styles.font.bold),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return const RecipeCard();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
