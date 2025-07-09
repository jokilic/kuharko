import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/models.dart';
import '../services/api.dart';

class Network {
  final Api _api = Api();

  /// ----------------------
  // API Calls
  /// ----------------------

  /// Recipes

  Future<Recipe> getRecipeInformation(int id) async {
    try {
      final Response<dynamic> _response = await _api.get('recipes/$id/information?');
      final Recipe _recipe = Recipe.fromJson(_response.data);

      return _recipe;
    } catch (e) {
      return null;
    }
  }

  Future<List<Recipe>> getRandomRecipes({int number = 6, String tag = ''}) async {
    try {
      final Response<dynamic> _response = await _api.get('/recipes/random?number=$number&tags=$tag&');
      log(_response.toString());
      final List<dynamic> _responseList = _response.data['recipes'];
      final List<Recipe> _recipes = _responseList.map((_recipe) => Recipe.fromJson(_recipe)).toList();

      return _recipes;
    } catch (e) {
      return null;
    }
  }

  Future<List<SimilarRecipe>> getSimilarRecipes(int id, {int number = 6}) async {
    try {
      final Response<dynamic> _response = await _api.get('/recipes/$id/similar?number=$number&');

      final List<dynamic> _responseList = _response.data;
      final List<SimilarRecipe> _recipes = _responseList.map((_recipe) => SimilarRecipe.fromJson(_recipe)).toList();

      return _recipes;
    } catch (e) {
      return null;
    }
  }

  Future<RecipeSummary> getRecipeSummary(int id) async {
    try {
      final Response<dynamic> _response = await _api.get('/recipes/$id/summary?');
      final RecipeSummary _recipeSummary = RecipeSummary.fromJson(_response.data);

      return _recipeSummary;
    } catch (e) {
      return null;
    }
  }

  Future<RecipeSearchResult> searchRecipes(String query, {int number = 10}) async {
    try {
      final Response<dynamic> _response = await _api.get('/recipes/complexSearch?query=$query&number=$number&addRecipeInformation=true&sort=random&');
      final RecipeSearchResult _recipeSearchResult = RecipeSearchResult.fromJson(_response.data);

      return _recipeSearchResult;
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
    final String properMinutes = minutes == null ? '' : '&maxReadyTime=$minutes';

    try {
      final Response<dynamic> _response = await _api.get(
          '/recipes/complexSearch?&cuisine=$cuisine&diet=$diet&intolerances=$intolerances&includeIngredients=$includeIngredients$properMinutes&excludeIngredients=$excludeIngredients&type=$type&number=10&addRecipeInformation=true&sort=random&');
      final RecipeSearchResult _recipeSearchResult = RecipeSearchResult.fromJson(_response.data);

      return _recipeSearchResult;
    } catch (e) {
      return null;
    }
  }

  /// Ingredients

  Future<Ingredient> getIngredientInformation(int id) async {
    try {
      final Response<dynamic> _response = await _api.get('/food/ingredients/$id/information?');
      final Ingredient _ingredient = Ingredient.fromJson(_response.data);

      return _ingredient;
    } catch (e) {
      return null;
    }
  }

  Future<IngredientSubstitute> getIngredientSubstitute(String query) async {
    try {
      final Response<dynamic> _response = await _api.get('/food/ingredients/substitutes?ingredientName=$query&');
      final IngredientSubstitute _ingredientSubstitute = IngredientSubstitute.fromJson(_response.data);

      return _ingredientSubstitute;
    } catch (e) {
      return null;
    }
  }

  Future<IngredientSearchResult> searchIngredients(String query, {int number = 6}) async {
    try {
      final Response<dynamic> _response = await _api.get('/food/ingredients/search?query=$query&number=$number&');
      final IngredientSearchResult _ingredientSearchResult = IngredientSearchResult.fromJson(_response.data);

      return _ingredientSearchResult;
    } catch (e) {
      return null;
    }
  }

  /// Products

  Future<Product> getProductInformation(int id) async {
    try {
      final Response<dynamic> _response = await _api.get('/food/products/$id?');
      final Product _product = Product.fromJson(_response.data);

      return _product;
    } catch (e) {
      return null;
    }
  }

  Future<ProductSearchResult> searchProducts(String query, {int number = 6}) async {
    try {
      final Response<dynamic> _response = await _api.get('/food/products/search?query=$query&number=$number&');
      final ProductSearchResult _productSearchResult = ProductSearchResult.fromJson(_response.data);

      return _productSearchResult;
    } catch (e) {
      return null;
    }
  }

  /// Menu Items

  Future<MenuItem> getMenuItemInformation(int id) async {
    try {
      final Response<dynamic> _response = await _api.get('/food/menuItems/$id?');
      final MenuItem _menuItem = MenuItem.fromJson(_response.data);

      return _menuItem;
    } catch (e) {
      return null;
    }
  }

  Future<MenuItemSearchResult> searchMenuItems(String query, {int number = 6}) async {
    try {
      final Response<dynamic> _response = await _api.get('/food/menuItems/search?query=$query&number=$number&');
      final MenuItemSearchResult _menuItemSearchResult = MenuItemSearchResult.fromJson(_response.data);

      return _menuItemSearchResult;
    } catch (e) {
      return null;
    }
  }

  /// Wines

  Future<DishForWinePairing> getDishForWinePairing(String query) async {
    try {
      final Response<dynamic> _response = await _api.get('/food/wine/dishes?wine=$query&');
      final DishForWinePairing _dishForWinePairing = DishForWinePairing.fromJson(_response.data);

      return _dishForWinePairing;
    } catch (e) {
      return null;
    }
  }

  Future<WineForDishPairing> getWineForDishPairing(String query) async {
    try {
      final Response<dynamic> _response = await _api.get('/food/wine/pairing?food=$query&');
      final WineForDishPairing _wineForDishPairing = WineForDishPairing.fromJson(_response.data);

      return _wineForDishPairing;
    } catch (e) {
      return null;
    }
  }

  Future<WineDescription> getWineDescription(String query) async {
    try {
      final Response<dynamic> _response = await _api.get('/food/wine/description?wine=$query&');
      final WineDescription _wineDescription = WineDescription.fromJson(_response.data);

      return _wineDescription;
    } catch (e) {
      return null;
    }
  }

  Future<WineRecommendation> getWineRecommendation(String query, {int number = 6}) async {
    try {
      final Response<dynamic> _response = await _api.get('/food/wine/recommendation?wine=$query&number=$number&');
      final WineRecommendation _wineRecommendation = WineRecommendation.fromJson(_response.data);

      return _wineRecommendation;
    } catch (e) {
      return null;
    }
  }

  /// Global Search

  Future<GlobalSearch> searchGlobal(String query, {int number = 10}) async {
    try {
      final Response<dynamic> _response = await _api.get('/food/search?query=$query&number=$number&');
      final GlobalSearch _globalSearch = GlobalSearch.fromJson(_response.data);

      return _globalSearch;
    } catch (e) {
      return null;
    }
  }

  /// Jokes & Trivia

  Future<RandomJoke> getRandomJoke() async {
    try {
      final Response<dynamic> _response = await _api.get('/food/jokes/random?');
      final RandomJoke _randomJoke = RandomJoke.fromJson(_response.data);

      return _randomJoke;
    } catch (e) {
      return null;
    }
  }

  Future<RandomTrivia> getRandomTrivia() async {
    try {
      final Response<dynamic> _response = await _api.get('/food/trivia/random?');
      final RandomTrivia _randomTrivia = RandomTrivia.fromJson(_response.data);

      return _randomTrivia;
    } catch (e) {
      return null;
    }
  }

  /// Meal Plans

  Future<MealPlanDay> getMealPlanDay({String diet, String exclude}) async {
    try {
      final Response<dynamic> _response = await _api.get('/mealplanner/generate?timeFrame=day&diet=$diet&exclude=$exclude&');
      final MealPlanDay _mealPlanDay = MealPlanDay.fromJson(_response.data);

      return _mealPlanDay;
    } catch (e) {
      return null;
    }
  }

  Future<MealPlanWeek> getMealPlanWeek({String diet, String exclude}) async {
    try {
      final Response<dynamic> _response = await _api.get('/mealplanner/generate?timeFrame=week&diet=$diet&exclude=$exclude&');
      final MealPlanWeek _mealPlanWeek = MealPlanWeek.fromJson(_response.data);

      return _mealPlanWeek;
    } catch (e) {
      return null;
    }
  }
}
