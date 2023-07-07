import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/utills/check_connection.dart';

import '../repository/feed_repository_impl.dart';
import 'feed_event.dart';
import 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepositoryImpl feedRepo;
  FeedBloc({required this.feedRepo}) : super(FeedLoading()) {
    on<LoadFeed>(
      (event, emit) async {
        emit(FeedLoading());
        try {
          var connection = await checkConnection();
          if (connection) {
            await feedRepo.getFeedData('', event.category);
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
}
