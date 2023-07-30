import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/core/repository/storage_repository.dart';
import 'package:rechef_app/src/features/home/repository/home_repository_impl.dart';
import 'package:rechef_app/src/features/recipe/domain/recipe/recipe.dart';

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
          final recipes = await homeRepository.getHomeData(tokens['access']!);
          emit(HomeLoadSucces(recipes: recipes));
        } catch (e) {
          log(e.toString());
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
