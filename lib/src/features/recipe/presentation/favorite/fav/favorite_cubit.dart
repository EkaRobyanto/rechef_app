import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:rechef_app/src/features/recipe/presentation/favorite/fav/favorite_state.dart';
import 'package:rechef_app/src/features/account/repository/user_repository_impl.dart';

import '../../../../../core/repository/storage_repository.dart';

class FavCubit extends Cubit<FavoriteState> {
  final UserRepositoryImpl userRepo;
  final StorageRepository storageRepository;
  FavCubit(this.userRepo, this.storageRepository) : super(FavoriteInitial());

  void loadFav() async {
    emit(FavoriteLoading());
    try {
      var tokens = await storageRepository.getTokens();
      final result = await userRepo.getFavorite(tokens['access']!);
      log(result.toString());
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
