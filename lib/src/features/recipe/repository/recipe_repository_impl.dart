import 'package:rechef_app/src/features/recipe/repository/recipe_repository.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  @override
  Future<List> getRecipe(String token, String id) async {
    await Future.delayed(const Duration(seconds: 2));
    return [];
  }

  @override
  Future<List> getRecipesFeed(String token, String category) async {
    await Future.delayed(const Duration(seconds: 2));
    return [];
  }

  @override
  Future updateRecipe(String token, Map<String, dynamic> recipe) async {
    await Future.delayed(const Duration(seconds: 2));
    return [];
  }

  @override
  Future deleteRecipe(String token, String id) async {
    await Future.delayed(const Duration(seconds: 2));

    return [];
  }

  @override
  Future createRecipe(String token, Map<String, dynamic> recipe) async {
    await Future.delayed(const Duration(seconds: 2));
    return [];
  }
}
