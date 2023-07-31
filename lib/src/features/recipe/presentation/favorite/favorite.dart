import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/constants/styles.dart';
import 'package:rechef_app/src/core/repository/storage_repository.dart';

import 'package:rechef_app/src/features/recipe/presentation/favorite/fav/favorite_cubit.dart';
import 'package:rechef_app/src/shared/error_screen.dart';
import 'package:rechef_app/src/shared/loading_screen.dart';

import '../../../../shared/recipe_card.dart';
import 'fav/favorite_state.dart';
import '../../../account/repository/user_repository_impl.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FavCubit(
          RepositoryProvider.of<UserRepositoryImpl>(context),
          RepositoryProvider.of<StorageRepository>(context),
        )..loadFav(),
        child: BlocBuilder<FavCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoaded) {
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
                      state.favs.isEmpty
                          ? Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.favorite_border,
                                        size: 100),
                                    const SizedBox(height: 20),
                                    Text('Kamu belum memiliki resep favorit',
                                        style: Styles.font.base),
                                  ],
                                ),
                              ),
                            )
                          : Expanded(
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
            } else if (state is FavoriteError) {
              return ErrorScreen(
                error: state.message,
                onRetry: () {
                  context.read<FavCubit>().loadFav();
                },
              );
            }
            return const LoadingScreen();
          },
        ),
      ),
    );
  }
}
