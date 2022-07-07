import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/core.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/error/exceptions.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/error/failure.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/movie_client.dart';
import 'package:retrofit/dio.dart';
import '../../../fixtures/fixture_reader.dart';
import 'movie_api_service_test.mocks.dart';
import 'package:dio/dio.dart' as client;

@GenerateMocks([MovieClient])
void main() {
  MovieApiService? sut;
  MockMovieClient? mockClient;
  final _model = PopularMovieResponseModel.fromJson(
      json.decode(fixture("popular_movie.json")));
  final _upcomingModel = UpcomingMoviesResponseModel.fromJson(
      json.decode(fixture("upcoming_movie.json")));
  MoviesPopularRequestParams? params;
  MovieUpcomingRequestParams? upComingParams;

  setUp(() {
    mockClient = MockMovieClient();
    sut = MovieApiService(mockClient!);
    params = MoviesPopularRequestParams();
    upComingParams = MovieUpcomingRequestParams();
  });
  group("movie api service", () {
    group("popular movie api service", () {
      test("should make HTTP request from popular movie api service", () async {
        //  Arrange
        when(mockClient!.fetchPopularMovies(
          apiKey: params!.apiKey,
          sortBy: params!.sortBy,
          page: params!.page,
          language: params!.language,
        )).thenAnswer((_) async {
          return HttpResponse<PopularMovieResponseModel>(
              _model,
              client.Response<String>(
                  data: fixture('popular_movie.json'),
                  statusCode: 200,
                  requestOptions: client.RequestOptions(
                      data: fixture('popular_movie.json'), path: "")));
        });

        //  Act
        final result = await sut!.getPopularMoviesFromApiService(params);
        //  Assert
        expect(result, _model);
      });

      test("should get 404 error when make HTTP request", () {
        //  Arrange
        when(mockClient!.fetchPopularMovies(
          apiKey: params!.apiKey,
          sortBy: params!.sortBy,
          page: params!.page,
          language: params!.language,
        )).thenAnswer((_) async {
          return HttpResponse<PopularMovieResponseModel>(
              _model,
              client.Response<String>(
                  data: "somthing goes wrong",
                  statusCode: 404,
                  requestOptions: client.RequestOptions(
                      data: 'somthing goes wrong', path: "")));
        });
        //  Act
        final result = sut!.getPopularMoviesFromApiService;

        //  Assert
        expect(() => result(params),
            throwsA(const TypeMatcher<ServerException>()));
      });

      test("should get timeout error when make HTTP request", () async {
        //  Arrange
        when(mockClient!.fetchPopularMovies(
          apiKey: params!.apiKey,
          sortBy: params!.sortBy,
          page: params!.page,
          language: params!.language,
        )).thenThrow(client.DioErrorType.connectTimeout);

        //  Act
        final result = sut!.getPopularMoviesFromApiService;
        //  Assert
        expect(
            () => result(params),
            throwsA(predicate((e) =>
                e is ServerException &&
                e.message == "DioErrorType.connectTimeout")));
      });
    });

    //----------------------------

    group("upcoming movie api service", () {
      test("should make HTTP request from upcoming movie api service",
          () async {
        //  Arrange
        when(mockClient!.fetchUpcomingMovies(
          apiKey: params!.apiKey,
          page: params!.page,
          language: params!.language,
        )).thenAnswer((_) async {
          return HttpResponse<UpcomingMoviesResponseModel>(
              _upcomingModel,
              client.Response<String>(
                  data: fixture('upcoming_movie.json'),
                  statusCode: 200,
                  requestOptions: client.RequestOptions(
                      data: fixture('upcoming_movie.json'), path: "")));
        });

        //  Act
        final result =
            await sut!.getUpcomingMoviesFromApiService(upComingParams);
        //  Assert
        expect(result, _upcomingModel);
      });

      test("should get 404 error when make HTTP request", () {
        //  Arrange
        when(mockClient!.fetchUpcomingMovies(
          apiKey: params!.apiKey,
          page: params!.page,
          language: params!.language,
        )).thenAnswer((_) async {
          return HttpResponse<UpcomingMoviesResponseModel>(
              _upcomingModel,
              client.Response<String>(
                  data: "somthing goes wrong",
                  statusCode: 404,
                  requestOptions: client.RequestOptions(
                      data: 'somthing goes wrong', path: "")));
        });
        //  Act
        final result = sut!.getUpcomingMoviesFromApiService;

        //  Assert
        expect(() => result(upComingParams),
            throwsA(const TypeMatcher<ServerException>()));
      });

      test("should get timeout error when make HTTP request", () async {
        //  Arrange
        when(mockClient!.fetchUpcomingMovies(
          apiKey: params!.apiKey,
          page: params!.page,
          language: params!.language,
        )).thenThrow(client.DioErrorType.connectTimeout);

        //  Act
        final result = sut!.getUpcomingMoviesFromApiService;
        //  Assert
        expect(
            () => result(upComingParams),
            throwsA(predicate((e) =>
                e is ServerException &&
                e.message == "DioErrorType.connectTimeout")));
      });
    });
  });
}
