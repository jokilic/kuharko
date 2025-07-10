import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import '../models/recipe/recipe.dart';
import '../models/recipe/recipe_search_result.dart';
import '../util/env.dart';
import '../util/logger_interceptor.dart';
import '../widgets/error_dialog.dart';
import 'logger_service.dart';

class NetworkService extends GetxService {
  final logger = Get.find<LoggerService>();

  ///
  /// VARIABLES
  ///

  final baseUrl = 'https://api.spoonacular.com';
  final apiKey = Env.apiKey;

  final dio = Dio()..interceptors.add(LoggerInterceptor());

  ///
  /// METHODS
  ///

  Future<Response?> get(String path) async {
    try {
      final response = await dio.get('$baseUrl/${path}apiKey=$apiKey');
      return response;
    } catch (e) {
      logger.e('$e');
      return null;
    }
  }

  ///
  // API Calls
  ///

  Future<Recipe?> getRecipeInformation(int id) async {
    try {
      final response = await get('recipes/$id/information?');
      final recipe = Recipe.fromMap(response.data);

      return recipe;
    } catch (e) {
      logger.e('$e');
      await Get.dialog(ErrorDialog(title: '$e'));
      return null;
    }
  }

  Future<List<Recipe>?> getRandomRecipes({int number = 6, String tag = ''}) async {
    try {
      final response = await get('/recipes/random?number=$number&tags=$tag&');
      final List responseList = response.data['recipes'];
      final recipes = responseList.map((recipe) => Recipe.fromMap(recipe)).toList();

      return recipes;
    } catch (e) {
      logger.e('$e');
      await Get.dialog(ErrorDialog(title: '$e'));
      return null;
    }
  }

  Future<RecipeSearchResult?> searchRecipes(String query, {int number = 10}) async {
    try {
      final response = await get('/recipes/complexSearch?query=$query&number=$number&addRecipeInformation=true&sort=random&');
      final recipeSearchResult = RecipeSearchResult.fromMap(response.data);

      return recipeSearchResult;
    } catch (e) {
      logger.e('$e');
      await Get.dialog(ErrorDialog(title: '$e'));
      return null;
    }
  }

  Future<RecipeSearchResult?> complexRecipeSearch({
    required String cuisine,
    required String diet,
    required String intolerances,
    required String includeIngredients,
    required String excludeIngredients,
    required String type,
    int? minutes,
    int number = 10,
  }) async {
    final properMinutes = minutes == null ? '' : '&maxReadyTime=$minutes';

    try {
      final response = await get(
        '/recipes/complexSearch?&cuisine=$cuisine&diet=$diet&intolerances=$intolerances&includeIngredients=$includeIngredients$properMinutes&excludeIngredients=$excludeIngredients&type=$type&number=10&addRecipeInformation=true&sort=random&',
      );
      final recipeSearchResult = RecipeSearchResult.fromMap(response.data);

      return recipeSearchResult;
    } catch (e) {
      logger.e('$e');
      await Get.dialog(ErrorDialog(title: '$e'));
      return null;
    }
  }
}
