import 'package:equatable/equatable.dart';

abstract class FavoriteState extends Equatable {}

class FavoriteInitial extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteLoading extends FavoriteState {
  @override
  List<Object> get props => [];
}

class FavoriteLoaded extends FavoriteState {
  final dynamic favs;
  FavoriteLoaded(this.favs);
  @override
  List<Object> get props => [favs];
}

class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError(this.message);
  @override
  List<Object> get props => [message];
}
