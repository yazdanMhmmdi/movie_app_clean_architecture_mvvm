import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart';
import 'package:movie_app_clean_architecture_mvvm/src/domain/entities/entities.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  MovieModel? model;
  setUp(() {
    model = MovieModel.fromJson(json.decode(fixture('movie.json')));
  });
  test("should be a subclass of Movie entity", () {
    //  Arrange

    //  Act

    //  Assert
    expect(model, isA<Movie>());
  });

  group("FromJson", () {
    test("should return a valid JSON output", () {
      //  Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('movie.json'));
      //  Act
      final result = MovieModel.fromJson(jsonMap);
      //  Assert
      expect(result, equals(model));
    });
  });

  group("toJson", () {
    test("should create JSON text", () {
      //  Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('movie.json'));
      final expectedMap = json.decode(fixture("movie.json"));
      final js = MovieModel.fromJson(jsonMap);

      //  Act
      final result = js.toJson();
      //  Assert
      expect(result, expectedMap);
    });
  });
}
