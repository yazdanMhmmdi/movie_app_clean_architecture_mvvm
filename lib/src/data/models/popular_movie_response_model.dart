import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../data.dart';

part 'popular_movie_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PopularMovieResponseModel extends Equatable {
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

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}
