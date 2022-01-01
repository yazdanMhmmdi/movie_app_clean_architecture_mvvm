import 'dart:io';

import 'package:movie_app_clean_architecture_mvvm/src/data/datasources/remote/movie_api_service.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/models/popular_movie_response_model.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/models/upcoming_movies_response_model.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/resources/data_state.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/params/movie_upcoming_request.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/params/movie_popular_request.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/repositories/movie_repository.dart';
import 'package:retrofit/dio.dart';
import 'package:dio/dio.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieApiService);
  final MovieApiService _movieApiService;

  @override
  Future<DataState<PopularMovieResponseModel>> getPopularMovies(
      MoviesPopularRequestParams params) async {
    try {
      final httpResponse = await _movieApiService.getPopularMovies(
          apiKey: params.apiKey!,
          page: params.page!,
          language: params.language!,
          sortBy: params.sortBy!);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(DioError(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        type: DioErrorType.response,
        requestOptions: httpResponse.response.requestOptions,
      ));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UpcomingMoviesResponseModel>> getUpcomingMovies(
      MovieUpcomingRequestParams params) async {
    try {
      final httpResponse = await _movieApiService.getUpcomingMovies(
          page: params.page!,
          language: params.language!,
          apiKey: params.apiKey!);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(DioError(
        response: httpResponse.response,
        type: DioErrorType.response,
        requestOptions: httpResponse.response.requestOptions,
      ));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
