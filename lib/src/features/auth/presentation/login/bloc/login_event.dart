import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginRequest extends LoginEvent {
  final String email;
  final String password;

  LoginRequest(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
