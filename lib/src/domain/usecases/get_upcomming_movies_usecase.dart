import 'package:dartz/dartz.dart';
import '../../core/core.dart';
import '../../core/error/failure.dart';
import '../../data/data.dart';
import '../domain.dart';

class GetUpcomingMovieUseCase
    implements
        UseCase<UpcomingMoviesResponseModel, MovieUpcomingRequestParams?> {
  final MovieRepository? _repository;
  GetUpcomingMovieUseCase(this._repository);

  @override
  Future<Either<Failure, UpcomingMoviesResponseModel>> call(
      MovieUpcomingRequestParams? params) async {
    return await _repository!.getUpcomingMovies(params!);
  }
}
