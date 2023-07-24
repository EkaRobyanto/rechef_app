import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/utills/check_connection.dart';

import '../../../repository/recipe_repository_impl.dart';
import 'feed_event.dart';
import 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final RecipeRepositoryImpl recipeRepo;
  FeedBloc({required this.recipeRepo}) : super(FeedLoading()) {
    on<LoadFeed>(
      (event, emit) async {
        log(event.category);
        emit(FeedLoading());
        try {
          var connection = await checkConnection();
          if (connection) {
            await recipeRepo.getRecipesFeed('', event.category);
            emit(FeedLoaded(const []));
          } else {
            throw ('No Internet Connection');
          }
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
