import 'package:dartz/dartz.dart';
import '../core.dart';
import '../error/failure.dart';
import '../../data/models/models.dart';

abstract class RemoteApiService {
  Future<PopularMovieResponseModel> getPopularMoviesFromApiService(
      MoviesPopularRequestParams? params);

  Future<UpcomingMoviesResponseModel> getUpcomingMoviesFromApiService(
      MovieUpcomingRequestParams? params);
}
