import 'package:equatable/equatable.dart';

abstract class AccountState extends Equatable {}

class AccountInitial extends AccountState {
  @override
  List<Object> get props => [];
}

class AccountLoaded extends AccountState {
  final dynamic data;
  AccountLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class AccountLoadError extends AccountState {
  final String error;
  AccountLoadError(this.error);
  @override
  List<Object> get props => [error];
}

class AccountLoading extends AccountState {
  @override
  List<Object> get props => [];
}
