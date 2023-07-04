import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UserRegistered extends AuthEvent {
  final String email;
  UserRegistered({required this.email});
}

class UserLoggedIn extends AuthEvent {}

class UserUnauthenticated extends AuthEvent {}

class AuthenticationChecked extends AuthEvent {}
