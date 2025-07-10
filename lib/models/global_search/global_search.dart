class GlobalSearch {
  String sorting;
  List<dynamic> filterOptions;
  List<dynamic> activeFilterOptions;
  String query;
  int totalResults;
  int limit;
  int offset;
  List<SearchResults> searchResults;
  int expires;

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

  GlobalSearch.fromJson(Map<String, dynamic> json) {
    sorting = json['sorting'];
    filterOptions = json['filterOptions'];
    activeFilterOptions = json['activeFilterOptions'];
    query = json['query'];
    totalResults = json['totalResults'];
    limit = json['limit'];
    offset = json['offset'];
    final List<dynamic> searchResultsList = json['searchResults'];
    searchResults = searchResultsList.map((searchResult) => SearchResults.fromJson(searchResult)).toList();
    expires = json['expires'];
  }
}

class SearchResults {
  String name;
  String type;
  int totalResults;
  List<Results> results;

  SearchResults({
    required this.name,
    required this.type,
    required this.totalResults,
    required this.results,
  });

  SearchResults.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    totalResults = json['totalResults'];
    final List<dynamic> resultsList = json['results'];
    results = resultsList.map((result) => Results.fromJson(result)).toList();
  }
}

class Results {
  int id;
  String name;
  String image;
  String link;
  String type;
  dynamic relevance;
  String content;
  List<dynamic> dataPoints;

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

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    link = json['link'];
    type = json['type'];
    relevance = json['relevance'];
    content = json['content'];
    dataPoints = json['dataPoints'];
  }
}
