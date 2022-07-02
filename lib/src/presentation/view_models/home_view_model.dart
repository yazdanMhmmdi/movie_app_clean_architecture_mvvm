import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._upcomingMovieUseCase, this._popularMoviesUseCase) {
    getMovies();
  }

  final GetUpcomingMovieUseCase _upcomingMovieUseCase;
  final GetPopularMoviesUseCase _popularMoviesUseCase;

  bool? _loading = true;
  bool? _error = false;

  List<Movie>? _upcommingMovies = [];
  List<Movie>? _popularMovies = [];

  //  Events
  void getMovies() async {
    final upcomingMoviesResult = await _upcomingMovieUseCase(
        MovieUpcomingRequestParams(language: 'fa-IR'));

    final popularMoviesResult = await _popularMoviesUseCase(
        MoviesPopularRequestParams(language: 'fa-IR'));

    upcomingMoviesResult.fold((left) {
      error = true;
      loading = false;
      _upcommingMovies!.clear();
    }, (right) {
      if (right.results!.isNotEmpty) {
        _upcommingMovies!.addAll(right.results!);
        loading = false;
      }
    });
    popularMoviesResult.fold((left) {
      error = true;
      loading = false;
      _popularMovies!.clear();
    }, (right) {
      if (right.results!.isNotEmpty) {
        _popularMovies!.addAll(right.results!);
        loading = false;
      }
    });
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
