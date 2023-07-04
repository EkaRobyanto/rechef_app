import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginState extends Equatable {}

class InitialState extends LoginState {
  @override
  //implement props
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginFailed extends LoginState {
  final String message;

  LoginFailed(this.message);

  @override
  List<Object?> get props => [message];
}
