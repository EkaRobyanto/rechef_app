// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      id: json['id'] as String?,
      name: json['name'] as String?,
      user: json['user'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      view: json['view'] as int?,
      fav: json['fav'] as int?,
      duration: json['duration'] as String?,
      portion: json['portion'] as int?,
      calories: json['calories'] as int?,
      difficulty: json['difficulty'] as String?,
      isHiddenLike: json['is_hidden_like'] as bool?,
      isHiddenComment: json['is_hidden_comment'] as bool?,
      method: (json['method'] as List<dynamic>?)
          ?.map((e) => Method.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredientCategories: (json['ingredientCategories'] as List<dynamic>?)
          ?.map((e) => IngredientCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user': instance.user,
      'description': instance.description,
      'image': instance.image,
      'view': instance.view,
      'fav': instance.fav,
      'duration': instance.duration,
      'portion': instance.portion,
      'calories': instance.calories,
      'difficulty': instance.difficulty,
      'is_hidden_like': instance.isHiddenLike,
      'is_hidden_comment': instance.isHiddenComment,
      'method': instance.method,
      'ingredientCategories': instance.ingredientCategories,
    };
