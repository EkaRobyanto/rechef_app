import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../repo/auth/auth_repository.dart';
import 'auth_event.dart';
import 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(InitialState()) {
    on<AuthRegist>(
      (event, emit) async {
        emit(AuthRequest());
        try {
          await authRepository.register();
          emit(UserRegistered());
        } catch (e) {
          emit(AuthError(e.toString()));
        }
      },
      transformer: restartable(),
    );
    on<AuthAbort>(
      (event, emit) {
        print('Auth aborted');
        emit(AuthAborted());
      },
    );
  }
}
