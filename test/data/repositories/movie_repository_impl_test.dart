import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/core.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/error/exceptions.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/error/failure.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/domain.dart';
import 'movie_repository_impl_test.mocks.dart';
import 'package:dio/dio.dart' as client;

@GenerateMocks([MovieApiService])
void main() {
  MovieRepository? sut;
  MockMovieApiService? mockMovieApiService;
  MoviesPopularRequestParams? popularParams;
  MovieUpcomingRequestParams? upcomingParams;

  PopularMovieResponseModel model = PopularMovieResponseModel(
      page: 1, results: [MovieModel(title: "test"), MovieModel(title: "test")]);

  UpcomingMoviesResponseModel? upcomingModel = UpcomingMoviesResponseModel(
      page: 1, results: [MovieModel(title: "test"), MovieModel(title: "test")]);

  setUp(() {
    mockMovieApiService = MockMovieApiService();
    popularParams = MoviesPopularRequestParams();
    upcomingParams = MovieUpcomingRequestParams();
    sut = MovieRepositoryImpl(mockMovieApiService!);
  });
  group("movie repository", () {
    group("get popular repository from server", () {
      test("should success and get PopularMovieResponseModel from api service",
          () async {
        //  Arrange
        when(mockMovieApiService!.getPopularMoviesFromApiService(popularParams))
            .thenAnswer((v) async {
          return model;
        });
        //  Act
        final result = await sut!.getPopularMovies(popularParams!);
        //  Assert
        verify(sut!.getPopularMovies(popularParams!));
        expect(result, equals(Right(model)));
      });

      test("should throw ServerException and return ServerFailure", () async {
        //  Arrange
        when(mockMovieApiService!.getPopularMoviesFromApiService(any))
            .thenThrow(ServerException(message: ""));

        //  Act
        final result = await sut!.getPopularMovies(popularParams!);
        //  Assert
        expect(result, Left(ServerFailure()));
      });

      test(
          "should throw ServerException with 404 error and return ServerFailure",
          () async {
        //  Arrange
        when(mockMovieApiService!.getPopularMoviesFromApiService(any))
            .thenThrow(ServerException(message: "404 error"));

        //  Act
        final result = await sut!.getPopularMovies(popularParams!);
        //  Assert
        expect(result, Left(ServerFailure(message: "404 error")));
      });
    });

    group("get upcoming repository from server", () {
      test("should success and get UpcomingMovieResponseModel from api service",
          () async {
        //  Arrange
        when(mockMovieApiService!
                .getUpcomingMoviesFromApiService(upcomingParams))
            .thenAnswer((v) async {
          return upcomingModel;
        });
        //  Act
        final result = await sut!.getUpcomingMovies(upcomingParams!);
        //  Assert
        verify(sut!.getUpcomingMovies(upcomingParams!));
        expect(result, equals(Right(upcomingModel)));
      });

      test("should throw ServerException and return ServerFailure", () async {
        //  Arrange
        when(mockMovieApiService!.getUpcomingMoviesFromApiService(any))
            .thenThrow(ServerException(message: ""));

        //  Act
        final result = await sut!.getUpcomingMovies(upcomingParams!);
        //  Assert
        expect(result, Left(ServerFailure()));
      });

      test(
          "should throw ServerException with 404 error and return ServerFailure",
          () async {
        //  Arrange
        when(mockMovieApiService!.getUpcomingMoviesFromApiService(any))
            .thenThrow(ServerException(message: "404 error"));

        //  Act
        final result = await sut!.getUpcomingMovies(upcomingParams!);
        //  Assert
        expect(result, Left(ServerFailure(message: "404 error")));
      });
    });
  });
}
