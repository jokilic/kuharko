import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../enums/cuisine.dart';
import '../enums/meal_type.dart';
import '../models/models.dart';
import '../services/network.dart';

class SpoonacularController extends GetxController {
  final Network _network = Network();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  SharedPreferences _sharedPreferences;
  final AudioPlayer _audioPlayer = AudioPlayer();
  final RxString _searchQuery = ''.obs;
  final RxList<Recipe> _randomRecipes = <Recipe>[].obs;
  final RxList<Recipe> _cuisineRecipes = <Recipe>[].obs;
  final RxList<Recipe> _mealTypeRecipes = <Recipe>[].obs;
  final Rx<RecipeSearchResult> _recipeSearchResult = RecipeSearchResult().obs;
  final Rx<Recipe> _recipeInformation = Recipe().obs;
  final RxBool _recipeIsFavorited = false.obs;
  final RxList<List<String>> _favoriteRecipes = <List<String>>[].obs;
  final RxString _randomCuisineName = ''.obs;
  final RxString _randomMealTypeName = ''.obs;
  RxList<String> _wantedCuisinesList = <String>[].obs;
  RxList<String> _wantedDietsList = <String>[].obs;
  RxList<String> _intolerancesList = <String>[].obs;
  RxList<String> _wantedMealTypesList = <String>[].obs;
  RxList<String> _ingredientsInKitchen = <String>[].obs;
  RxList<String> _unwantedIngredientsInKitchen = <String>[].obs;
  final TextEditingController _ingredientsInKitchenController = TextEditingController();
  final TextEditingController _unwantedIngredientsInKitchenController = TextEditingController();
  final RxString _wantedCuisines = ''.obs;
  final RxString _wantedDiets = ''.obs;
  final RxString _nonWantedIntolerances = ''.obs;
  final RxString _wantedIngredients = ''.obs;
  final RxString _nonWantedIngredients = ''.obs;
  final RxString _wantedMealTypes = ''.obs;
  final RxInt _wantedMinutes = 25.obs;
  final RxBool _wantedMinutesChosen = false.obs;
  final RxBool _longpressActive = false.obs;
  final RxBool _showMoreSummary = false.obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  SharedPreferences get sharedPreferences => _sharedPreferences;
  AudioPlayer get audioPlayer => _audioPlayer;
  String get searchQuery => _searchQuery.value;
  List<Recipe> get randomRecipes => _randomRecipes;
  List<Recipe> get cuisineRecipes => _cuisineRecipes;
  List<Recipe> get mealTypeRecipes => _mealTypeRecipes;
  RecipeSearchResult get recipeSearchResult => _recipeSearchResult.value;
  Recipe get recipeInformation => _recipeInformation.value;
  bool get recipeIsFavorited => _recipeIsFavorited.value;
  List<List<String>> get favoriteRecipes => _favoriteRecipes;
  String get randomCuisineName => _randomCuisineName.value;
  String get randomMealTypeName => _randomMealTypeName.value;
  List<String> get wantedCuisinesList => _wantedCuisinesList;
  List<String> get wantedDietsList => _wantedDietsList;
  List<String> get intolerancesList => _intolerancesList;
  List<String> get wantedMealTypesList => _wantedMealTypesList;
  List<String> get ingredientsInKitchen => _ingredientsInKitchen;
  List<String> get unwantedIngredientsInKitchen => _unwantedIngredientsInKitchen;
  TextEditingController get ingredientsInKitchenController => _ingredientsInKitchenController;
  TextEditingController get unwantedIngredientsInKitchenController => _unwantedIngredientsInKitchenController;
  String get wantedCuisines => _wantedCuisines.value;
  String get wantedDiets => _wantedDiets.value;
  String get nonWantedIntolerances => _nonWantedIntolerances.value;
  String get wantedIngredients => _wantedIngredients.value;
  String get nonWantedIngredients => _nonWantedIngredients.value;
  String get wantedMealTypes => _wantedMealTypes.value;
  int get wantedMinutes => _wantedMinutes.value;
  bool get wantedMinutesChosen => _wantedMinutesChosen.value;
  bool get longpressActive => _longpressActive.value;
  bool get showMoreSummary => _showMoreSummary.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set searchQuery(String value) => _searchQuery.value = value;
  set randomRecipes(List<Recipe> value) => _randomRecipes.assignAll(value);
  set cuisineRecipes(List<Recipe> value) => _cuisineRecipes.assignAll(value);
  set mealTypeRecipes(List<Recipe> value) => _mealTypeRecipes.assignAll(value);
  set recipeSearchResult(RecipeSearchResult value) => _recipeSearchResult.value = value;
  set recipeInformation(Recipe value) => _recipeInformation.value = value;
  set recipeIsFavorited(bool value) => _recipeIsFavorited.value = value;
  set favoriteRecipes(List<List<String>> value) => _favoriteRecipes.assignAll(value);
  set randomCuisineName(String value) => _randomCuisineName.value = value;
  set randomMealTypeName(String value) => _randomMealTypeName.value = value;
  set wantedCuisinesList(List<String> value) => _wantedCuisinesList = value;
  set wantedDietsList(List<String> value) => _wantedDietsList = value;
  set intolerancesList(List<String> value) => _intolerancesList = value;
  set wantedMealTypesList(List<String> value) => _wantedMealTypesList = value;
  set ingredientsInKitchen(List<String> value) => _ingredientsInKitchen = value;
  set unwantedIngredientsInKitchen(List<String> value) => _unwantedIngredientsInKitchen = value;
  set wantedCuisines(String value) => _wantedCuisines.value = value;
  set wantedDiets(String value) => _wantedDiets.value = value;
  set nonWantedIntolerances(String value) => _nonWantedIntolerances.value = value;
  set wantedIngredients(String value) => _wantedIngredients.value = value;
  set nonWantedIngredients(String value) => _nonWantedIngredients.value = value;
  set wantedMealTypes(String value) => _wantedMealTypes.value = value;
  set wantedMinutes(int value) => _wantedMinutes.value = value;
  set wantedMinutesChosen(bool value) => _wantedMinutesChosen.value = value;
  set longpressActive(bool value) => _longpressActive.value = value;
  set showMoreSummary(bool value) => _showMoreSummary.value = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();

    _sharedPreferences = await SharedPreferences.getInstance();
    await audioPlayer.setSource(AssetSource('boom.wav'));
    getFavoriteRecipes();
    randomCuisineName = randomCuisine;
    randomMealTypeName = randomMealType;
    await getRandomRecipes(6);
    await getCuisineRecipes(6, randomCuisineName);
    await getMealTypeRecipes(6, randomMealTypeName);
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  Future<void> getRandomRecipes(int number) async {
    final List<Recipe> _fetchedRandomRecipes = await _network.getRandomRecipes(number: number);
    randomRecipes = _fetchedRandomRecipes;
  }

  Future<void> getCuisineRecipes(int number, String tag) async {
    final List<Recipe> _fetchedCuisineRecipes = await _network.getRandomRecipes(number: number, tag: tag);
    cuisineRecipes = _fetchedCuisineRecipes;
  }

  Future<void> getMealTypeRecipes(int number, String tag) async {
    final List<Recipe> _fetchedMealTypeRecipes = await _network.getRandomRecipes(number: number, tag: tag);
    mealTypeRecipes = _fetchedMealTypeRecipes;
  }

  Future<void> searchRecipes(String query) async {
    recipeSearchResult = null;
    final RecipeSearchResult _fetchedRecipeSearchResult = await _network.searchRecipes(query);
    recipeSearchResult = _fetchedRecipeSearchResult;
  }

  Future<void> complexRecipeSearch() async {
    recipeSearchResult = null;
    final RecipeSearchResult _fetchedRecipeSearchResult = await _network.complexRecipeSearch(
      cuisine: wantedCuisines,
      diet: wantedDiets,
      intolerances: nonWantedIntolerances,
      includeIngredients: wantedIngredients,
      excludeIngredients: nonWantedIngredients,
      type: wantedMealTypes,
      minutes: wantedMinutesChosen ? wantedMinutes : null,
    );
    recipeSearchResult = _fetchedRecipeSearchResult;
  }

  Future<void> getRecipeInformation(int id) async {
    showMoreSummary = false;
    recipeInformation = null;
    final Recipe _fetchedRecipeInformation = await _network.getRecipeInformation(id);
    recipeInformation = _fetchedRecipeInformation;
    getRecipeIsFavorited(id);
  }

  String cleanDescription(int index) {
    final String htmlDescription = recipeSearchResult.results[index].summary;
    final RegExp regExp = RegExp(
      '<[^>]*>',
      multiLine: true,
    );
    final String cleanDescription = htmlDescription.replaceAll(regExp, '');

    return cleanDescription;
  }

  String cleanSummary(String summary) {
    final RegExp regExp = RegExp(
      '<[^>]*>',
      multiLine: true,
    );
    final String cleanSummary = summary.replaceAll(regExp, '');

    return cleanSummary;
  }

  String getIngredientImage(String ingredientImage) {
    const String baseUrl = 'https://spoonacular.com/cdn/ingredients_100x100/';
    final String fullUrl = '$baseUrl$ingredientImage';

    return fullUrl;
  }

  String getIngredientPrice(double price) {
    final double properPrice = price / 100;
    final String priceString = properPrice.toStringAsFixed(2);

    return '\$$priceString';
  }

  Color clockColor(int index) {
    final int minutes = recipeSearchResult.results[index].readyInMinutes;
    if (minutes > 0 && minutes <= 40) {
      return LightColors.greenColor;
    }
    if (minutes > 40 && minutes <= 70) {
      return LightColors.orangeColor;
    }
    if (minutes > 70) {
      return LightColors.redColor;
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

  Future<void> minusLongPressStart(_) async {
    longpressActive = true;
    do {
      decrementMinutes();
      await Future<Duration>.delayed(
        const Duration(milliseconds: 150),
      );
    } while (longpressActive);
  }

  Future<void> plusLongPressStart(_) async {
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

  /// ------------------------
  /// SHARED PREFERENCES
  /// ------------------------

  Future<void> toggleFavoriteRecipe(Recipe chosenRecipe) async {
    recipeIsFavorited ? await removeFavoriteRecipe('${chosenRecipe.id}') : await setFavoriteRecipe(chosenRecipe);
    recipeIsFavorited = !recipeIsFavorited;
    getFavoriteRecipes();
  }

  void getRecipeIsFavorited(int recipeId) => recipeIsFavorited = getFavoriteRecipe('$recipeId') != null;

  Future<void> setFavoriteRecipe(Recipe favoritedRecipe) async {
    final List<String> favoritedRecipeList = <String>[
      '${favoritedRecipe.id}',
      favoritedRecipe.title,
      favoritedRecipe.image,
      '${favoritedRecipe.readyInMinutes}',
    ];

    return _sharedPreferences.setStringList('${favoritedRecipe.id}', favoritedRecipeList);
  }

  List<String> getFavoriteRecipe(String key) => _sharedPreferences.getStringList(key);

  Future<bool> removeFavoriteRecipe(String key) async => _sharedPreferences.remove(key);

  /// Get all favorited recipes
  void getFavoriteRecipes() {
    favoriteRecipes.clear();
    _sharedPreferences.getKeys().forEach(
          (String key) => key != 'darkTheme' ? favoriteRecipes.add(getFavoriteRecipe(key)) : null,
        );
  }

  /// ------------------------
  /// URL LAUNCHER
  /// ------------------------

  void launchURL(String url) => launchUrl(Uri.parse(url));
}
