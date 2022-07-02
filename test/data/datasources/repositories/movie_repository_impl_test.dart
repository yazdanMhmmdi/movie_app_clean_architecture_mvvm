import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/core.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/domain.dart';
import 'movie_repository_impl_test.mocks.dart';

@GenerateMocks([MovieApiService])
void main() {
  MovieRepository? sut;
  MockMovieApiService? mockMovieApiService;
  MoviesPopularRequestParams? params;

  PopularMovieResponseModel model = PopularMovieResponseModel(
      page: 1, results: [MovieModel(title: "test"), MovieModel(title: "test")]);
  setUp(() {
    mockMovieApiService = MockMovieApiService();
    params = MoviesPopularRequestParams();
    sut = MovieRepositoryImpl(mockMovieApiService!);
  });

  group("get popular repository from server", () {
    test("should get  popular movies from server", () async {
      //  Arrange
      when(mockMovieApiService!.getPopularMoviesFromApiService(params))
          .thenAnswer((v) async {
        return model;
      });
      //  Act
      final result = await sut!.getPopularMovies(params!);
      //  Assert
      verify(sut!.getPopularMovies(params!));
      expect(result, equals(Right(model)));
    });
  });
}
