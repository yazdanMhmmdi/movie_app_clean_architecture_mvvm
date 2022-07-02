import 'package:dartz/dartz.dart';
import '../../core/core.dart';
import '../../core/error/failure.dart';
import '../../data/data.dart';
import '../domain.dart';

class GetPopularMoviesUseCase
    implements UseCase<PopularMovieResponseModel, MoviesPopularRequestParams?> {
  GetPopularMoviesUseCase(this._repository);
  final MovieRepository? _repository;

  @override
  Future<Either<Failure, PopularMovieResponseModel>> call(
      MoviesPopularRequestParams? params) async {
    return await _repository!.getPopularMovies(params!);
  }
}
