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

  final apiKey = Env.apiKey;

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.spoonacular.com',
      validateStatus: (_) => true,
    ),
  )..interceptors.add(LoggerInterceptor());

  ///
  // API Calls
  ///

  Future<List<Recipe>?> getRandomRecipes({int number = 6, String tag = ''}) async {
    try {
      final response = await dio.get('/recipes/random?number=$number&tags=$tag&apiKey=$apiKey');

      switch (response.statusCode) {
        /// Daily quota reached
        case 402:
          final error = 'NetworkService -> getRandomRecipes() -> ${response.statusCode}';
          logger.e(error);
          await Get.dialog(
            const ErrorDialog(
              text1: "Today's recipe limit has been reached",
              text2: 'Check back tomorrow for more recipes.',
            ),
          );
          return null;

        /// Rate limit
        case 429:
          final error = 'NetworkService -> getRandomRecipes() -> ${response.statusCode}';
          logger.e(error);
          await Get.dialog(
            const ErrorDialog(
              text1: 'Rate limit has been hit.',
              text2: 'Wait a moment and then try again.',
            ),
          );
          return null;

        default:
          final List responseList = response.data['recipes'];
          final recipes = responseList.map((recipe) => Recipe.fromMap(recipe)).toList();

          return recipes;
      }
    } catch (e) {
      final error = 'NetworkService -> getRandomRecipes() -> $e';
      logger.e(error);
      await Get.dialog(ErrorDialog(text1: error));
      return null;
    }
  }

  Future<Recipe?> getRecipeInformation(int id) async {
    try {
      final response = await dio.get('/recipes/$id/information?apiKey=$apiKey');

      switch (response.statusCode) {
        /// Daily quota reached
        case 402:
          final error = 'NetworkService -> getRecipeInformation() -> ${response.statusCode}';
          logger.e(error);
          await Get.dialog(
            const ErrorDialog(
              text1: "Today's recipe limit has been reached",
              text2: 'Check back tomorrow for more recipes.',
            ),
          );
          return null;

        /// Rate limit
        case 429:
          final error = 'NetworkService -> getRecipeInformation() -> ${response.statusCode}';
          logger.e(error);
          await Get.dialog(
            const ErrorDialog(
              text1: 'Rate limit has been hit.',
              text2: 'Wait a moment and then try again.',
            ),
          );
          return null;

        default:
          final recipe = Recipe.fromMap(response.data);
          return recipe;
      }
    } catch (e) {
      final error = 'NetworkService -> getRecipeInformation() -> $e';
      logger.e(error);
      await Get.dialog(ErrorDialog(text1: error));
      return null;
    }
  }

  Future<RecipeSearchResult?> searchRecipes(String query, {int number = 10}) async {
    try {
      final response = await dio.get('/recipes/complexSearch?query=$query&number=$number&addRecipeInformation=true&sort=random&apiKey=$apiKey');

      switch (response.statusCode) {
        /// Daily quota reached
        case 402:
          final error = 'NetworkService -> searchRecipes() -> ${response.statusCode}';
          logger.e(error);
          await Get.dialog(
            const ErrorDialog(
              text1: "Today's recipe limit has been reached",
              text2: 'Check back tomorrow for more recipes.',
            ),
          );
          return null;

        /// Rate limit
        case 429:
          final error = 'NetworkService -> searchRecipes() -> ${response.statusCode}';
          logger.e(error);
          await Get.dialog(
            const ErrorDialog(
              text1: 'Rate limit has been hit.',
              text2: 'Wait a moment and then try again.',
            ),
          );
          return null;

        default:
          final recipeSearchResult = RecipeSearchResult.fromMap(response.data);
          return recipeSearchResult;
      }
    } catch (e) {
      final error = 'NetworkService -> searchRecipes() -> $e';
      logger.e(error);
      await Get.dialog(ErrorDialog(text1: error));
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
    try {
      final properMinutes = minutes == null ? '' : '&maxReadyTime=$minutes';

      final response = await dio.get(
        '/recipes/complexSearch?&cuisine=$cuisine&diet=$diet&intolerances=$intolerances&includeIngredients=$includeIngredients$properMinutes&excludeIngredients=$excludeIngredients&type=$type&number=10&addRecipeInformation=true&sort=random&apiKey=$apiKey',
      );

      switch (response.statusCode) {
        /// Daily quota reached
        case 402:
          final error = 'NetworkService -> complexRecipeSearch() -> ${response.statusCode}';
          logger.e(error);
          await Get.dialog(
            const ErrorDialog(
              text1: "Today's recipe limit has been reached",
              text2: 'Check back tomorrow for more recipes.',
            ),
          );
          return null;

        /// Rate limit
        case 429:
          final error = 'NetworkService -> complexRecipeSearch() -> ${response.statusCode}';
          logger.e(error);
          await Get.dialog(
            const ErrorDialog(
              text1: 'Rate limit has been hit.',
              text2: 'Wait a moment and then try again.',
            ),
          );
          return null;

        default:
          final recipeSearchResult = RecipeSearchResult.fromMap(response.data);
          return recipeSearchResult;
      }
    } catch (e) {
      final error = 'NetworkService -> complexRecipeSearch() -> $e';
      logger.e(error);
      await Get.dialog(ErrorDialog(text1: error));
      return null;
    }
  }
}
