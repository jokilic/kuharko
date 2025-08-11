import 'package:flutter/foundation.dart';

class Recipe {
  final bool vegan;
  final bool veryHealthy;
  final bool cheap;
  final bool veryPopular;
  final double pricePerServing;
  final List<ExtendedIngredients> extendedIngredients;
  final int id;
  final String title;
  final int readyInMinutes;
  final double spoonacularScore;
  final String sourceUrl;
  final String? image;
  final String summary;
  final List<dynamic> dishTypes;
  final String? instructions;
  final List<dynamic> analyzedInstructions;

  Recipe({
    required this.vegan,
    required this.veryHealthy,
    required this.cheap,
    required this.veryPopular,
    required this.pricePerServing,
    required this.extendedIngredients,
    required this.id,
    required this.title,
    required this.readyInMinutes,
    required this.spoonacularScore,
    required this.sourceUrl,
    required this.image,
    required this.summary,
    required this.dishTypes,
    required this.instructions,
    required this.analyzedInstructions,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) => Recipe(
    vegan: map['vegan'] as bool,
    veryHealthy: map['veryHealthy'] as bool,
    cheap: map['cheap'] as bool,
    veryPopular: map['veryPopular'] as bool,
    pricePerServing: map['pricePerServing'] as double,
    extendedIngredients: List<ExtendedIngredients>.from(
      (map['extendedIngredients'] as List<dynamic>).map<ExtendedIngredients>(
        (x) => ExtendedIngredients.fromMap(x as Map<String, dynamic>),
      ),
    ),
    id: map['id'] as int,
    title: map['title'] as String,
    readyInMinutes: map['readyInMinutes'] as int,
    spoonacularScore: map['spoonacularScore'] as double,
    sourceUrl: map['sourceUrl'] as String,
    image: map['image'] != null ? map['image'] as String : null,
    summary: map['summary'] as String,
    dishTypes: List<dynamic>.from(map['dishTypes'] as List<dynamic>),
    instructions: map['instructions'] != null ? map['instructions'] as String : null,
    analyzedInstructions: List<dynamic>.from(map['analyzedInstructions'] as List<dynamic>),
  );

  @override
  String toString() =>
      'Recipe(vegan: $vegan, veryHealthy: $veryHealthy, cheap: $cheap, veryPopular: $veryPopular, pricePerServing: $pricePerServing, extendedIngredients: $extendedIngredients, id: $id, title: $title, readyInMinutes: $readyInMinutes, spoonacularScore: $spoonacularScore, sourceUrl: $sourceUrl, image: $image, summary: $summary, dishTypes: $dishTypes, instructions: $instructions, analyzedInstructions: $analyzedInstructions)';

  @override
  bool operator ==(covariant Recipe other) {
    if (identical(this, other)) {
      return true;
    }

    return other.vegan == vegan &&
        other.veryHealthy == veryHealthy &&
        other.cheap == cheap &&
        other.veryPopular == veryPopular &&
        other.pricePerServing == pricePerServing &&
        listEquals(other.extendedIngredients, extendedIngredients) &&
        other.id == id &&
        other.title == title &&
        other.readyInMinutes == readyInMinutes &&
        other.spoonacularScore == spoonacularScore &&
        other.sourceUrl == sourceUrl &&
        other.image == image &&
        other.summary == summary &&
        listEquals(other.dishTypes, dishTypes) &&
        other.instructions == instructions &&
        listEquals(other.analyzedInstructions, analyzedInstructions);
  }

  @override
  int get hashCode =>
      vegan.hashCode ^
      veryHealthy.hashCode ^
      cheap.hashCode ^
      veryPopular.hashCode ^
      pricePerServing.hashCode ^
      extendedIngredients.hashCode ^
      id.hashCode ^
      title.hashCode ^
      readyInMinutes.hashCode ^
      spoonacularScore.hashCode ^
      sourceUrl.hashCode ^
      image.hashCode ^
      summary.hashCode ^
      dishTypes.hashCode ^
      instructions.hashCode ^
      analyzedInstructions.hashCode;
}

class ExtendedIngredients {
  final String? image;
  final String name;
  final double amount;
  final String unit;

  ExtendedIngredients({
    required this.image,
    required this.name,
    required this.amount,
    required this.unit,
  });

  factory ExtendedIngredients.fromMap(Map<String, dynamic> map) => ExtendedIngredients(
    image: map['image'] != null ? map['image'] as String : null,
    name: map['name'] as String,
    amount: map['amount'] as double,
    unit: map['unit'] as String,
  );

  @override
  String toString() => 'ExtendedIngredients(image: $image, name: $name, amount: $amount, unit: $unit)';

  @override
  bool operator ==(covariant ExtendedIngredients other) {
    if (identical(this, other)) {
      return true;
    }

    return other.image == image && other.name == name && other.amount == amount && other.unit == unit;
  }

  @override
  int get hashCode => image.hashCode ^ name.hashCode ^ amount.hashCode ^ unit.hashCode;
}
