import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'core/utils/constants.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'domain/entities/movie_client.dart';
import 'presentation/presentation.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //  Dio Client
  injector
      .registerSingleton<Dio>(Dio()..options.connectTimeout = kRequestTimeout!);
  //  Movie Client
  injector.registerSingleton(MovieClient(injector()));
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
