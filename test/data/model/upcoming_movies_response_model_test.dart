import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app_clean_architecture_mvvm/src/data/data.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  UpcomingMoviesResponseModel? model;
  setUp(() {
    model = UpcomingMoviesResponseModel.fromJson(
        json.decode(fixture('upcoming_movie.json')));
  });
  group("FromJson", () {
    test("should return a valid JSON output", () {
      //  Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('upcoming_movie.json'));
      //  Act
      final result = UpcomingMoviesResponseModel.fromJson(jsonMap);
      //  Assert
      expect(result, equals(model));
    });
  });

  group("toJson", () {
    test("should create JSON text", () {
      //  Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('upcoming_movie.json'));
      var expectedMap = json.decode(fixture("upcoming_movie.json"));
      final js = UpcomingMoviesResponseModel.fromJson(jsonMap);

      //  Act
      final result = js.toJson();
      //  Assert
      expect(result, expectedMap);
    });
  });
}
