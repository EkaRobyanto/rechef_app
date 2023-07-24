// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ingredient _$$_IngredientFromJson(Map<String, dynamic> json) =>
    _$_Ingredient(
      id: json['id'] as String?,
      ingredientName: json['ingredient_text'] as String?,
      quantity: json['quantity'] as int?,
      unit: json['unit'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_IngredientToJson(_$_Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ingredient_text': instance.ingredientName,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'note': instance.note,
    };
