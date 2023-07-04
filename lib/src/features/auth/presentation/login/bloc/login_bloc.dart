import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/core/auth/repository/auth_repository_impl.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepositoryImpl authRepo;
  LoginBloc(this.authRepo) : super(InitialState()) {
    on<LoginRequest>(
      (event, emit) async {
        emit(LoginLoading());
        final data = {
          'email': event.email,
          'password': event.password,
        };
        try {
          await authRepo.login(data);
          emit(LoginSuccess());
        } catch (e) {
          emit(LoginFailed(e.toString()));
        }
      },
    );
  }

  @override
  void onChange(Change<LoginState> change) {
    log("[LoginBloc] $change");
    super.onChange(change);
  }
}
