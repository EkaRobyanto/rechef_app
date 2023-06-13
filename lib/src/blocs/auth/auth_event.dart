import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthRegist extends AuthEvent {
  final String data;

  AuthRegist(this.data);
}

class AuthAbort extends AuthEvent {
  AuthAbort();
}
