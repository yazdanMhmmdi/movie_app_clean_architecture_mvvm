// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movie_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMovieResponseModel _$PopularMovieResponseModelFromJson(
        Map<String, dynamic> json) =>
    PopularMovieResponseModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$PopularMovieResponseModelToJson(
        PopularMovieResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
