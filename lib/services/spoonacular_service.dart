import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../constants/cuisine.dart';
import '../constants/meal_type.dart';
import '../models/recipe/recipe.dart';
import '../models/recipe/recipe_search_result.dart';
import 'logger_service.dart';
import 'network_service.dart';
import 'theme_service.dart';

class SpoonacularService extends GetxService {
  ///
  /// CONSTRUCTOR
  ///

  final SharedPreferences sharedPreferences;
  final LoggerService logger;
  final NetworkService network;
  final ThemeService theme;

  SpoonacularService({
    required this.sharedPreferences,
    required this.logger,
    required this.network,
    required this.theme,
  });

  ///
  /// REACTIVE VARIABLES
  ///

  final _searchQuery = ''.obs;
  String get searchQuery => _searchQuery.value;
  set searchQuery(String value) => _searchQuery.value = value;

  final _randomRecipes = <Recipe>[].obs;
  List<Recipe> get randomRecipes => _randomRecipes;
  set randomRecipes(List<Recipe> value) => _randomRecipes.assignAll(value);

  final _cuisineRecipes = <Recipe>[].obs;
  List<Recipe> get cuisineRecipes => _cuisineRecipes;
  set cuisineRecipes(List<Recipe> value) => _cuisineRecipes.assignAll(value);

  final _mealTypeRecipes = <Recipe>[].obs;
  List<Recipe> get mealTypeRecipes => _mealTypeRecipes;
  set mealTypeRecipes(List<Recipe> value) => _mealTypeRecipes.assignAll(value);

  final _recipeSearchResult = Rxn<RecipeSearchResult?>();
  RecipeSearchResult? get recipeSearchResult => _recipeSearchResult.value;
  set recipeSearchResult(RecipeSearchResult? value) => _recipeSearchResult.value = value;

  final _recipeInformation = Rxn<Recipe?>();
  Recipe? get recipeInformation => _recipeInformation.value;
  set recipeInformation(Recipe? value) => _recipeInformation.value = value;

  final _recipeIsFavorited = false.obs;
  bool get recipeIsFavorited => _recipeIsFavorited.value;
  set recipeIsFavorited(bool value) => _recipeIsFavorited.value = value;

  final _favoriteRecipes = <List<String>>[].obs;
  List<List<String>> get favoriteRecipes => _favoriteRecipes;
  set favoriteRecipes(List<List<String>> value) => _favoriteRecipes.assignAll(value);

  final _randomCuisineName = ''.obs;
  String get randomCuisineName => _randomCuisineName.value;
  set randomCuisineName(String value) => _randomCuisineName.value = value;

  final _randomMealTypeName = ''.obs;
  String get randomMealTypeName => _randomMealTypeName.value;
  set randomMealTypeName(String value) => _randomMealTypeName.value = value;

  final _wantedCuisinesList = <String>[].obs;
  List<String> get wantedCuisinesList => _wantedCuisinesList;
  set wantedCuisinesList(List<String> value) => _wantedCuisinesList.assignAll(value);

  final _wantedDietsList = <String>[].obs;
  List<String> get wantedDietsList => _wantedDietsList;
  set wantedDietsList(List<String> value) => _wantedDietsList.assignAll(value);

  final _intolerancesList = <String>[].obs;
  List<String> get intolerancesList => _intolerancesList;
  set intolerancesList(List<String> value) => _intolerancesList.assignAll(value);

  final _wantedMealTypesList = <String>[].obs;
  List<String> get wantedMealTypesList => _wantedMealTypesList;
  set wantedMealTypesList(List<String> value) => _wantedMealTypesList.assignAll(value);

  final _ingredientsInKitchen = <String>[].obs;
  List<String> get ingredientsInKitchen => _ingredientsInKitchen;
  set ingredientsInKitchen(List<String> value) => _ingredientsInKitchen.assignAll(value);

  final _unwantedIngredientsInKitchen = <String>[].obs;
  List<String> get unwantedIngredientsInKitchen => _unwantedIngredientsInKitchen;
  set unwantedIngredientsInKitchen(List<String> value) => _unwantedIngredientsInKitchen.assignAll(value);

  final _wantedCuisines = ''.obs;
  String get wantedCuisines => _wantedCuisines.value;
  set wantedCuisines(String value) => _wantedCuisines.value = value;

  final _wantedDiets = ''.obs;
  String get wantedDiets => _wantedDiets.value;
  set wantedDiets(String value) => _wantedDiets.value = value;

  final _nonWantedIntolerances = ''.obs;
  String get nonWantedIntolerances => _nonWantedIntolerances.value;
  set nonWantedIntolerances(String value) => _nonWantedIntolerances.value = value;

  final _wantedIngredients = ''.obs;
  String get wantedIngredients => _wantedIngredients.value;
  set wantedIngredients(String value) => _wantedIngredients.value = value;

  final _nonWantedIngredients = ''.obs;
  String get nonWantedIngredients => _nonWantedIngredients.value;
  set nonWantedIngredients(String value) => _nonWantedIngredients.value = value;

  final _wantedMealTypes = ''.obs;
  String get wantedMealTypes => _wantedMealTypes.value;
  set wantedMealTypes(String value) => _wantedMealTypes.value = value;

  final _wantedMinutes = 25.obs;
  int get wantedMinutes => _wantedMinutes.value;
  set wantedMinutes(int value) => _wantedMinutes.value = value;

  final _wantedMinutesChosen = false.obs;
  bool get wantedMinutesChosen => _wantedMinutesChosen.value;
  set wantedMinutesChosen(bool value) => _wantedMinutesChosen.value = value;

  final _longpressActive = false.obs;
  bool get longpressActive => _longpressActive.value;
  set longpressActive(bool value) => _longpressActive.value = value;

  final _showMoreSummary = false.obs;
  bool get showMoreSummary => _showMoreSummary.value;
  set showMoreSummary(bool value) => _showMoreSummary.value = value;

  ///
  /// VARIABLES
  ///

  final audioPlayer = AudioPlayer();
  final ingredientsInKitchenController = TextEditingController();
  final unwantedIngredientsInKitchenController = TextEditingController();

  ///
  /// INIT
  ///

  Future<void> init() async {
    await audioPlayer.setAsset('assets/boom.wav');
    getFavoriteRecipes();
    randomCuisineName = randomCuisine;
    randomMealTypeName = randomMealType;
    await getRandomRecipes(4);
    await getCuisineRecipes(4, randomCuisineName);
    await getMealTypeRecipes(4, randomMealTypeName);
  }

  ///
  /// DISPOSE
  ///

  @override
  void onClose() {
    ingredientsInKitchenController.dispose();
    unwantedIngredientsInKitchenController.dispose();
    audioPlayer.dispose();

    super.onClose();
  }

  ///
  /// METHODS
  ///

  Future<void> getRandomRecipes(int number) async {
    final fetchedRandomRecipes = await network.getRandomRecipes(number: number);
    randomRecipes = fetchedRandomRecipes ?? [];
  }

  Future<void> getCuisineRecipes(int number, String tag) async {
    final fetchedCuisineRecipes = await network.getRandomRecipes(number: number, tag: tag);
    cuisineRecipes = fetchedCuisineRecipes ?? [];
  }

  Future<void> getMealTypeRecipes(int number, String tag) async {
    final fetchedMealTypeRecipes = await network.getRandomRecipes(number: number, tag: tag);
    mealTypeRecipes = fetchedMealTypeRecipes ?? [];
  }

  Future<void> searchRecipes(String query) async {
    recipeSearchResult = null;
    final fetchedRecipeSearchResult = await network.searchRecipes(query);
    recipeSearchResult = fetchedRecipeSearchResult;
  }

  Future<void> complexRecipeSearch() async {
    recipeSearchResult = null;
    final fetchedRecipeSearchResult = await network.complexRecipeSearch(
      cuisine: wantedCuisines,
      diet: wantedDiets,
      intolerances: nonWantedIntolerances,
      includeIngredients: wantedIngredients,
      excludeIngredients: nonWantedIngredients,
      type: wantedMealTypes,
      minutes: wantedMinutesChosen ? wantedMinutes : null,
    );
    recipeSearchResult = fetchedRecipeSearchResult;
  }

  Future<void> getRecipeInformation(int id) async {
    showMoreSummary = false;
    recipeInformation = null;
    final fetchedRecipeInformation = await network.getRecipeInformation(id);
    recipeInformation = fetchedRecipeInformation;
    getRecipeIsFavorited(id);
  }

  String cleanDescription(int index) {
    final htmlDescription = recipeSearchResult?.results[index].summary;
    final regExp = RegExp(
      '<[^>]*>',
      multiLine: true,
    );
    final cleanDescription = htmlDescription?.replaceAll(regExp, '');

    return cleanDescription ?? '';
  }

  String cleanSummary(String summary) {
    final regExp = RegExp(
      '<[^>]*>',
      multiLine: true,
    );
    final cleanSummary = summary.replaceAll(regExp, '');

    return cleanSummary;
  }

  String? getIngredientImage(String? ingredientImage) {
    if (ingredientImage?.isNotEmpty ?? false) {
      const baseUrl = 'https://spoonacular.com/cdn/ingredients_100x100/';
      final fullUrl = '$baseUrl$ingredientImage';

      return fullUrl;
    }
    return null;
  }

  String getIngredientPrice(double price) {
    final properPrice = price / 100;
    final priceString = properPrice.toStringAsFixed(2);

    return '\$$priceString';
  }

  Color clockColor(int index) {
    final minutes = recipeSearchResult?.results[index].readyInMinutes;

    if (minutes != null) {
      if (minutes > 0 && minutes <= 40) {
        return LightColors.greenColor;
      }
      if (minutes > 40 && minutes <= 70) {
        return LightColors.orangeColor;
      }
      if (minutes > 70) {
        return LightColors.redColor;
      }
    }

    return LightColors.blueColor;
  }

  void incrementMinutes() {
    wantedMinutesChosen = true;
    wantedMinutes++;
  }

  void decrementMinutes() {
    wantedMinutesChosen = true;
    if (wantedMinutes > 1) {
      wantedMinutes--;
    }
  }

  Future<void> minusLongPressStart() async {
    longpressActive = true;
    do {
      decrementMinutes();
      await Future<Duration>.delayed(
        const Duration(milliseconds: 150),
      );
    } while (longpressActive);
  }

  Future<void> plusLongPressStart() async {
    longpressActive = true;
    do {
      incrementMinutes();
      await Future<Duration>.delayed(
        const Duration(milliseconds: 150),
      );
    } while (longpressActive);
  }

  void disableLongPress() => longpressActive = false;

  void enableShowMoreSummary() => showMoreSummary = true;

  Future<void> changeThemePlaySound() async {
    await theme.toggleTheme();
    await audioPlayer.seek(Duration.zero);
    await audioPlayer.play();
  }

  ///
  /// SHARED PREFERENCES
  ///

  Future<void> toggleFavoriteRecipe(Recipe chosenRecipe) async {
    recipeIsFavorited ? await removeFavoriteRecipe('${chosenRecipe.id}') : await setFavoriteRecipe(chosenRecipe);
    recipeIsFavorited = !recipeIsFavorited;
    getFavoriteRecipes();
  }

  void getRecipeIsFavorited(int recipeId) => recipeIsFavorited = getFavoriteRecipe('$recipeId') != null;

  Future<void> setFavoriteRecipe(Recipe favoritedRecipe) async {
    final favoritedRecipeList = [
      '${favoritedRecipe.id}',
      favoritedRecipe.title,
      favoritedRecipe.image ?? '',
      '${favoritedRecipe.readyInMinutes}',
    ];

    await sharedPreferences.setStringList('${favoritedRecipe.id}', favoritedRecipeList);
  }

  List<String>? getFavoriteRecipe(String key) => sharedPreferences.getStringList(key);

  Future<bool> removeFavoriteRecipe(String key) async => sharedPreferences.remove(key);

  /// Get all favorited recipes
  void getFavoriteRecipes() {
    favoriteRecipes.clear();
    sharedPreferences.getKeys().forEach(
      (key) {
        if (key != 'darkTheme') {
          final favoriteRecipe = getFavoriteRecipe(key);

          if (favoriteRecipe?.isNotEmpty ?? false) {
            favoriteRecipes.add(favoriteRecipe!);
          }
        }
      },
    );
  }

  ///
  /// URL LAUNCHER
  ///

  void openUrlExternalBrowser({required String? url}) {
    if (url != null) {
      /// Use `url_launcher` if on web and not Android / iOS
      if (kIsWeb || (defaultTargetPlatform != TargetPlatform.android && defaultTargetPlatform != TargetPlatform.iOS)) {
        final uri = Uri.tryParse(url);

        if (uri != null) {
          launchUrl(uri, mode: LaunchMode.externalApplication);
        }

        return;
      }

      /// Use external browser
      final color = theme.darkTheme ? DarkColors.randomColor : LightColors.randomColor;
      final backgroundColor = theme.darkTheme ? DarkColors.bodyColor : LightColors.bodyColor;

      FlutterWebBrowser.openWebPage(
        url: url,
        customTabsOptions: CustomTabsOptions(
          defaultColorSchemeParams: CustomTabsColorSchemeParams(
            toolbarColor: color,
            navigationBarColor: color,
            secondaryToolbarColor: color,
            navigationBarDividerColor: color,
          ),
          showTitle: true,
          urlBarHidingEnabled: true,
        ),
        safariVCOptions: SafariViewControllerOptions(
          barCollapsingEnabled: true,
          preferredBarTintColor: color,
          preferredControlTintColor: backgroundColor,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
          modalPresentationCapturesStatusBarAppearance: true,
        ),
      );
    }
  }
}
