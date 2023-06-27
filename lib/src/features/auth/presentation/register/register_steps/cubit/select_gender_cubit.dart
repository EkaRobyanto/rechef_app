import 'dart:developer';

import 'package:bloc/bloc.dart';

class GenderCubit extends Cubit<String> {
  GenderCubit() : super('');

  void updateValue(String gender) => gender == state ? emit('') : emit(gender);

  @override
  void onChange(Change<String> change) {
    super.onChange(change);
    log(change.toString());
  }
}
