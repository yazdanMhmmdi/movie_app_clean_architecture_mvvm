import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/core.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/error/failure.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/domain.dart';
import '../../fixtures/fixture_reader.dart';
import 'get_popular_movies_usecase_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  MockMovieRepository? mockMovieRepository;
  GetPopularMoviesUseCase? usecase;
  GetUpcomingMovieUseCase? upcomingMovieUseCase;
  MoviesPopularRequestParams? params;
  MovieUpcomingRequestParams? upcomingRequestParams;
  final _model = PopularMovieResponseModel(
      page: 1,
      results: [
        MovieModel(title: "test"),
      ],
      totalPages: 1,
      totalResults: 1);
  final _upcomingModel = UpcomingMoviesResponseModel.fromJson(
      json.decode(fixture('upcoming_movie.json')));

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetPopularMoviesUseCase(mockMovieRepository);
    upcomingMovieUseCase = GetUpcomingMovieUseCase(mockMovieRepository);
    params = MoviesPopularRequestParams();
    upcomingRequestParams = MovieUpcomingRequestParams();
  });

  group("movie usecases", () {
    group("popular movie usecase", () {
      test("should get PopularMovieResponseModel from repository", () async {
        //  Arrange
        when(mockMovieRepository!.getPopularMovies(any))
            .thenAnswer((_) async => Right(_model));
        //  Act
        final result = await usecase!(params);

        //  Assert
        expect(result, equals(Right(_model)));
      });

      test("should throw ServerFailure with Http status error [422] message",
          () async {
        //  Arrange
        when(mockMovieRepository!.getPopularMovies(any)).thenAnswer((_) async =>
            Left(ServerFailure(message: "Http status error [422]")));
        //  Act
        final result = await usecase!(params);

        //  Assert
        expect(result, Left(ServerFailure(message: "Http status error [422]")));
      });

      test("should throw ServerFailure", () async {
        //  Arrange
        when(mockMovieRepository!.getPopularMovies(any))
            .thenAnswer((_) async => Left(ServerFailure(message: "")));
        //  Act
        final result = await usecase!(params);

        //  Assert
        expect(result, Left(ServerFailure(message: "")));
      });
    });

    group("upcoming movie usecase", () {
      test("should get UpcomingMovieResponseModel from repository", () async {
        //  Arrange
        when(mockMovieRepository!.getUpcomingMovies(any))
            .thenAnswer((_) async => Right(_upcomingModel));
        //  Act
        final result = await upcomingMovieUseCase!(upcomingRequestParams);

        //  Assert
        expect(result, equals(Right(_upcomingModel)));
      });

      test("should throw ServerFailure", () async {
        //  Arrange
        when(mockMovieRepository!.getUpcomingMovies(any))
            .thenAnswer((_) async => Left(ServerFailure(message: "")));
        //  Act
        final result = await upcomingMovieUseCase!(upcomingRequestParams);

        //  Assert
        expect(result, Left(ServerFailure(message: "")));
      });
    });
  });
}



      // test("test", () async {
      //   MovieRepository repository =
      //       MovieRepositoryImpl(MovieApiService(MovieClient(client.Dio())));
      //   params = MoviesPopularRequestParams(page: "501");
      //   final s = await repository.getPopularMovies(params!);

      //   s.fold((left) {
      //     print(left);
      //   }, (right) {
      //     expect(right, ServerFailure(message: """
      //             {"errors":["page must be less than or equal to 500"]}
      //             """));
      //   });
      // });