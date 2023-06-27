import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthLogin extends AuthEvent {
  final Map<String, dynamic> data;

  AuthLogin(this.data);
}

class AuthRegist extends AuthEvent {
  final Map<String, dynamic> data;

  AuthRegist(this.data);
}
