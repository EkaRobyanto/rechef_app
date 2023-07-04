import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:rechef_app/src/core/auth/repository/auth_repository_impl.dart';

import 'auth_event.dart';
import 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryImpl authRepo;
  AuthBloc({required this.authRepo}) : super(InitialState()) {
    on<UserRegistered>(
      (event, emit) {
        emit(RegisterSucces(email: event.email));
      },
    );
    on<AuthenticationChecked>((event, emit) async {
      await authRepo.checkAuthentication().then((value) {
        if (value) {
          emit(Authenticated());
        } else {
          emit(Unauthenticated());
        }
      });
    });
    on<UserLoggedIn>((event, emmit) {
      emmit(Authenticated());
    });
  }

  @override
  void onChange(Change<AuthState> change) {
    log('[AuthBloc] ${change.toString()}');
    super.onChange(change);
  }
}
