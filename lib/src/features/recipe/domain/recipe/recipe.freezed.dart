// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int? get view => throw _privateConstructorUsedError;
  int? get fav => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  int? get portion => throw _privateConstructorUsedError;
  int? get calories => throw _privateConstructorUsedError;
  String? get difficulty => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_hidden_like')
  bool? get isHiddenLike => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_hidden_comment')
  bool? get isHiddenComment => throw _privateConstructorUsedError;
  List<Method>? get method => throw _privateConstructorUsedError;
  List<IngredientCategory>? get ingredientCategories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? user,
      String? description,
      String? image,
      int? view,
      int? fav,
      String? duration,
      int? portion,
      int? calories,
      String? difficulty,
      @JsonKey(name: 'is_hidden_like') bool? isHiddenLike,
      @JsonKey(name: 'is_hidden_comment') bool? isHiddenComment,
      List<Method>? method,
      List<IngredientCategory>? ingredientCategories});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? user = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? view = freezed,
    Object? fav = freezed,
    Object? duration = freezed,
    Object? portion = freezed,
    Object? calories = freezed,
    Object? difficulty = freezed,
    Object? isHiddenLike = freezed,
    Object? isHiddenComment = freezed,
    Object? method = freezed,
    Object? ingredientCategories = freezed,
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
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      view: freezed == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as int?,
      fav: freezed == fav
          ? _value.fav
          : fav // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      portion: freezed == portion
          ? _value.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as int?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      isHiddenLike: freezed == isHiddenLike
          ? _value.isHiddenLike
          : isHiddenLike // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHiddenComment: freezed == isHiddenComment
          ? _value.isHiddenComment
          : isHiddenComment // ignore: cast_nullable_to_non_nullable
              as bool?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as List<Method>?,
      ingredientCategories: freezed == ingredientCategories
          ? _value.ingredientCategories
          : ingredientCategories // ignore: cast_nullable_to_non_nullable
              as List<IngredientCategory>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$_RecipeCopyWith(_$_Recipe value, $Res Function(_$_Recipe) then) =
      __$$_RecipeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? user,
      String? description,
      String? image,
      int? view,
      int? fav,
      String? duration,
      int? portion,
      int? calories,
      String? difficulty,
      @JsonKey(name: 'is_hidden_like') bool? isHiddenLike,
      @JsonKey(name: 'is_hidden_comment') bool? isHiddenComment,
      List<Method>? method,
      List<IngredientCategory>? ingredientCategories});
}

/// @nodoc
class __$$_RecipeCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$_Recipe>
    implements _$$_RecipeCopyWith<$Res> {
  __$$_RecipeCopyWithImpl(_$_Recipe _value, $Res Function(_$_Recipe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? user = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? view = freezed,
    Object? fav = freezed,
    Object? duration = freezed,
    Object? portion = freezed,
    Object? calories = freezed,
    Object? difficulty = freezed,
    Object? isHiddenLike = freezed,
    Object? isHiddenComment = freezed,
    Object? method = freezed,
    Object? ingredientCategories = freezed,
  }) {
    return _then(_$_Recipe(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      view: freezed == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as int?,
      fav: freezed == fav
          ? _value.fav
          : fav // ignore: cast_nullable_to_non_nullable
              as int?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      portion: freezed == portion
          ? _value.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as int?,
      calories: freezed == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      isHiddenLike: freezed == isHiddenLike
          ? _value.isHiddenLike
          : isHiddenLike // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHiddenComment: freezed == isHiddenComment
          ? _value.isHiddenComment
          : isHiddenComment // ignore: cast_nullable_to_non_nullable
              as bool?,
      method: freezed == method
          ? _value._method
          : method // ignore: cast_nullable_to_non_nullable
              as List<Method>?,
      ingredientCategories: freezed == ingredientCategories
          ? _value._ingredientCategories
          : ingredientCategories // ignore: cast_nullable_to_non_nullable
              as List<IngredientCategory>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Recipe implements _Recipe {
  _$_Recipe(
      {this.id,
      this.name,
      this.user,
      this.description,
      this.image,
      this.view,
      this.fav,
      this.duration,
      this.portion,
      this.calories,
      this.difficulty,
      @JsonKey(name: 'is_hidden_like') this.isHiddenLike,
      @JsonKey(name: 'is_hidden_comment') this.isHiddenComment,
      final List<Method>? method,
      final List<IngredientCategory>? ingredientCategories})
      : _method = method,
        _ingredientCategories = ingredientCategories;

  factory _$_Recipe.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? user;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final int? view;
  @override
  final int? fav;
  @override
  final String? duration;
  @override
  final int? portion;
  @override
  final int? calories;
  @override
  final String? difficulty;
  @override
  @JsonKey(name: 'is_hidden_like')
  final bool? isHiddenLike;
  @override
  @JsonKey(name: 'is_hidden_comment')
  final bool? isHiddenComment;
  final List<Method>? _method;
  @override
  List<Method>? get method {
    final value = _method;
    if (value == null) return null;
    if (_method is EqualUnmodifiableListView) return _method;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IngredientCategory>? _ingredientCategories;
  @override
  List<IngredientCategory>? get ingredientCategories {
    final value = _ingredientCategories;
    if (value == null) return null;
    if (_ingredientCategories is EqualUnmodifiableListView)
      return _ingredientCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Recipe(id: $id, name: $name, user: $user, description: $description, image: $image, view: $view, fav: $fav, duration: $duration, portion: $portion, calories: $calories, difficulty: $difficulty, isHiddenLike: $isHiddenLike, isHiddenComment: $isHiddenComment, method: $method, ingredientCategories: $ingredientCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Recipe &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.view, view) || other.view == view) &&
            (identical(other.fav, fav) || other.fav == fav) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.portion, portion) || other.portion == portion) &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.isHiddenLike, isHiddenLike) ||
                other.isHiddenLike == isHiddenLike) &&
            (identical(other.isHiddenComment, isHiddenComment) ||
                other.isHiddenComment == isHiddenComment) &&
            const DeepCollectionEquality().equals(other._method, _method) &&
            const DeepCollectionEquality()
                .equals(other._ingredientCategories, _ingredientCategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      user,
      description,
      image,
      view,
      fav,
      duration,
      portion,
      calories,
      difficulty,
      isHiddenLike,
      isHiddenComment,
      const DeepCollectionEquality().hash(_method),
      const DeepCollectionEquality().hash(_ingredientCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      __$$_RecipeCopyWithImpl<_$_Recipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  factory _Recipe(
      {final String? id,
      final String? name,
      final String? user,
      final String? description,
      final String? image,
      final int? view,
      final int? fav,
      final String? duration,
      final int? portion,
      final int? calories,
      final String? difficulty,
      @JsonKey(name: 'is_hidden_like') final bool? isHiddenLike,
      @JsonKey(name: 'is_hidden_comment') final bool? isHiddenComment,
      final List<Method>? method,
      final List<IngredientCategory>? ingredientCategories}) = _$_Recipe;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$_Recipe.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get user;
  @override
  String? get description;
  @override
  String? get image;
  @override
  int? get view;
  @override
  int? get fav;
  @override
  String? get duration;
  @override
  int? get portion;
  @override
  int? get calories;
  @override
  String? get difficulty;
  @override
  @JsonKey(name: 'is_hidden_like')
  bool? get isHiddenLike;
  @override
  @JsonKey(name: 'is_hidden_comment')
  bool? get isHiddenComment;
  @override
  List<Method>? get method;
  @override
  List<IngredientCategory>? get ingredientCategories;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      throw _privateConstructorUsedError;
}
