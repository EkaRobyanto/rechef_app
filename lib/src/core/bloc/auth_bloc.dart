import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:rechef_app/src/core/repository/auth_repository_impl.dart';
import 'package:rechef_app/src/core/repository/storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_event.dart';
import 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryImpl authRepo;
  final StorageRepository storageRepo;
  AuthBloc({required this.authRepo, required this.storageRepo})
      : super(InitialState()) {
    on<UserRegistered>(
      (event, emit) {
        emit(RegisterSucces(email: event.email));
      },
    );
    on<AuthenticationChecked>((event, emit) async {
      log('cek auth');
      SharedPreferences storage = await storageRepo.accessStorage();
      await authRepo.checkAuthentication(storage).then((value) {
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
