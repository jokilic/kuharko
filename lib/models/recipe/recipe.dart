import 'package:flutter/foundation.dart';

// TODO: Check every field and remove unused ones

class Recipe {
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
  final int aggregateLikes;
  final double spoonacularScore;
  final double healthScore;
  final String creditsText;
  final String? license;
  final String sourceName;
  final double pricePerServing;
  final List<ExtendedIngredients> extendedIngredients;
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
  final WinePairing winePairing;
  final String instructions;
  final List<dynamic> analyzedInstructions;
  final int? originalId;
  final String spoonacularSourceUrl;

  Recipe({
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
    required this.aggregateLikes,
    required this.spoonacularScore,
    required this.healthScore,
    required this.creditsText,
    required this.license,
    required this.sourceName,
    required this.pricePerServing,
    required this.extendedIngredients,
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
    required this.winePairing,
    required this.instructions,
    required this.analyzedInstructions,
    required this.originalId,
    required this.spoonacularSourceUrl,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) => Recipe(
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
    aggregateLikes: map['aggregateLikes'] as int,
    spoonacularScore: map['spoonacularScore'] as double,
    healthScore: map['healthScore'] as double,
    creditsText: map['creditsText'] as String,
    license: map['license'] != null ? map['license'] as String : null,
    sourceName: map['sourceName'] as String,
    pricePerServing: map['pricePerServing'] as double,
    extendedIngredients: List<ExtendedIngredients>.from(
      (map['extendedIngredients'] as List<dynamic>).map<ExtendedIngredients>(
        (x) => ExtendedIngredients.fromMap(x as Map<String, dynamic>),
      ),
    ),
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
    winePairing: WinePairing.fromMap(map['winePairing'] as Map<String, dynamic>),
    instructions: map['instructions'] as String,
    analyzedInstructions: List<dynamic>.from(map['analyzedInstructions'] as List<dynamic>),
    originalId: map['originalId'] != null ? map['originalId'] as int : null,
    spoonacularSourceUrl: map['spoonacularSourceUrl'] as String,
  );

  @override
  String toString() =>
      'Recipe(vegetarian: $vegetarian, vegan: $vegan, glutenFree: $glutenFree, dairyFree: $dairyFree, veryHealthy: $veryHealthy, cheap: $cheap, veryPopular: $veryPopular, sustainable: $sustainable, weightWatcherSmartPoints: $weightWatcherSmartPoints, gaps: $gaps, lowFodmap: $lowFodmap, aggregateLikes: $aggregateLikes, spoonacularScore: $spoonacularScore, healthScore: $healthScore, creditsText: $creditsText, license: $license, sourceName: $sourceName, pricePerServing: $pricePerServing, extendedIngredients: $extendedIngredients, id: $id, title: $title, readyInMinutes: $readyInMinutes, servings: $servings, sourceUrl: $sourceUrl, image: $image, imageType: $imageType, summary: $summary, cuisines: $cuisines, dishTypes: $dishTypes, diets: $diets, occasions: $occasions, winePairing: $winePairing, instructions: $instructions, analyzedInstructions: $analyzedInstructions, originalId: $originalId, spoonacularSourceUrl: $spoonacularSourceUrl)';

  @override
  bool operator ==(covariant Recipe other) {
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
        other.aggregateLikes == aggregateLikes &&
        other.spoonacularScore == spoonacularScore &&
        other.healthScore == healthScore &&
        other.creditsText == creditsText &&
        other.license == license &&
        other.sourceName == sourceName &&
        other.pricePerServing == pricePerServing &&
        listEquals(other.extendedIngredients, extendedIngredients) &&
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
        other.winePairing == winePairing &&
        other.instructions == instructions &&
        listEquals(other.analyzedInstructions, analyzedInstructions) &&
        other.originalId == originalId &&
        other.spoonacularSourceUrl == spoonacularSourceUrl;
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
      aggregateLikes.hashCode ^
      spoonacularScore.hashCode ^
      healthScore.hashCode ^
      creditsText.hashCode ^
      license.hashCode ^
      sourceName.hashCode ^
      pricePerServing.hashCode ^
      extendedIngredients.hashCode ^
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
      winePairing.hashCode ^
      instructions.hashCode ^
      analyzedInstructions.hashCode ^
      originalId.hashCode ^
      spoonacularSourceUrl.hashCode;
}

class ExtendedIngredients {
  int id;
  String aisle;
  String image;
  String consistency;
  String name;
  String original;
  String originalString;
  String originalName;
  double amount;
  String unit;
  List<dynamic> meta;
  List<dynamic> metaInformation;
  Measures measures;

  ExtendedIngredients({
    required this.id,
    required this.aisle,
    required this.image,
    required this.consistency,
    required this.name,
    required this.original,
    required this.originalString,
    required this.originalName,
    required this.amount,
    required this.unit,
    required this.meta,
    required this.metaInformation,
    required this.measures,
  });

  factory ExtendedIngredients.fromMap(Map<String, dynamic> map) => ExtendedIngredients(
    id: map['id'] as int,
    aisle: map['aisle'] as String,
    image: map['image'] as String,
    consistency: map['consistency'] as String,
    name: map['name'] as String,
    original: map['original'] as String,
    originalString: map['originalString'] as String,
    originalName: map['originalName'] as String,
    amount: map['amount'] as double,
    unit: map['unit'] as String,
    meta: List<dynamic>.from(map['meta'] as List<dynamic>),
    metaInformation: List<dynamic>.from(map['metaInformation'] as List<dynamic>),
    measures: Measures.fromMap(map['measures'] as Map<String, dynamic>),
  );

  @override
  String toString() =>
      'ExtendedIngredients(id: $id, aisle: $aisle, image: $image, consistency: $consistency, name: $name, original: $original, originalString: $originalString, originalName: $originalName, amount: $amount, unit: $unit, meta: $meta, metaInformation: $metaInformation, measures: $measures)';

  @override
  bool operator ==(covariant ExtendedIngredients other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id &&
        other.aisle == aisle &&
        other.image == image &&
        other.consistency == consistency &&
        other.name == name &&
        other.original == original &&
        other.originalString == originalString &&
        other.originalName == originalName &&
        other.amount == amount &&
        other.unit == unit &&
        listEquals(other.meta, meta) &&
        listEquals(other.metaInformation, metaInformation) &&
        other.measures == measures;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      aisle.hashCode ^
      image.hashCode ^
      consistency.hashCode ^
      name.hashCode ^
      original.hashCode ^
      originalString.hashCode ^
      originalName.hashCode ^
      amount.hashCode ^
      unit.hashCode ^
      meta.hashCode ^
      metaInformation.hashCode ^
      measures.hashCode;
}

class Measures {
  Us us;
  Us metric;

  Measures({
    required this.us,
    required this.metric,
  });

  factory Measures.fromMap(Map<String, dynamic> map) => Measures(
    us: Us.fromMap(map['us'] as Map<String, dynamic>),
    metric: Us.fromMap(map['metric'] as Map<String, dynamic>),
  );

  @override
  String toString() => 'Measures(us: $us, metric: $metric)';

  @override
  bool operator ==(covariant Measures other) {
    if (identical(this, other)) {
      return true;
    }

    return other.us == us && other.metric == metric;
  }

  @override
  int get hashCode => us.hashCode ^ metric.hashCode;
}

class Us {
  double amount;
  String unitShort;
  String unitLong;

  Us({
    required this.amount,
    required this.unitShort,
    required this.unitLong,
  });

  factory Us.fromMap(Map<String, dynamic> map) => Us(
    amount: map['amount'] as double,
    unitShort: map['unitShort'] as String,
    unitLong: map['unitLong'] as String,
  );

  @override
  String toString() => 'Us(amount: $amount, unitShort: $unitShort, unitLong: $unitLong)';

  @override
  bool operator ==(covariant Us other) {
    if (identical(this, other)) {
      return true;
    }

    return other.amount == amount && other.unitShort == unitShort && other.unitLong == unitLong;
  }

  @override
  int get hashCode => amount.hashCode ^ unitShort.hashCode ^ unitLong.hashCode;
}

class Metric {
  double amount;
  String unitShort;
  String unitLong;

  Metric({
    required this.amount,
    required this.unitShort,
    required this.unitLong,
  });

  factory Metric.fromMap(Map<String, dynamic> map) => Metric(
    amount: map['amount'] as double,
    unitShort: map['unitShort'] as String,
    unitLong: map['unitLong'] as String,
  );

  @override
  String toString() => 'Metric(amount: $amount, unitShort: $unitShort, unitLong: $unitLong)';

  @override
  bool operator ==(covariant Metric other) {
    if (identical(this, other)) {
      return true;
    }

    return other.amount == amount && other.unitShort == unitShort && other.unitLong == unitLong;
  }

  @override
  int get hashCode => amount.hashCode ^ unitShort.hashCode ^ unitLong.hashCode;
}

class WinePairing {
  List<dynamic> pairedWines;
  String pairingText;
  List<dynamic> productMatches;

  WinePairing({
    required this.pairedWines,
    required this.pairingText,
    required this.productMatches,
  });

  factory WinePairing.fromMap(Map<String, dynamic> map) => WinePairing(
    pairedWines: List<dynamic>.from(map['pairedWines'] as List<dynamic>),
    pairingText: map['pairingText'] as String,
    productMatches: List<dynamic>.from(map['productMatches'] as List<dynamic>),
  );

  @override
  String toString() => 'WinePairing(pairedWines: $pairedWines, pairingText: $pairingText, productMatches: $productMatches)';

  @override
  bool operator ==(covariant WinePairing other) {
    if (identical(this, other)) {
      return true;
    }

    return listEquals(other.pairedWines, pairedWines) && other.pairingText == pairingText && listEquals(other.productMatches, productMatches);
  }

  @override
  int get hashCode => pairedWines.hashCode ^ pairingText.hashCode ^ productMatches.hashCode;
}
