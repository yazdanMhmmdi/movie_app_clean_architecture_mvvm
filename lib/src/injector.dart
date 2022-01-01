import 'package:get_it/get_it.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/datasources/remote/movie_api_service.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/repositories/movie_repository.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/usecases/get_upcomming_movies_usecase.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //  Dio Client
  injector.registerSingleton<Dio>(Dio());
  //  Movie API
  injector.registerSingleton<MovieApiService>(MovieApiService(injector()));
  //  Usecases
  injector.registerSingleton<GetPopularMoviesUseCase>(
      GetPopularMoviesUseCase(injector()));
  injector.registerSingleton<GetUpcomingMovieUseCase>(
      GetUpcomingMovieUseCase(injector()));

  //  Repositories
  injector.registerSingleton<MovieRepository>(MovieRepositoryImpl(injector()));
}
