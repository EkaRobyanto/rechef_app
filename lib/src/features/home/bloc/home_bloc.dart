import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/core/repository/storage_repository.dart';
import 'package:rechef_app/src/features/home/repository/home_repository_impl.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepositoryImpl homeRepository;
  final StorageRepository storageRepository;
  HomeBloc({required this.homeRepository, required this.storageRepository})
      : super(HomeLoading()) {
    on<LoadHome>(
      (event, emit) async {
        emit(HomeLoading());
        try {
          var tokens = await storageRepository.getTokens();
          await homeRepository.getHomeData(tokens['access']!);
          emit(HomeLoadSucces());
        } catch (e) {
          emit(HomeLoadError(e.toString()));
        }
      },
    );
  }
  @override
  void onChange(Change<HomeState> change) {
    log('[Home] : $change');
    super.onChange(change);
  }
}
