// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../ingredient_category/ingredient_category.dart';
import '../method/method.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  factory Recipe({
    String? id,
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
    List<IngredientCategory>? ingredientCategories,
    List<String>? interests,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
