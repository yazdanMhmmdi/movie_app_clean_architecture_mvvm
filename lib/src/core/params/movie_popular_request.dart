import '../core.dart';

class MoviesPopularRequestParams {
  final String? page;
  final String? apiKey;
  final String? language;
  final String? sortBy;
  MoviesPopularRequestParams({
    this.apiKey = kApiKey,
    this.language = kLanguage,
    this.page = "1",
    this.sortBy = kSortBy,
  });
}
