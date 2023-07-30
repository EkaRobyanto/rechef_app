import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/utills/check_connection.dart';

import '../../../../../core/repository/storage_repository.dart';
import '../../../repository/recipe_repository_impl.dart';
import 'feed_event.dart';
import 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final RecipeRepositoryImpl recipeRepo;
  final StorageRepository storageRepository;
  FeedBloc({required this.recipeRepo, required this.storageRepository})
      : super(FeedLoading()) {
    on<LoadFeed>(
      (event, emit) async {
        log(event.category);
        emit(FeedLoading());
        try {
          var tokens = await storageRepository.getTokens();
          dynamic recipes = await recipeRepo.getRecipesFeed(tokens['access']!);
          emit(FeedLoaded([recipes]));
        } catch (e) {
          emit(FeedError(e.toString()));
        }
      },
    );
  }
  @override
  void onChange(Change<FeedState> change) {
    log('[Feed] : $change');
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    log('[Feed] : $stackTrace');
    super.onError(error, stackTrace);
  }
}
