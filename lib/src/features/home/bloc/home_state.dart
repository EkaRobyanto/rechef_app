import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadSucces extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadError extends HomeState {
  final String error;
  HomeLoadError(this.error);

  @override
  List<Object?> get props => [];
}
