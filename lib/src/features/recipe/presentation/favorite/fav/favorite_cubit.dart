import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:rechef_app/src/features/recipe/presentation/favorite/fav/favorite_state.dart';
import 'package:rechef_app/src/features/account/repository/user_repository_impl.dart';

class FavCubit extends Cubit<FavoriteState> {
  final UserRepositoryImpl userRepo;
  FavCubit(this.userRepo) : super(FavoriteInitial());

  void loadFav(String token) async {
    emit(FavoriteLoading());
    try {
      final result = await userRepo.getFavorite('');
      emit(FavoriteLoaded(result));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  @override
  void onChange(Change<FavoriteState> change) {
    log('[Favorite] : $change');
    super.onChange(change);
  }
}
