import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/features/home/repository/home_repository_impl.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepositoryImpl homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeLoading()) {
    on<LoadHome>(
      (event, emit) async {
        emit(HomeLoading());
        try {
          await homeRepository.getHomeData(event.token);
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
