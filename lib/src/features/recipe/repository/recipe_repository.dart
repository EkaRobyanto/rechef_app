import 'package:rechef_app/src/features/recipe/domain/recipe/recipe.dart';

abstract class RecipeRepository {
  Future updateRecipe(String token, Map<String, dynamic> recipe, String id);
  Future createRecipe(String token, Recipe recipe);
  Future<List<dynamic>> getRecipe(String token, String id);
  Future<List<dynamic>> getRecipesFeed(String token);
  Future deleteRecipe(String token, String id);
}
