import '../models/models.dart';
import '../services/api.dart';

class Network {
  final api = Api();

  ///
  // API Calls
  ///

  Future<Recipe> getRecipeInformation(int id) async {
    try {
      final response = await api.get('recipes/$id/information?');
      final recipe = Recipe.fromJson(response.data);

      return recipe;
    } catch (e) {
      return null;
    }
  }

  Future<List<Recipe>> getRandomRecipes({int number = 6, String tag = ''}) async {
    try {
      final response = await api.get('/recipes/random?number=$number&tags=$tag&');
      final List responseList = response.data['recipes'];
      final recipes = responseList.map((recipe) => Recipe.fromJson(recipe)).toList();

      return recipes;
    } catch (e) {
      return null;
    }
  }

  Future<RecipeSearchResult> searchRecipes(String query, {int number = 10}) async {
    try {
      final response = await api.get('/recipes/complexSearch?query=$query&number=$number&addRecipeInformation=true&sort=random&');
      final recipeSearchResult = RecipeSearchResult.fromJson(response.data);

      return recipeSearchResult;
    } catch (e) {
      return null;
    }
  }

  Future<RecipeSearchResult> complexRecipeSearch({
    String cuisine,
    String diet,
    String intolerances,
    String includeIngredients,
    String excludeIngredients,
    String type,
    int minutes,
    int number = 10,
  }) async {
    final properMinutes = minutes == null ? '' : '&maxReadyTime=$minutes';

    try {
      final response = await api.get(
          '/recipes/complexSearch?&cuisine=$cuisine&diet=$diet&intolerances=$intolerances&includeIngredients=$includeIngredients$properMinutes&excludeIngredients=$excludeIngredients&type=$type&number=10&addRecipeInformation=true&sort=random&');
      final recipeSearchResult = RecipeSearchResult.fromJson(response.data);

      return recipeSearchResult;
    } catch (e) {
      return null;
    }
  }
}
