// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IngredientCategory _$$_IngredientCategoryFromJson(
        Map<String, dynamic> json) =>
    _$_IngredientCategory(
      id: json['id'] as String?,
      name: json['name'] as String?,
      ingredients: (json['datas'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_IngredientCategoryToJson(
        _$_IngredientCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'datas': instance.ingredients,
    };
