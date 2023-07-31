import 'package:equatable/equatable.dart';

abstract class FeedState extends Equatable {}

class FeedLoading extends FeedState {
  @override
  List<Object?> get props => [];
}

class FeedError extends FeedState {
  final String error;

  FeedError(this.error);
  @override
  List<Object?> get props => [error];
}

// ignore: must_be_immutable
class FeedLoaded extends FeedState {
  List<dynamic> data;

  FeedLoaded(this.data);
  @override
  List<Object?> get props => [data];
}
