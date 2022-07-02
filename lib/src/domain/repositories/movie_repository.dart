import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../../core/error/failure.dart';
import '../../data/data.dart';

abstract class MovieRepository {
  Future<Either<Failure, UpcomingMoviesResponseModel>> getUpcomingMovies(
      MovieUpcomingRequestParams params);

  Future<Either<Failure, PopularMovieResponseModel>> getPopularMovies(
    MoviesPopularRequestParams params,
  );
}
