import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_regist.freezed.dart';

@freezed
class UserRegist with _$UserRegist {
  factory UserRegist({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
    String? gender,
    @Default([]) List<String> interest,
  }) = _UserRegist;
}
