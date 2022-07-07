import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/core.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/error/failure.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/domain.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/presentation.dart';
import '../../fixtures/fixture_reader.dart';
import 'home_view_models_test.mocks.dart';

@GenerateMocks(
  [MovieRepository, GetPopularMoviesUseCase, GetUpcomingMovieUseCase],
)
void main() {
  HomeViewModel? sut;
  MoviesPopularRequestParams? _popularParams;
  MovieUpcomingRequestParams? _upcomingParams;
  MockGetUpcomingMovieUseCase? _mockUpcomingMovieUseCase;
  MockGetPopularMoviesUseCase? _mockPopularMoviesUseCase;
  MockMovieRepository _repository;
  PopularMovieResponseModel _popularModel =
      PopularMovieResponseModel(results: [MovieModel(title: "test")]);
  UpcomingMoviesResponseModel _upcomingModel =
      UpcomingMoviesResponseModel.fromJson(
          json.decode(fixture("upcoming_movie.json")));
  setUp(() {
    _repository = MockMovieRepository();
    _mockUpcomingMovieUseCase = MockGetUpcomingMovieUseCase();
    _mockPopularMoviesUseCase = MockGetPopularMoviesUseCase();
    _popularParams = MoviesPopularRequestParams(language: 'fa-IR');
    _upcomingParams = MovieUpcomingRequestParams(language: 'fa-IR');

    sut = HomeViewModel(_mockUpcomingMovieUseCase!, _mockPopularMoviesUseCase!);
  });
  void arrangeUsecasesSuccessfully() {
    when(_mockPopularMoviesUseCase!(_popularParams))
        .thenAnswer((_) async => Right(_popularModel));
    when(_mockUpcomingMovieUseCase!(_upcomingParams))
        .thenAnswer((_) async => Right(_upcomingModel));
  }

  void arrangeUsecasesWithFailure() {
    when(_mockPopularMoviesUseCase!(_popularParams))
        .thenAnswer((_) async => Left(ServerFailure()));
    when(_mockUpcomingMovieUseCase!(_upcomingParams))
        .thenAnswer((_) async => Left(ServerFailure()));
  }

  group("home view model", () {
    test("should initial state be empty", () {
      // //  Arrange
      // //  Act
      //  Assert
      expect(sut!.loading, equals(true));
      expect(sut!.error, equals(false));
      expect(sut!.popularMovies, isEmpty);
      expect(sut!.upcomingMovies, isEmpty);
    });

    test(
        "should emit [loading=true] then [loading=false] & get data successfully",
        () async {
      //  Arrange
      arrangeUsecasesSuccessfully();

      //  Act
      final future = sut!.getMovies(
          popularRequestParams: _popularParams,
          upcomingRequestParams: _upcomingParams);
      //  Assert
      expect(sut!.loading, equals(true));
      expect(sut!.error, equals(false));
      expect(sut!.popularMovies, isEmpty);
      expect(sut!.upcomingMovies, isEmpty);

      await future;

      expect(sut!.loading, equals(false));
      expect(sut!.error, equals(false));
      expect(sut!.popularMovies, isNotEmpty);
      expect(sut!.upcomingMovies, isNotEmpty);
      expect(sut!.popularMovies, _popularModel.results);
      expect(sut!.upcomingMovies, _upcomingModel.results);
    });

    test(
        "should emit[loading=true] then [loading=false,error=true] & get data with failure",
        () async {
      //  Arrange
      arrangeUsecasesWithFailure();
      //  Act
      final future = sut!.getMovies(
          popularRequestParams: _popularParams,
          upcomingRequestParams: _upcomingParams);

      //  Assert
      expect(sut!.loading, equals(true));
      expect(sut!.error, equals(false));
      expect(sut!.popularMovies, isEmpty);
      expect(sut!.upcomingMovies, isEmpty);

      await future;

      expect(sut!.loading, equals(false));
      expect(sut!.error, equals(true));
      expect(sut!.popularMovies, isEmpty);
      expect(sut!.upcomingMovies, isEmpty);
    });
  });
}
