import 'package:flutter/cupertino.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/params/movie_popular_request.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/params/movie_upcoming_request.dart';
import 'package:movie_app_clean_architecture_mvvm/src/core/resources/data_state.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/models/popular_movie_response_model.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/models/upcoming_movies_response_model.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/usecases/get_upcomming_movies_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._upcomingMovieUseCase, this._popularMoviesUseCase) {
    getUpcommingMovies();
    getPopularMovies();
  }

  GetUpcomingMovieUseCase _upcomingMovieUseCase;
  GetPopularMoviesUseCase _popularMoviesUseCase;

  bool? _upcommingLoading = true;
  bool? _popularLoading = true;

  bool? _error = false;

  List<Movie>? _upcommingMovies = [];
  List<Movie>? _popularMovies = [];

  int s = 0;

  //  Events
  void getUpcommingMovies() async {
    DataState<UpcomingMoviesResponseModel> dataState =
        await _upcomingMovieUseCase(
            params: MovieUpcomingRequestParams(language: 'en-US'));
    if (dataState is DataSuccess && dataState.data!.results!.isNotEmpty) {
      List<Movie>? movies = dataState.data!.results!;
      _upcommingMovies!.addAll(movies);
      upcomingLoading = false;
    } else {
      error = true;
    }
  }

  void getPopularMovies() async {
    DataState<PopularMovieResponseModel> dataState =
        await _popularMoviesUseCase(
            params: MoviesPopularRequestParams(language: 'en-US'));
    if (dataState is DataSuccess && dataState.data!.results!.isNotEmpty) {
      List<Movie>? movies = dataState.data!.results!;
      _popularMovies!.addAll(movies);
      popularLoading = false;
    } else {
      error = true;
    }
  }

  //  Getters and Setters
  set upcomingLoading(bool _loading) {
    _upcommingLoading = _loading;
    notifyListeners();
  }

  bool get upcomingLoading => _upcommingLoading!;

  set popularLoading(bool e) {
    _popularLoading = e;
    notifyListeners();
  }

  bool get popularLoading => _popularLoading!;

  set error(bool e) {
    _error = e;
    notifyListeners();
  }

  bool get error => _error!;

  List<Movie>? get upcomingMovies => _upcommingMovies;
  List<Movie>? get popularMovies => _popularMovies;
}
