import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/core.dart';
import '../../data/data.dart';

part 'movie_client.g.dart';

@RestApi(baseUrl: kBaseApiUrl)
abstract class MovieClient {
  factory MovieClient(Dio dio, {String baseUrl}) = _MovieClient;

  @GET('/discover/movie')
  Future<HttpResponse<PopularMovieResponseModel>> fetchPopularMovies({
    @Query("api_key") required String apiKey,
    @Query("page") required String page,
    @Query("language") required String language,
    @Query("sort_by") required String sortBy,
  });

  @GET('/movie/upcoming')
  Future<HttpResponse<UpcomingMoviesResponseModel>> fetchUpcomingMovies({
    @Query("page") required String page,
    @Query("language") required String language,
    @Query("api_key") required String apiKey,
  });
}
