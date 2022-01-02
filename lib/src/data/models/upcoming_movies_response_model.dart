import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/models/movie_model.dart';
part 'upcoming_movies_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UpcomingMoviesResponseModel {
  Map<String, String>? dates;
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;
  UpcomingMoviesResponseModel({
    this.totalPages,
    this.results,
    this.page,
    this.dates,
    this.totalResults,
  });

  factory UpcomingMoviesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UpcomingMoviesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingMoviesResponseModelToJson(this);
}
