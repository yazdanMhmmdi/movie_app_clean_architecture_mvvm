import 'package:movie_app_clean_architecture_mvvm/src/core/utils/constants.dart';

class MovieUpcommingRequestParams {
  final String? apiKey;
  final String? language;
  final String? page;
  MovieUpcommingRequestParams({
    this.apiKey = kApiKey,
    this.page = "1",
    this.language = kLanguage,
  });
}
