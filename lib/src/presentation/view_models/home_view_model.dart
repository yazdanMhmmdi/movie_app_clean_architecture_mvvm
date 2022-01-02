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
    getMovies();
  }

  GetUpcomingMovieUseCase _upcomingMovieUseCase;
  GetPopularMoviesUseCase _popularMoviesUseCase;

  bool? _loading = true;

  bool? _error = false;

  List<Movie>? _upcommingMovies = [];
  List<Movie>? _popularMovies = [];

  int s = 0;

  //  Events
  void getMovies() async {
    DataState<UpcomingMoviesResponseModel> dataState =
        await _upcomingMovieUseCase(
            params: MovieUpcomingRequestParams(language: 'fa-IR'));

    DataState<PopularMovieResponseModel> dataState2 =
        await _popularMoviesUseCase(
            params: MoviesPopularRequestParams(language: 'fa-IR'));

    if (dataState is DataSuccess &&
        dataState2 is DataSuccess &&
        dataState.data!.results!.isNotEmpty &&
        dataState2.data!.results!.isNotEmpty) {
      _upcommingMovies!.addAll(dataState.data!.results!);
      _popularMovies!.addAll(dataState2.data!.results!);
      loading = false;
    } else {
      error = true;
      loading = false;
    }
  }

  //  Getters and Setters
  set loading(bool _) {
    _loading = _;
    notifyListeners();
  }

  bool get loading => _loading!;

  set error(bool _) {
    _error = _;
  }

  bool get error => _error!;

  List<Movie>? get upcomingMovies => _upcommingMovies;
  List<Movie>? get popularMovies => _popularMovies;
}
