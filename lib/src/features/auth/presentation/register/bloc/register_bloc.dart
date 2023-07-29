import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rechef_app/src/features/auth/domain/user_regist.dart';
import 'package:rechef_app/src/core/repository/auth_repository_impl.dart';

import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepositoryImpl authRepository;
  UserRegist data = UserRegist();
  RegisterBloc({required this.authRepository}) : super(InitialState()) {
    on<AddFirstCredential>(
      (event, emit) {
        data = data.copyWith(
            username: event.data['username'],
            email: event.data['email'],
            password: event.data['password'],
            confirmPassword: event.data['confirmPassword']);
        emit(FirstCredentialAdded());
      },
    );
    on<SelectGender>(
      (event, emit) {
        data = data.copyWith(gender: event.gender);
        emit(GenderUpdated(data));
      },
    );
    on<AddInterest>(
      (event, emit) {
        data = data.copyWith(interest: [...data.interest, event.interest]);
        log(data.interest.toString());
        emit(InterestAdded(data.interest));
      },
    );
    on<RemoveInterest>((event, emmit) {
      data = data.copyWith(
          interest: data.interest
              .where((element) => element != event.interest)
              .toList());
      log(data.interest.toString());
      emmit(InterestRemoved(data.interest));
    });
    on<SubmitRegistration>(
      (event, emit) async {
        emit(RegisterLoading());
        try {
          await authRepository.register(data);
          emit(RegisterSuccess());
        } catch (e) {
          emit(RegisterFailed(e.toString()));
        }
      },
    );
  }

  @override
  void onChange(Change<RegisterState> change) {
    log('[RegisterBloc] : $change');
    super.onChange(change);
  }
}
