import 'package:movie_app_clean_architecture_mvvm/src/core/core.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/domain.dart';

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
