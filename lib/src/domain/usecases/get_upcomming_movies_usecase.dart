import 'package:movie_app_clean_architecture_mvvm/src/core/params/movie_upcomming_request.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/resources/data_state.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/usecases/usecase.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/repositories/movie_repository.dart';

class GetUpcommingMovieUseCase
    implements UseCase<DataState<List<Movie>>, MovieUpcommingRequestParams?> {
  final MovieRepository? _repository;
  GetUpcommingMovieUseCase(this._repository);
  @override
  Future<DataState<List<Movie>>> call(
      {MovieUpcommingRequestParams? params}) async {
    return _repository!.getUpcommingMovies(params!);
  }
}
