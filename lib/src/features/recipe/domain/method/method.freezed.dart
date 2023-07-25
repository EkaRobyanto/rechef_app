// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Method _$MethodFromJson(Map<String, dynamic> json) {
  return _Method.fromJson(json);
}

/// @nodoc
mixin _$Method {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'method_text')
  String? get methodText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MethodCopyWith<Method> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MethodCopyWith<$Res> {
  factory $MethodCopyWith(Method value, $Res Function(Method) then) =
      _$MethodCopyWithImpl<$Res, Method>;
  @useResult
  $Res call({String? id, @JsonKey(name: 'method_text') String? methodText});
}

/// @nodoc
class _$MethodCopyWithImpl<$Res, $Val extends Method>
    implements $MethodCopyWith<$Res> {
  _$MethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? methodText = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      methodText: freezed == methodText
          ? _value.methodText
          : methodText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MethodCopyWith<$Res> implements $MethodCopyWith<$Res> {
  factory _$$_MethodCopyWith(_$_Method value, $Res Function(_$_Method) then) =
      __$$_MethodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, @JsonKey(name: 'method_text') String? methodText});
}

/// @nodoc
class __$$_MethodCopyWithImpl<$Res>
    extends _$MethodCopyWithImpl<$Res, _$_Method>
    implements _$$_MethodCopyWith<$Res> {
  __$$_MethodCopyWithImpl(_$_Method _value, $Res Function(_$_Method) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? methodText = freezed,
  }) {
    return _then(_$_Method(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      methodText: freezed == methodText
          ? _value.methodText
          : methodText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Method implements _Method {
  _$_Method({this.id, @JsonKey(name: 'method_text') this.methodText});

  factory _$_Method.fromJson(Map<String, dynamic> json) =>
      _$$_MethodFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'method_text')
  final String? methodText;

  @override
  String toString() {
    return 'Method(id: $id, methodText: $methodText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Method &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.methodText, methodText) ||
                other.methodText == methodText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, methodText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MethodCopyWith<_$_Method> get copyWith =>
      __$$_MethodCopyWithImpl<_$_Method>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MethodToJson(
      this,
    );
  }
}

abstract class _Method implements Method {
  factory _Method(
      {final String? id,
      @JsonKey(name: 'method_text') final String? methodText}) = _$_Method;

  factory _Method.fromJson(Map<String, dynamic> json) = _$_Method.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'method_text')
  String? get methodText;
  @override
  @JsonKey(ignore: true)
  _$$_MethodCopyWith<_$_Method> get copyWith =>
      throw _privateConstructorUsedError;
}
