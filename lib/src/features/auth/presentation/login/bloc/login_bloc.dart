import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/core/repository/auth_repository_impl.dart';

import '../../../../../core/repository/storage_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepositoryImpl authRepo;
  final StorageRepository storageRepo;
  LoginBloc(this.authRepo, this.storageRepo) : super(InitialState()) {
    on<LoginRequest>(
      (event, emit) async {
        emit(LoginLoading());
        final data = {
          'email': event.email,
          'password': event.password,
        };
        try {
          var tokens = await authRepo.login(data);
          await storageRepo.accessStorage().then((value) {
            value.setString('access', tokens['access']);
            value.setString('refresh', tokens['refresh']);
          });
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
