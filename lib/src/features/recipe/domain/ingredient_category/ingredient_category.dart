// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../ingredient/ingredient.dart';

part 'ingredient_category.freezed.dart';
part 'ingredient_category.g.dart';

@freezed
class IngredientCategory with _$IngredientCategory {
  factory IngredientCategory({
    String? id,
    String? name,
    @JsonKey(name: 'datas') List<Ingredient>? ingredients,
  }) = _IngredientCategory;

  factory IngredientCategory.fromJson(Map<String, dynamic> json) =>
      _$IngredientCategoryFromJson(json);
}
