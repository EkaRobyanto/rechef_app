import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:rechef_app/src/features/account/blocs/account/account_state.dart';
import 'package:rechef_app/src/features/account/repository/user_repository_impl.dart';

class AccountCubit extends Cubit<AccountState> {
  final UserRepositoryImpl userRepo;
  AccountCubit(this.userRepo) : super(AccountInitial());

  void loadAccount(String token) async {
    emit(AccountLoading());
    try {
      final data = await userRepo.getAccount(token);
      emit(AccountLoaded(data));
    } catch (e) {
      emit(AccountLoadError(e.toString()));
    }
  }

  @override
  void onChange(Change<AccountState> change) {
    log('[Account] : $change');
    super.onChange(change);
  }
}
