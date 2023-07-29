import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:rechef_app/src/core/repository/storage_repository.dart';
import 'package:rechef_app/src/features/account/blocs/account/account_state.dart';
import 'package:rechef_app/src/features/account/repository/user_repository_impl.dart';

class AccountCubit extends Cubit<AccountState> {
  final UserRepositoryImpl userRepo;
  final StorageRepository storageRepo;
  AccountCubit(this.userRepo, this.storageRepo) : super(AccountInitial());

  void loadAccount() async {
    emit(AccountLoading());
    try {
      var tokens = await storageRepo.getTokens();
      final data = await userRepo.getAccount(tokens['access']!);
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
