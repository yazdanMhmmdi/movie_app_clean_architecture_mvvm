import 'package:movie_app_clean_architecture_mvvm/src/core/params/movie_upcoming_request.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/resources/data_state.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/usecases/usecase.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/models/upcoming_movies_response_model.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/repositories/movie_repository.dart';

class GetUpcomingMovieUseCase
    implements
        UseCase<DataState<UpcomingMoviesResponseModel>,
            MovieUpcomingRequestParams?> {
  final MovieRepository? _repository;
  GetUpcomingMovieUseCase(this._repository);
  @override
  Future<DataState<UpcomingMoviesResponseModel>> call(
      {MovieUpcomingRequestParams? params}) async {
    return _repository!.getUpcomingMovies(params!);
  }
}
