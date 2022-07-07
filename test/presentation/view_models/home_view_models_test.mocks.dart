// Mocks generated by Mockito 5.2.0 from annotations
// in movie_app_clean_architecture_mvvm/test/presentation/view_models/home_view_models_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app_clean_architecture_mvvm/src/core/core.dart' as _i7;
import 'package:movie_app_clean_architecture_mvvm/src/core/error/failure.dart'
    as _i5;
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart' as _i6;
import 'package:movie_app_clean_architecture_mvvm/src/domain/domain.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i3.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.UpcomingMoviesResponseModel>>
      getUpcomingMovies(_i7.MovieUpcomingRequestParams? params) => (super
          .noSuchMethod(Invocation.method(#getUpcomingMovies, [params]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i6.UpcomingMoviesResponseModel>>.value(
                      _FakeEither_0<_i5.Failure,
                          _i6.UpcomingMoviesResponseModel>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i6.UpcomingMoviesResponseModel>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.PopularMovieResponseModel>>
      getPopularMovies(_i7.MoviesPopularRequestParams? params) =>
          (super.noSuchMethod(Invocation.method(#getPopularMovies, [params]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i6.PopularMovieResponseModel>>.value(
                      _FakeEither_0<_i5.Failure,
                          _i6.PopularMovieResponseModel>())) as _i4
              .Future<_i2.Either<_i5.Failure, _i6.PopularMovieResponseModel>>);
}

/// A class which mocks [GetPopularMoviesUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularMoviesUseCase extends _i1.Mock
    implements _i3.GetPopularMoviesUseCase {
  MockGetPopularMoviesUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.PopularMovieResponseModel>> call(
          _i7.MoviesPopularRequestParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue: Future<
                  _i2.Either<_i5.Failure, _i6.PopularMovieResponseModel>>.value(
              _FakeEither_0<_i5.Failure, _i6.PopularMovieResponseModel>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i6.PopularMovieResponseModel>>);
}

/// A class which mocks [GetUpcomingMovieUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUpcomingMovieUseCase extends _i1.Mock
    implements _i3.GetUpcomingMovieUseCase {
  MockGetUpcomingMovieUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.UpcomingMoviesResponseModel>> call(
          _i7.MovieUpcomingRequestParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue:
              Future<_i2.Either<_i5.Failure, _i6.UpcomingMoviesResponseModel>>.value(
                  _FakeEither_0<_i5.Failure,
                      _i6.UpcomingMoviesResponseModel>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i6.UpcomingMoviesResponseModel>>);
}
