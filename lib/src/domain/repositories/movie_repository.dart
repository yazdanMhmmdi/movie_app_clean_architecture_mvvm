import 'package:movie_app_clean_architecture_mvvm/src/core/params/movie_popular_request.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/params/movie_upcoming_request.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/resources/data_state.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/models/popular_movie_response_model.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/models/upcoming_movies_response_model.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<DataState<UpcomingMoviesResponseModel>> getUpcomingMovies(
      MovieUpcomingRequestParams params);

  Future<DataState<PopularMovieResponseModel>> getPopularMovies(
    MoviesPopularRequestParams params,
  );
}
