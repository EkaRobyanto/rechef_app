import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/features/home/repository/home_repository_impl.dart';
import 'package:rechef_app/src/utills/check_connection.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepositoryImpl homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeLoading()) {
    on<LoadHome>(
      (event, emit) async {
        emit(HomeLoading());
        try {
          var connection = await checkConnection();
          if (connection) {
            await homeRepository.getHomeData(event.token);
            emit(HomeLoadSucces());
          } else {
            throw ('No Internet Connection');
          }
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
