import '../../data/models/models.dart';
import '../core.dart';

abstract class RemoteApiService {
  Future<PopularMovieResponseModel> getPopularMoviesFromApiService(
      MoviesPopularRequestParams? params);

  Future<UpcomingMoviesResponseModel> getUpcomingMoviesFromApiService(
      MovieUpcomingRequestParams? params);
}
