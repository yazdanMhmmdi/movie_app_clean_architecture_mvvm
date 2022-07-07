import 'package:retrofit/retrofit.dart';

import '../../../core/core.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/network/remote_api_service.dart';
import '../../../domain/entities/movie_client.dart';
import '../../data.dart';

class MovieApiService extends RemoteApiService {
  MovieClient movieClient;

  MovieApiService(this.movieClient);

  @override
  Future<PopularMovieResponseModel> getPopularMoviesFromApiService(
      MoviesPopularRequestParams? params) async {
    try {
      final HttpResponse response = await movieClient.fetchPopularMovies(
          apiKey: params!.apiKey!,
          page: params.page!,
          language: params.language!,
          sortBy: params.sortBy!);

      if (response.response.statusCode == 200) {
        return response.data;
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException(message: error.toString());
    }
  }

  @override
  Future<UpcomingMoviesResponseModel> getUpcomingMoviesFromApiService(
      MovieUpcomingRequestParams? params) async {
    try {
      final HttpResponse response = await movieClient.fetchUpcomingMovies(
        apiKey: params!.apiKey!,
        page: params.page!,
        language: params.language!,
      );

      if (response.response.statusCode == 200) {
        return response.data;
      } else {
        throw ServerException();
      }
    } catch (error) {
      throw ServerException(message: error.toString());
    }
  }
}
