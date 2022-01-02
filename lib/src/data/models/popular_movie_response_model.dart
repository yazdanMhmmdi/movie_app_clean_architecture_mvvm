import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/models/movie_model.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/movie.dart';
part 'popular_movie_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PopularMovieResponseModel {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  PopularMovieResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  factory PopularMovieResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PopularMovieResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMovieResponseModelToJson(this);
}
