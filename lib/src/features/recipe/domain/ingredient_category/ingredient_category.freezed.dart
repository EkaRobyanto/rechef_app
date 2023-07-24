// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IngredientCategory _$IngredientCategoryFromJson(Map<String, dynamic> json) {
  return _IngredientCategory.fromJson(json);
}

/// @nodoc
mixin _$IngredientCategory {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'datas')
  List<Ingredient>? get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientCategoryCopyWith<IngredientCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCategoryCopyWith<$Res> {
  factory $IngredientCategoryCopyWith(
          IngredientCategory value, $Res Function(IngredientCategory) then) =
      _$IngredientCategoryCopyWithImpl<$Res, IngredientCategory>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      @JsonKey(name: 'datas') List<Ingredient>? ingredients});
}

/// @nodoc
class _$IngredientCategoryCopyWithImpl<$Res, $Val extends IngredientCategory>
    implements $IngredientCategoryCopyWith<$Res> {
  _$IngredientCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: freezed == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IngredientCategoryCopyWith<$Res>
    implements $IngredientCategoryCopyWith<$Res> {
  factory _$$_IngredientCategoryCopyWith(_$_IngredientCategory value,
          $Res Function(_$_IngredientCategory) then) =
      __$$_IngredientCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      @JsonKey(name: 'datas') List<Ingredient>? ingredients});
}

/// @nodoc
class __$$_IngredientCategoryCopyWithImpl<$Res>
    extends _$IngredientCategoryCopyWithImpl<$Res, _$_IngredientCategory>
    implements _$$_IngredientCategoryCopyWith<$Res> {
  __$$_IngredientCategoryCopyWithImpl(
      _$_IngredientCategory _value, $Res Function(_$_IngredientCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_$_IngredientCategory(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: freezed == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IngredientCategory implements _IngredientCategory {
  _$_IngredientCategory(
      {this.id,
      this.name,
      @JsonKey(name: 'datas') final List<Ingredient>? ingredients})
      : _ingredients = ingredients;

  factory _$_IngredientCategory.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientCategoryFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  final List<Ingredient>? _ingredients;
  @override
  @JsonKey(name: 'datas')
  List<Ingredient>? get ingredients {
    final value = _ingredients;
    if (value == null) return null;
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'IngredientCategory(id: $id, name: $name, ingredients: $ingredients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IngredientCategoryCopyWith<_$_IngredientCategory> get copyWith =>
      __$$_IngredientCategoryCopyWithImpl<_$_IngredientCategory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientCategoryToJson(
      this,
    );
  }
}

abstract class _IngredientCategory implements IngredientCategory {
  factory _IngredientCategory(
          {final String? id,
          final String? name,
          @JsonKey(name: 'datas') final List<Ingredient>? ingredients}) =
      _$_IngredientCategory;

  factory _IngredientCategory.fromJson(Map<String, dynamic> json) =
      _$_IngredientCategory.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'datas')
  List<Ingredient>? get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientCategoryCopyWith<_$_IngredientCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
