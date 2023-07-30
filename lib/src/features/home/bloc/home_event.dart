import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class LoadHome extends HomeEvent {
  @override
  List<Object?> get props => [];
}
