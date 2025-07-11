import 'package:flutter/foundation.dart';

class RecipeSearchResult {
  final List<RecipeSearchResults> results;
  final int totalResults;

  RecipeSearchResult({
    required this.results,
    required this.totalResults,
  });

  factory RecipeSearchResult.fromMap(Map<String, dynamic> map) => RecipeSearchResult(
    results: List<RecipeSearchResults>.from(
      (map['results'] as List<dynamic>).map<RecipeSearchResults>(
        (x) => RecipeSearchResults.fromMap(x as Map<String, dynamic>),
      ),
    ),
    totalResults: map['totalResults'] as int,
  );

  @override
  String toString() => 'RecipeSearchResult(results: $results, totalResults: $totalResults)';

  @override
  bool operator ==(covariant RecipeSearchResult other) {
    if (identical(this, other)) {
      return true;
    }

    return listEquals(other.results, results) && other.totalResults == totalResults;
  }

  @override
  int get hashCode => results.hashCode ^ totalResults.hashCode;
}

class RecipeSearchResults {
  final bool vegan;
  final bool veryHealthy;
  final bool cheap;
  final bool veryPopular;
  final int id;
  final String title;
  final int readyInMinutes;
  final String? image;
  final String summary;

  RecipeSearchResults({
    required this.vegan,
    required this.veryHealthy,
    required this.cheap,
    required this.veryPopular,
    required this.id,
    required this.title,
    required this.readyInMinutes,
    required this.image,
    required this.summary,
  });

  factory RecipeSearchResults.fromMap(Map<String, dynamic> map) => RecipeSearchResults(
    vegan: map['vegan'] as bool,
    veryHealthy: map['veryHealthy'] as bool,
    cheap: map['cheap'] as bool,
    veryPopular: map['veryPopular'] as bool,
    id: map['id'] as int,
    title: map['title'] as String,
    readyInMinutes: map['readyInMinutes'] as int,
    image: map['image'] != null ? map['image'] as String : null,
    summary: map['summary'] as String,
  );

  @override
  String toString() =>
      'RecipeSearchResults(vegan: $vegan, veryHealthy: $veryHealthy, cheap: $cheap, veryPopular: $veryPopular, id: $id, title: $title, readyInMinutes: $readyInMinutes, image: $image, summary: $summary)';

  @override
  bool operator ==(covariant RecipeSearchResults other) {
    if (identical(this, other)) {
      return true;
    }

    return other.vegan == vegan &&
        other.veryHealthy == veryHealthy &&
        other.cheap == cheap &&
        other.veryPopular == veryPopular &&
        other.id == id &&
        other.title == title &&
        other.readyInMinutes == readyInMinutes &&
        other.image == image &&
        other.summary == summary;
  }

  @override
  int get hashCode =>
      vegan.hashCode ^ veryHealthy.hashCode ^ cheap.hashCode ^ veryPopular.hashCode ^ id.hashCode ^ title.hashCode ^ readyInMinutes.hashCode ^ image.hashCode ^ summary.hashCode;
}
