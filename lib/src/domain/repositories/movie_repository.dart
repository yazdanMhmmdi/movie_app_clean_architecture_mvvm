import 'package:movie_app_clean_architecture_mvvm/src/core/core.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart';

abstract class MovieRepository {
  Future<DataState<UpcomingMoviesResponseModel>> getUpcomingMovies(
      MovieUpcomingRequestParams params);

  Future<DataState<PopularMovieResponseModel>> getPopularMovies(
    MoviesPopularRequestParams params,
  );
}
