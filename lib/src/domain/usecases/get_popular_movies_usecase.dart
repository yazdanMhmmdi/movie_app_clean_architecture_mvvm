import 'package:movie_app_clean_architecture_mvvm/src/core/params/movie_popular_request.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/resources/data_state.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/usecases/usecase.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/repositories/movie_repository.dart';

class GetPopularMoviesUseCase
    implements UseCase<DataState<List<Movie>>, MoviesPopularRequestParams?> {
  GetPopularMoviesUseCase(this._repository);
  final MovieRepository? _repository;

  @override
  Future<DataState<List<Movie>>> call({MoviesPopularRequestParams? params}) {
    throw _repository!.getPopularMovies(params!);
  }
}
