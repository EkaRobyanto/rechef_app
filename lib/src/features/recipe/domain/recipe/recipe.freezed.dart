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
  int? get duration => throw _privateConstructorUsedError;
  int? get portion => throw _privateConstructorUsedError;
  int? get calories => throw _privateConstructorUsedError;
  String? get difficulty => throw _privateConstructorUsedError;
  List<String>? get interests => throw _privateConstructorUsedError;
  List<Method>? get method => throw _privateConstructorUsedError;
  List<IngredientCategory>? get ingredientCategories =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'is_hidden_like')
  bool? get isHiddenLike => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_hidden_comment')
  bool? get isHiddenComment => throw _privateConstructorUsedError;

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
      int? duration,
      int? portion,
      int? calories,
      String? difficulty,
      List<String>? interests,
      List<Method>? method,
      List<IngredientCategory>? ingredientCategories,
      @JsonKey(name: 'is_hidden_like') bool? isHiddenLike,
      @JsonKey(name: 'is_hidden_comment') bool? isHiddenComment});
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
    Object? interests = freezed,
    Object? method = freezed,
    Object? ingredientCategories = freezed,
    Object? isHiddenLike = freezed,
    Object? isHiddenComment = freezed,
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
              as int?,
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
      interests: freezed == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as List<Method>?,
      ingredientCategories: freezed == ingredientCategories
          ? _value.ingredientCategories
          : ingredientCategories // ignore: cast_nullable_to_non_nullable
              as List<IngredientCategory>?,
      isHiddenLike: freezed == isHiddenLike
          ? _value.isHiddenLike
          : isHiddenLike // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHiddenComment: freezed == isHiddenComment
          ? _value.isHiddenComment
          : isHiddenComment // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      int? duration,
      int? portion,
      int? calories,
      String? difficulty,
      List<String>? interests,
      List<Method>? method,
      List<IngredientCategory>? ingredientCategories,
      @JsonKey(name: 'is_hidden_like') bool? isHiddenLike,
      @JsonKey(name: 'is_hidden_comment') bool? isHiddenComment});
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
    Object? interests = freezed,
    Object? method = freezed,
    Object? ingredientCategories = freezed,
    Object? isHiddenLike = freezed,
    Object? isHiddenComment = freezed,
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
              as int?,
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
      interests: freezed == interests
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      method: freezed == method
          ? _value._method
          : method // ignore: cast_nullable_to_non_nullable
              as List<Method>?,
      ingredientCategories: freezed == ingredientCategories
          ? _value._ingredientCategories
          : ingredientCategories // ignore: cast_nullable_to_non_nullable
              as List<IngredientCategory>?,
      isHiddenLike: freezed == isHiddenLike
          ? _value.isHiddenLike
          : isHiddenLike // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHiddenComment: freezed == isHiddenComment
          ? _value.isHiddenComment
          : isHiddenComment // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Recipe implements _Recipe {
  _$_Recipe(
      {this.id = null,
      this.name = null,
      this.user = null,
      this.description = null,
      this.image = null,
      this.view = null,
      this.fav = null,
      this.duration = null,
      this.portion = null,
      this.calories = null,
      this.difficulty = '',
      final List<String>? interests = null,
      final List<Method>? method = null,
      final List<IngredientCategory>? ingredientCategories = null,
      @JsonKey(name: 'is_hidden_like') this.isHiddenLike = null,
      @JsonKey(name: 'is_hidden_comment') this.isHiddenComment = null})
      : _interests = interests,
        _method = method,
        _ingredientCategories = ingredientCategories;

  factory _$_Recipe.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeFromJson(json);

  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey()
  final String? name;
  @override
  @JsonKey()
  final String? user;
  @override
  @JsonKey()
  final String? description;
  @override
  @JsonKey()
  final String? image;
  @override
  @JsonKey()
  final int? view;
  @override
  @JsonKey()
  final int? fav;
  @override
  @JsonKey()
  final int? duration;
  @override
  @JsonKey()
  final int? portion;
  @override
  @JsonKey()
  final int? calories;
  @override
  @JsonKey()
  final String? difficulty;
  final List<String>? _interests;
  @override
  @JsonKey()
  List<String>? get interests {
    final value = _interests;
    if (value == null) return null;
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Method>? _method;
  @override
  @JsonKey()
  List<Method>? get method {
    final value = _method;
    if (value == null) return null;
    if (_method is EqualUnmodifiableListView) return _method;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IngredientCategory>? _ingredientCategories;
  @override
  @JsonKey()
  List<IngredientCategory>? get ingredientCategories {
    final value = _ingredientCategories;
    if (value == null) return null;
    if (_ingredientCategories is EqualUnmodifiableListView)
      return _ingredientCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'is_hidden_like')
  final bool? isHiddenLike;
  @override
  @JsonKey(name: 'is_hidden_comment')
  final bool? isHiddenComment;

  @override
  String toString() {
    return 'Recipe(id: $id, name: $name, user: $user, description: $description, image: $image, view: $view, fav: $fav, duration: $duration, portion: $portion, calories: $calories, difficulty: $difficulty, interests: $interests, method: $method, ingredientCategories: $ingredientCategories, isHiddenLike: $isHiddenLike, isHiddenComment: $isHiddenComment)';
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
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            const DeepCollectionEquality().equals(other._method, _method) &&
            const DeepCollectionEquality()
                .equals(other._ingredientCategories, _ingredientCategories) &&
            (identical(other.isHiddenLike, isHiddenLike) ||
                other.isHiddenLike == isHiddenLike) &&
            (identical(other.isHiddenComment, isHiddenComment) ||
                other.isHiddenComment == isHiddenComment));
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
      const DeepCollectionEquality().hash(_interests),
      const DeepCollectionEquality().hash(_method),
      const DeepCollectionEquality().hash(_ingredientCategories),
      isHiddenLike,
      isHiddenComment);

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
          final int? duration,
          final int? portion,
          final int? calories,
          final String? difficulty,
          final List<String>? interests,
          final List<Method>? method,
          final List<IngredientCategory>? ingredientCategories,
          @JsonKey(name: 'is_hidden_like') final bool? isHiddenLike,
          @JsonKey(name: 'is_hidden_comment') final bool? isHiddenComment}) =
      _$_Recipe;

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
  int? get duration;
  @override
  int? get portion;
  @override
  int? get calories;
  @override
  String? get difficulty;
  @override
  List<String>? get interests;
  @override
  List<Method>? get method;
  @override
  List<IngredientCategory>? get ingredientCategories;
  @override
  @JsonKey(name: 'is_hidden_like')
  bool? get isHiddenLike;
  @override
  @JsonKey(name: 'is_hidden_comment')
  bool? get isHiddenComment;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      throw _privateConstructorUsedError;
}
