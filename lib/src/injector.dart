import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/utils/constants.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/domain.dart';
import 'package:movie_app_clean_architecture_mvvm/src/presentation/presentation.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //  Dio Client
  injector
      .registerSingleton<Dio>(Dio()..options.connectTimeout = kRequestTimeout!);
  //  Movie API
  injector.registerSingleton<MovieApiService>(MovieApiService(injector()));

  //  Repositories
  injector.registerSingleton<MovieRepository>(MovieRepositoryImpl(injector()));

  //  Usecases
  injector.registerSingleton<GetPopularMoviesUseCase>(
      GetPopularMoviesUseCase(injector()));
  injector.registerSingleton<GetUpcomingMovieUseCase>(
      GetUpcomingMovieUseCase(injector()));

  //  View Models
  injector.registerFactory<HomeViewModel>(
      () => HomeViewModel(injector(), injector()));
}
