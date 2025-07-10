import 'package:flutter/foundation.dart';

class GlobalSearch {
  final String sorting;
  final List<dynamic> filterOptions;
  final List<dynamic> activeFilterOptions;
  final String query;
  final int totalResults;
  final int limit;
  final int offset;
  final List<SearchResults> searchResults;
  final int expires;

  GlobalSearch({
    required this.sorting,
    required this.filterOptions,
    required this.activeFilterOptions,
    required this.query,
    required this.totalResults,
    required this.limit,
    required this.offset,
    required this.searchResults,
    required this.expires,
  });

  factory GlobalSearch.fromMap(Map<String, dynamic> map) => GlobalSearch(
    sorting: map['sorting'] as String,
    filterOptions: List<dynamic>.from(map['filterOptions'] as List<dynamic>),
    activeFilterOptions: List<dynamic>.from(map['activeFilterOptions'] as List<dynamic>),
    query: map['query'] as String,
    totalResults: map['totalResults'] as int,
    limit: map['limit'] as int,
    offset: map['offset'] as int,
    searchResults: List<SearchResults>.from(
      (map['searchResults'] as List<int>).map<SearchResults>(
        (x) => SearchResults.fromMap(x as Map<String, dynamic>),
      ),
    ),
    expires: map['expires'] as int,
  );

  @override
  String toString() =>
      'GlobalSearch(sorting: $sorting, filterOptions: $filterOptions, activeFilterOptions: $activeFilterOptions, query: $query, totalResults: $totalResults, limit: $limit, offset: $offset, searchResults: $searchResults, expires: $expires)';

  @override
  bool operator ==(covariant GlobalSearch other) {
    if (identical(this, other)) {
      return true;
    }

    return other.sorting == sorting &&
        listEquals(other.filterOptions, filterOptions) &&
        listEquals(other.activeFilterOptions, activeFilterOptions) &&
        other.query == query &&
        other.totalResults == totalResults &&
        other.limit == limit &&
        other.offset == offset &&
        listEquals(other.searchResults, searchResults) &&
        other.expires == expires;
  }

  @override
  int get hashCode =>
      sorting.hashCode ^
      filterOptions.hashCode ^
      activeFilterOptions.hashCode ^
      query.hashCode ^
      totalResults.hashCode ^
      limit.hashCode ^
      offset.hashCode ^
      searchResults.hashCode ^
      expires.hashCode;
}

class SearchResults {
  final String name;
  final String type;
  final int totalResults;
  final List<Results> results;

  SearchResults({
    required this.name,
    required this.type,
    required this.totalResults,
    required this.results,
  });

  factory SearchResults.fromMap(Map<String, dynamic> map) => SearchResults(
    name: map['name'] as String,
    type: map['type'] as String,
    totalResults: map['totalResults'] as int,
    results: List<Results>.from(
      (map['results'] as List<int>).map<Results>(
        (x) => Results.fromMap(x as Map<String, dynamic>),
      ),
    ),
  );

  @override
  String toString() => 'SearchResults(name: $name, type: $type, totalResults: $totalResults, results: $results)';

  @override
  bool operator ==(covariant SearchResults other) {
    if (identical(this, other)) {
      return true;
    }

    return other.name == name && other.type == type && other.totalResults == totalResults && listEquals(other.results, results);
  }

  @override
  int get hashCode => name.hashCode ^ type.hashCode ^ totalResults.hashCode ^ results.hashCode;
}

class Results {
  final int id;
  final String name;
  final String image;
  final String link;
  final String type;
  final dynamic relevance;
  final String content;
  final List<dynamic> dataPoints;

  Results({
    required this.id,
    required this.name,
    required this.image,
    required this.link,
    required this.type,
    required this.relevance,
    required this.content,
    required this.dataPoints,
  });

  factory Results.fromMap(Map<String, dynamic> map) => Results(
    id: map['id'] as int,
    name: map['name'] as String,
    image: map['image'] as String,
    link: map['link'] as String,
    type: map['type'] as String,
    relevance: map['relevance'] as dynamic,
    content: map['content'] as String,
    dataPoints: List<dynamic>.from(map['dataPoints'] as List<dynamic>),
  );

  @override
  String toString() => 'Results(id: $id, name: $name, image: $image, link: $link, type: $type, relevance: $relevance, content: $content, dataPoints: $dataPoints)';

  @override
  bool operator ==(covariant Results other) {
    if (identical(this, other)) {
      return true;
    }

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.link == link &&
        other.type == type &&
        other.relevance == relevance &&
        other.content == content &&
        listEquals(other.dataPoints, dataPoints);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode ^ link.hashCode ^ type.hashCode ^ relevance.hashCode ^ content.hashCode ^ dataPoints.hashCode;
}
