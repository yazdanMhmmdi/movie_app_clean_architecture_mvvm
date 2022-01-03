import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/core.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart';
part 'movie_api_service.g.dart';

@RestApi(baseUrl: kBaseApiUrl)
abstract class MovieApiService {
  factory MovieApiService(Dio dio, {String baseUrl}) = _MovieApiService;

  @GET('/discover/movie')
  Future<HttpResponse<PopularMovieResponseModel>> getPopularMovies({
    @Query("api_key") required String apiKey,
    @Query("page") required String page,
    @Query("language") required String language,
    @Query("sort_by") required String sortBy,
  });

  @GET('/movie/upcoming')
  Future<HttpResponse<UpcomingMoviesResponseModel>> getUpcomingMovies({
    @Query("page") required String page,
    @Query("language") required String language,
    @Query("api_key") required String apiKey,
  });
}
