import 'package:dio/dio.dart';
import 'package:rechef_app/src/features/recipe/domain/recipe/recipe.dart';
import 'package:rechef_app/src/features/recipe/repository/recipe_repository.dart';

import '../../../core/api/services.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final api = APIService();
  final client = Dio();

  @override
  Future<List> getRecipe(String token, String id) async {
    try {
      return await api.call(
        request: () async {
          return await client.postUri(
            api.detailRecipe(id),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
          );
        },
        parse: (data) => data,
      );
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future getRecipesFeed(String token) async {
    try {
      return await api.call(request: () async {
        return await client.getUri(
          api.listRecipe(),
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
        );
      }, parse: (data) {
        return data['results'].map((recipe) {
          return Recipe.fromJson(recipe);
        }).toList();
      });
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future updateRecipe(
      String token, Map<String, dynamic> recipe, String id) async {
    try {
      return await api.call(
        request: () async {
          return await client.putUri(
            api.detailRecipe(id),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
            data: recipe,
          );
        },
        parse: (data) => data,
      );
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future deleteRecipe(String token, String id) async {
    try {
      return await api.call(
        request: () async {
          return await client.deleteUri(
            api.detailRecipe(id),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
          );
        },
        parse: (data) => data,
      );
    } catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future createRecipe(String token, Recipe recipe) async {
    try {
      return await api.call(
        request: () async {
          FormData data = FormData.fromMap(
            {
              'name': recipe.name,
              'description': recipe.description,
              'image': await MultipartFile.fromFile(recipe.image!),
              'portion': recipe.portion,
              'duration': recipe.duration,
              'calories': recipe.calories,
              'status': 'active',
              'difficulty': recipe.difficulty,
              'interest': recipe.interests,
              'category': [
                for (var category in recipe.ingredientCategories!)
                  {
                    'name': category.name,
                    'core': [
                      for (var ingredient in category.ingredients!)
                        {
                          'name': ingredient.ingredientName,
                          'ingredient': {
                            'number': ingredient.id,
                            'ingredient_text': ingredient.ingredientName,
                            'note': ingredient.note,
                            'quantity': ingredient.quantity,
                            'unit': ingredient.unit,
                          },
                        }
                    ]
                  }
              ],
              'method': [
                for (var method in recipe.method!)
                  {
                    'number': method.id,
                    'method_text': method.methodText,
                  },
              ],
            },
          );
          return await client.postUri(
            api.listRecipe(),
            options: Options(
              headers: {'Authorization': 'Bearer $token'},
            ),
            data: data,
          );
        },
        parse: (data) => data,
      );
    } catch (e) {
      throw (e.toString());
    }
  }
}
