class RecipeSearchResult {
  List<RecipeSearchResults> results;
  int offset;
  int number;
  int totalResults;

  RecipeSearchResult({
    this.results,
    this.offset,
    this.number,
    this.totalResults,
  });

  RecipeSearchResult.fromJson(Map<String, dynamic> json) {
    final List<dynamic> resultsList = json['results'];
    results = resultsList.map((result) => RecipeSearchResults.fromJson(result)).toList();
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
  }
}

class RecipeSearchResults {
  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  bool veryPopular;
  bool sustainable;
  int weightWatcherSmartPoints;
  String gaps;
  bool lowFodmap;
  int preparationMinutes;
  int cookingMinutes;
  int aggregateLikes;
  double spoonacularScore;
  int healthScore;
  String creditsText;
  String sourceName;
  double pricePerServing;
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String sourceUrl;
  String image;
  String imageType;
  String summary;
  List<dynamic> cuisines;
  List<dynamic> dishTypes;
  List<dynamic> diets;
  List<dynamic> occasions;
  List<dynamic> analyzedInstructions;

  RecipeSearchResults({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.lowFodmap,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.spoonacularScore,
    this.healthScore,
    this.creditsText,
    this.sourceName,
    this.pricePerServing,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.analyzedInstructions,
  });

  RecipeSearchResults.fromJson(Map<String, dynamic> json) {
    vegetarian = json['vegetarian'];
    vegan = json['vegan'];
    glutenFree = json['glutenFree'];
    dairyFree = json['dairyFree'];
    veryHealthy = json['veryHealthy'];
    cheap = json['cheap'];
    veryPopular = json['veryPopular'];
    sustainable = json['sustainable'];
    weightWatcherSmartPoints = json['weightWatcherSmartPoints'];
    gaps = json['gaps'];
    lowFodmap = json['lowFodmap'];
    preparationMinutes = json['preparationMinutes'];
    cookingMinutes = json['cookingMinutes'];
    aggregateLikes = json['aggregateLikes'];
    spoonacularScore = json['spoonacularScore'];
    healthScore = json['healthScore'];
    creditsText = json['creditsText'];
    sourceName = json['sourceName'];
    pricePerServing = json['pricePerServing'];
    id = json['id'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    sourceUrl = json['sourceUrl'];
    image = json['image'];
    imageType = json['imageType'];
    summary = json['summary'];
    cuisines = json['cuisines'];
    dishTypes = json['dishTypes'];
    diets = json['diets'];
    occasions = json['occasions'];
    analyzedInstructions = json['analyzedInstructions'];
  }
}
