import 'package:movie_app_clean_architecture_mvvm/src/core/params/movie_popular_request.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/resources/data_state.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/usecases/usecase.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/models/popular_movie_response_model.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/repositories/movie_repository.dart';

class GetPopularMoviesUseCase
    implements
        UseCase<DataState<PopularMovieResponseModel>,
            MoviesPopularRequestParams?> {
  GetPopularMoviesUseCase(this._repository);
  final MovieRepository? _repository;

  @override
  Future<DataState<PopularMovieResponseModel>> call(
      {MoviesPopularRequestParams? params}) {
    return _repository!.getPopularMovies(params!);
  }
}
