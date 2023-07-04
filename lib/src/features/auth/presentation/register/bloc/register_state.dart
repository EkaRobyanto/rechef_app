import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/user_regist.dart';

@immutable
abstract class RegisterState extends Equatable {}

class InitialState extends RegisterState {
  @override
  //implement props
  List<Object?> get props => [];
}

class FirstCredentialAdded extends RegisterState {
  @override
  List<Object?> get props => [];
}

class GenderUpdated extends RegisterState {
  final UserRegist data;

  GenderUpdated(this.data);
  @override
  List<Object?> get props => [data];
}

class InterestAdded extends RegisterState {
  final List<String> interests;

  InterestAdded(this.interests);
  @override
  List<Object?> get props => [interests];
}

class InterestRemoved extends RegisterState {
  final List<String> interests;

  InterestRemoved(this.interests);
  @override
  List<Object?> get props => [interests];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccess extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterFailed extends RegisterState {
  final String error;
  RegisterFailed(this.error);

  @override
  List<Object?> get props => [error];
}
