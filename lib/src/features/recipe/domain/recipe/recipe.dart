// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../ingredient_category/ingredient_category.dart';
import '../method/method.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  factory Recipe({
    @Default(null) String? id,
    @Default(null) String? name,
    @Default(null) String? user,
    @Default(null) String? description,
    @Default(null) String? image,
    @Default(null) int? view,
    @Default(null) int? fav,
    @Default(null) int? duration,
    @Default(null) int? portion,
    @Default(null) int? calories,
    @Default('') String? difficulty,
    @Default(null) List<String>? interests,
    @Default(null) List<Method>? method,
    @Default(null) List<IngredientCategory>? ingredientCategories,
    @JsonKey(name: 'is_hidden_like') @Default(null) bool? isHiddenLike,
    @JsonKey(name: 'is_hidden_comment') @Default(null) bool? isHiddenComment,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
