import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthState extends Equatable {}

class InitialState extends AuthState {
  @override
  //implement props
  List<Object?> get props => [];
}

class AuthRequest extends AuthState {
  @override
  List<Object?> get props => [];
}

class UserLoggedIn extends AuthState {
  @override
  List<Object?> get props => [];
}

class UserRegistered extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
  @override
  List<Object?> get props => [error];
}

class AuthAborted extends AuthState {
  @override
  List<Object?> get props => [];
}
