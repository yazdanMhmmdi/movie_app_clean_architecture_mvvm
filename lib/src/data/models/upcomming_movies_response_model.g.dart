// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcomming_movies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingMoviesResponseModel _$UpcomingMoviesResponseModelFromJson(
        Map<String, dynamic> json) =>
    UpcomingMoviesResponseModel(
      totalPages: json['total_pages'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as String?,
      dates: (json['dates'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$UpcomingMoviesResponseModelToJson(
        UpcomingMoviesResponseModel instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
