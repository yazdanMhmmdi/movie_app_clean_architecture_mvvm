import 'package:movie_app_clean_architecture_mvvm/src/core/utils/constants.dart';

class MovieUpcomingRequestParams {
  final String? apiKey;
  final String? language;
  final String? page;
  MovieUpcomingRequestParams({
    this.apiKey = kApiKey,
    this.page = "1",
    this.language = kLanguage,
  });
}
