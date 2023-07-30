// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      id: json['id'] as String? ?? null,
      name: json['name'] as String? ?? null,
      user: json['user'] as String? ?? null,
      description: json['description'] as String? ?? null,
      image: json['image'] as String? ?? null,
      view: json['view'] as int? ?? null,
      fav: json['fav'] as int? ?? null,
      duration: json['duration'] as int? ?? null,
      portion: json['portion'] as int? ?? null,
      calories: json['calories'] as int? ?? null,
      difficulty: json['difficulty'] as String? ?? '',
      interests: (json['interests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          null,
      method: (json['method'] as List<dynamic>?)
              ?.map((e) => Method.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      ingredientCategories: (json['ingredientCategories'] as List<dynamic>?)
              ?.map(
                  (e) => IngredientCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      isHiddenLike: json['is_hidden_like'] as bool? ?? null,
      isHiddenComment: json['is_hidden_comment'] as bool? ?? null,
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
      'interests': instance.interests,
      'method': instance.method,
      'ingredientCategories': instance.ingredientCategories,
      'is_hidden_like': instance.isHiddenLike,
      'is_hidden_comment': instance.isHiddenComment,
    };
