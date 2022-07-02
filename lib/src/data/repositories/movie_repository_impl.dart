import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';
import '../../domain/domain.dart';
import '../data.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieApiService);
  final MovieApiService _movieApiService;

  @override
  Future<Either<Failure, PopularMovieResponseModel>> getPopularMovies(
      MoviesPopularRequestParams params) async {
    try {
      final response =
          await _movieApiService.getPopularMoviesFromApiService(params);

      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UpcomingMoviesResponseModel>> getUpcomingMovies(
      MovieUpcomingRequestParams params) async {
    try {
      final response =
          await _movieApiService.getUpcomingMoviesFromApiService(params);

      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
