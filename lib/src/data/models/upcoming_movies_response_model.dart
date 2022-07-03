import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../data.dart';

part 'upcoming_movies_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UpcomingMoviesResponseModel extends Equatable {
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

  @override
  List<Object?> get props => [
        totalPages,
        results,
        page,
        dates,
        totalResults,
      ];
}
