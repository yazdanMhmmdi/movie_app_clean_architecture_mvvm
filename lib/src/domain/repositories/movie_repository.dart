import 'package:movie_app_clean_architecture_mvvm/src/core/params/movie_popular_request.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/params/movie_upcomming_request.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/resources/data_state.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/movie.dart';

abstract class MovieRepository {
  DataState<List<Movie>> getUpcommingMovies(MovieUpcommingRequestParams params);

  DataState<List<Movie>> getPopularMovies(
    MoviesPopularRequestParams params,
  );
}
