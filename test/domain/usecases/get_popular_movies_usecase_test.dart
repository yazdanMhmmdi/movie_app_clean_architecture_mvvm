import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/core.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/domain.dart';
import 'get_popular_movies_usecase_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  MockMovieRepository? mockMovieRepository;
  GetPopularMoviesUseCase? usecase;
  final PopularMovieResponseModel model = PopularMovieResponseModel();
  final params = MoviesPopularRequestParams();
  final _model = PopularMovieResponseModel(
      page: 1,
      results: [
        MovieModel(title: "test"),
      ],
      totalPages: 1,
      totalResults: 1);

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetPopularMoviesUseCase(mockMovieRepository);
  });

  group("get popular movies usecase", () {
    test("should get object from repository", () async {
      //  Arrange
      when(mockMovieRepository!.getPopularMovies(any))
          .thenAnswer((_) async => Right(_model));
      //  Act
      final result = await usecase!(params);

      //  Assert
      expect(result, equals(Right(_model)));
    });
  });
}
