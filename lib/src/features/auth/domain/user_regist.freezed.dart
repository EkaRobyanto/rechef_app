// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_regist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserRegist {
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get confirmPassword => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  List<String> get interest => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserRegistCopyWith<UserRegist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegistCopyWith<$Res> {
  factory $UserRegistCopyWith(
          UserRegist value, $Res Function(UserRegist) then) =
      _$UserRegistCopyWithImpl<$Res, UserRegist>;
  @useResult
  $Res call(
      {String? username,
      String? email,
      String? password,
      String? confirmPassword,
      String? gender,
      List<String> interest});
}

/// @nodoc
class _$UserRegistCopyWithImpl<$Res, $Val extends UserRegist>
    implements $UserRegistCopyWith<$Res> {
  _$UserRegistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? gender = freezed,
    Object? interest = null,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      interest: null == interest
          ? _value.interest
          : interest // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRegistCopyWith<$Res>
    implements $UserRegistCopyWith<$Res> {
  factory _$$_UserRegistCopyWith(
          _$_UserRegist value, $Res Function(_$_UserRegist) then) =
      __$$_UserRegistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? username,
      String? email,
      String? password,
      String? confirmPassword,
      String? gender,
      List<String> interest});
}

/// @nodoc
class __$$_UserRegistCopyWithImpl<$Res>
    extends _$UserRegistCopyWithImpl<$Res, _$_UserRegist>
    implements _$$_UserRegistCopyWith<$Res> {
  __$$_UserRegistCopyWithImpl(
      _$_UserRegist _value, $Res Function(_$_UserRegist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? gender = freezed,
    Object? interest = null,
  }) {
    return _then(_$_UserRegist(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      interest: null == interest
          ? _value._interest
          : interest // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_UserRegist implements _UserRegist {
  _$_UserRegist(
      {this.username,
      this.email,
      this.password,
      this.confirmPassword,
      this.gender,
      final List<String> interest = const []})
      : _interest = interest;

  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? confirmPassword;
  @override
  final String? gender;
  final List<String> _interest;
  @override
  @JsonKey()
  List<String> get interest {
    if (_interest is EqualUnmodifiableListView) return _interest;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interest);
  }

  @override
  String toString() {
    return 'UserRegist(username: $username, email: $email, password: $password, confirmPassword: $confirmPassword, gender: $gender, interest: $interest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRegist &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            const DeepCollectionEquality().equals(other._interest, _interest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, email, password,
      confirmPassword, gender, const DeepCollectionEquality().hash(_interest));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRegistCopyWith<_$_UserRegist> get copyWith =>
      __$$_UserRegistCopyWithImpl<_$_UserRegist>(this, _$identity);
}

abstract class _UserRegist implements UserRegist {
  factory _UserRegist(
      {final String? username,
      final String? email,
      final String? password,
      final String? confirmPassword,
      final String? gender,
      final List<String> interest}) = _$_UserRegist;

  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get confirmPassword;
  @override
  String? get gender;
  @override
  List<String> get interest;
  @override
  @JsonKey(ignore: true)
  _$$_UserRegistCopyWith<_$_UserRegist> get copyWith =>
      throw _privateConstructorUsedError;
}
