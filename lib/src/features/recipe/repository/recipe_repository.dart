abstract class RecipeRepository {
  Future updateRecipe(String token, Map<String, dynamic> recipe);
  Future createRecipe(String token, Map<String, dynamic> recipe);
  Future<List<dynamic>> getRecipe(String token, String id);
  Future<List<dynamic>> getRecipesFeed(String token, String category);
  Future deleteRecipe(String token, String id);
}
