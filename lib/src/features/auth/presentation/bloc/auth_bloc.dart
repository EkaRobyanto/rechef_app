import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:rechef_app/src/features/auth/repository/auth_repository_impl.dart';
import 'auth_event.dart';
import 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryImpl authRepository;
  AuthBloc({required this.authRepository}) : super(InitialState()) {
    on<AuthLogin>(
      (event, emit) async {
        emit(AuthRequest());
        try {
          await authRepository.login(event.data);
          emit(UserLoggedIn());
        } catch (e) {
          emit(AuthError(e.toString()));
        }
      },
    );
    on<AuthRegist>(
      (event, emit) async {
        emit(AuthRequest());
        try {
          await authRepository.register(event.data);
          emit(UserRegistered());
        } catch (e) {
          emit(AuthError(e.toString()));
        }
      },
      transformer: restartable(),
    );
  }
}
