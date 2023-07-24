// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'name_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NameCategory _$NameCategoryFromJson(Map<String, dynamic> json) {
  return _Namecategory.fromJson(json);
}

/// @nodoc
mixin _$NameCategory {
  List<Ingredient>? get ingredient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameCategoryCopyWith<NameCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameCategoryCopyWith<$Res> {
  factory $NameCategoryCopyWith(
          NameCategory value, $Res Function(NameCategory) then) =
      _$NameCategoryCopyWithImpl<$Res, NameCategory>;
  @useResult
  $Res call({List<Ingredient>? ingredient});
}

/// @nodoc
class _$NameCategoryCopyWithImpl<$Res, $Val extends NameCategory>
    implements $NameCategoryCopyWith<$Res> {
  _$NameCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredient = freezed,
  }) {
    return _then(_value.copyWith(
      ingredient: freezed == ingredient
          ? _value.ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NamecategoryCopyWith<$Res>
    implements $NameCategoryCopyWith<$Res> {
  factory _$$_NamecategoryCopyWith(
          _$_Namecategory value, $Res Function(_$_Namecategory) then) =
      __$$_NamecategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Ingredient>? ingredient});
}

/// @nodoc
class __$$_NamecategoryCopyWithImpl<$Res>
    extends _$NameCategoryCopyWithImpl<$Res, _$_Namecategory>
    implements _$$_NamecategoryCopyWith<$Res> {
  __$$_NamecategoryCopyWithImpl(
      _$_Namecategory _value, $Res Function(_$_Namecategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredient = freezed,
  }) {
    return _then(_$_Namecategory(
      ingredient: freezed == ingredient
          ? _value._ingredient
          : ingredient // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Namecategory implements _Namecategory {
  _$_Namecategory({final List<Ingredient>? ingredient})
      : _ingredient = ingredient;

  factory _$_Namecategory.fromJson(Map<String, dynamic> json) =>
      _$$_NamecategoryFromJson(json);

  final List<Ingredient>? _ingredient;
  @override
  List<Ingredient>? get ingredient {
    final value = _ingredient;
    if (value == null) return null;
    if (_ingredient is EqualUnmodifiableListView) return _ingredient;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NameCategory(ingredient: $ingredient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Namecategory &&
            const DeepCollectionEquality()
                .equals(other._ingredient, _ingredient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ingredient));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NamecategoryCopyWith<_$_Namecategory> get copyWith =>
      __$$_NamecategoryCopyWithImpl<_$_Namecategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NamecategoryToJson(
      this,
    );
  }
}

abstract class _Namecategory implements NameCategory {
  factory _Namecategory({final List<Ingredient>? ingredient}) = _$_Namecategory;

  factory _Namecategory.fromJson(Map<String, dynamic> json) =
      _$_Namecategory.fromJson;

  @override
  List<Ingredient>? get ingredient;
  @override
  @JsonKey(ignore: true)
  _$$_NamecategoryCopyWith<_$_Namecategory> get copyWith =>
      throw _privateConstructorUsedError;
}
