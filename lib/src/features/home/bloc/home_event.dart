import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class LoadHome extends HomeEvent {
  String token;

  LoadHome(this.token);
  @override
  List<Object?> get props => [token];
}
