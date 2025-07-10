import 'package:flutter/foundation.dart';

class RecipeSearchResult {
  final List<RecipeSearchResults> results;
  final int offset;
  final int number;
  final int totalResults;

  RecipeSearchResult({
    required this.results,
    required this.offset,
    required this.number,
    required this.totalResults,
  });

  factory RecipeSearchResult.fromMap(Map<String, dynamic> map) => RecipeSearchResult(
    results: List<RecipeSearchResults>.from(
      (map['results'] as List<int>).map<RecipeSearchResults>(
        (x) => RecipeSearchResults.fromMap(x as Map<String, dynamic>),
      ),
    ),
    offset: map['offset'] as int,
    number: map['number'] as int,
    totalResults: map['totalResults'] as int,
  );

  @override
  String toString() => 'RecipeSearchResult(results: $results, offset: $offset, number: $number, totalResults: $totalResults)';

  @override
  bool operator ==(covariant RecipeSearchResult other) {
    if (identical(this, other)) {
      return true;
    }

    return listEquals(other.results, results) && other.offset == offset && other.number == number && other.totalResults == totalResults;
  }

  @override
  int get hashCode => results.hashCode ^ offset.hashCode ^ number.hashCode ^ totalResults.hashCode;
}

class RecipeSearchResults {
  final bool vegetarian;
  final bool vegan;
  final bool glutenFree;
  final bool dairyFree;
  final bool veryHealthy;
  final bool cheap;
  final bool veryPopular;
  final bool sustainable;
  final int weightWatcherSmartPoints;
  final String gaps;
  final bool lowFodmap;
  final int preparationMinutes;
  final int cookingMinutes;
  final int aggregateLikes;
  final double spoonacularScore;
  final int healthScore;
  final String creditsText;
  final String sourceName;
  final double pricePerServing;
  final int id;
  final String title;
  final int readyInMinutes;
  final int servings;
  final String sourceUrl;
  final String image;
  final String imageType;
  final String summary;
  final List<dynamic> cuisines;
  final List<dynamic> dishTypes;
  final List<dynamic> diets;
  final List<dynamic> occasions;
  final List<dynamic> analyzedInstructions;

  RecipeSearchResults({
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
    required this.dairyFree,
    required this.veryHealthy,
    required this.cheap,
    required this.veryPopular,
    required this.sustainable,
    required this.weightWatcherSmartPoints,
    required this.gaps,
    required this.lowFodmap,
    required this.preparationMinutes,
    required this.cookingMinutes,
    required this.aggregateLikes,
    required this.spoonacularScore,
    required this.healthScore,
    required this.creditsText,
    required this.sourceName,
    required this.pricePerServing,
    required this.id,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.image,
    required this.imageType,
    required this.summary,
    required this.cuisines,
    required this.dishTypes,
    required this.diets,
    required this.occasions,
    required this.analyzedInstructions,
  });

  factory RecipeSearchResults.fromMap(Map<String, dynamic> map) => RecipeSearchResults(
    vegetarian: map['vegetarian'] as bool,
    vegan: map['vegan'] as bool,
    glutenFree: map['glutenFree'] as bool,
    dairyFree: map['dairyFree'] as bool,
    veryHealthy: map['veryHealthy'] as bool,
    cheap: map['cheap'] as bool,
    veryPopular: map['veryPopular'] as bool,
    sustainable: map['sustainable'] as bool,
    weightWatcherSmartPoints: map['weightWatcherSmartPoints'] as int,
    gaps: map['gaps'] as String,
    lowFodmap: map['lowFodmap'] as bool,
    preparationMinutes: map['preparationMinutes'] as int,
    cookingMinutes: map['cookingMinutes'] as int,
    aggregateLikes: map['aggregateLikes'] as int,
    spoonacularScore: map['spoonacularScore'] as double,
    healthScore: map['healthScore'] as int,
    creditsText: map['creditsText'] as String,
    sourceName: map['sourceName'] as String,
    pricePerServing: map['pricePerServing'] as double,
    id: map['id'] as int,
    title: map['title'] as String,
    readyInMinutes: map['readyInMinutes'] as int,
    servings: map['servings'] as int,
    sourceUrl: map['sourceUrl'] as String,
    image: map['image'] as String,
    imageType: map['imageType'] as String,
    summary: map['summary'] as String,
    cuisines: List<dynamic>.from(map['cuisines'] as List<dynamic>),
    dishTypes: List<dynamic>.from(map['dishTypes'] as List<dynamic>),
    diets: List<dynamic>.from(map['diets'] as List<dynamic>),
    occasions: List<dynamic>.from(map['occasions'] as List<dynamic>),
    analyzedInstructions: List<dynamic>.from(map['analyzedInstructions'] as List<dynamic>),
  );

  @override
  String toString() =>
      'RecipeSearchResults(vegetarian: $vegetarian, vegan: $vegan, glutenFree: $glutenFree, dairyFree: $dairyFree, veryHealthy: $veryHealthy, cheap: $cheap, veryPopular: $veryPopular, sustainable: $sustainable, weightWatcherSmartPoints: $weightWatcherSmartPoints, gaps: $gaps, lowFodmap: $lowFodmap, preparationMinutes: $preparationMinutes, cookingMinutes: $cookingMinutes, aggregateLikes: $aggregateLikes, spoonacularScore: $spoonacularScore, healthScore: $healthScore, creditsText: $creditsText, sourceName: $sourceName, pricePerServing: $pricePerServing, id: $id, title: $title, readyInMinutes: $readyInMinutes, servings: $servings, sourceUrl: $sourceUrl, image: $image, imageType: $imageType, summary: $summary, cuisines: $cuisines, dishTypes: $dishTypes, diets: $diets, occasions: $occasions, analyzedInstructions: $analyzedInstructions)';

  @override
  bool operator ==(covariant RecipeSearchResults other) {
    if (identical(this, other)) {
      return true;
    }

    return other.vegetarian == vegetarian &&
        other.vegan == vegan &&
        other.glutenFree == glutenFree &&
        other.dairyFree == dairyFree &&
        other.veryHealthy == veryHealthy &&
        other.cheap == cheap &&
        other.veryPopular == veryPopular &&
        other.sustainable == sustainable &&
        other.weightWatcherSmartPoints == weightWatcherSmartPoints &&
        other.gaps == gaps &&
        other.lowFodmap == lowFodmap &&
        other.preparationMinutes == preparationMinutes &&
        other.cookingMinutes == cookingMinutes &&
        other.aggregateLikes == aggregateLikes &&
        other.spoonacularScore == spoonacularScore &&
        other.healthScore == healthScore &&
        other.creditsText == creditsText &&
        other.sourceName == sourceName &&
        other.pricePerServing == pricePerServing &&
        other.id == id &&
        other.title == title &&
        other.readyInMinutes == readyInMinutes &&
        other.servings == servings &&
        other.sourceUrl == sourceUrl &&
        other.image == image &&
        other.imageType == imageType &&
        other.summary == summary &&
        listEquals(other.cuisines, cuisines) &&
        listEquals(other.dishTypes, dishTypes) &&
        listEquals(other.diets, diets) &&
        listEquals(other.occasions, occasions) &&
        listEquals(other.analyzedInstructions, analyzedInstructions);
  }

  @override
  int get hashCode =>
      vegetarian.hashCode ^
      vegan.hashCode ^
      glutenFree.hashCode ^
      dairyFree.hashCode ^
      veryHealthy.hashCode ^
      cheap.hashCode ^
      veryPopular.hashCode ^
      sustainable.hashCode ^
      weightWatcherSmartPoints.hashCode ^
      gaps.hashCode ^
      lowFodmap.hashCode ^
      preparationMinutes.hashCode ^
      cookingMinutes.hashCode ^
      aggregateLikes.hashCode ^
      spoonacularScore.hashCode ^
      healthScore.hashCode ^
      creditsText.hashCode ^
      sourceName.hashCode ^
      pricePerServing.hashCode ^
      id.hashCode ^
      title.hashCode ^
      readyInMinutes.hashCode ^
      servings.hashCode ^
      sourceUrl.hashCode ^
      image.hashCode ^
      imageType.hashCode ^
      summary.hashCode ^
      cuisines.hashCode ^
      dishTypes.hashCode ^
      diets.hashCode ^
      occasions.hashCode ^
      analyzedInstructions.hashCode;
}
