// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Namecategory _$$_NamecategoryFromJson(Map<String, dynamic> json) =>
    _$_Namecategory(
      ingredient: (json['ingredient'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NamecategoryToJson(_$_Namecategory instance) =>
    <String, dynamic>{
      'ingredient': instance.ingredient,
    };
