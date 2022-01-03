import 'package:movie_app_clean_architecture_mvvm/src/core/core.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/domain.dart';

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
