import 'package:movie_app_clean_architecture_mvvm/src/core/utils/constants.dart';

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
