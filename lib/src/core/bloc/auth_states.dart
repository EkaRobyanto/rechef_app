import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthState extends Equatable {}

class Unauthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class RegisterSucces extends AuthState {
  final String email;
  RegisterSucces({required this.email});
  @override
  List<Object?> get props => [email];
}

class InitialState extends AuthState {
  @override
  List<Object?> get props => [];
}
