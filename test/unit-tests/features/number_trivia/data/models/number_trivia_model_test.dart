import 'dart:convert';

import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const NumberTrivia tNumberTriviaModel =
      NumberTrivia(number: 1, text: 'Test Text');
  test('should be a subclass of NumberTrivia entity', () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an integer',
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia.json')) as Map<String, dynamic>;

      // final NumberTrivia result = NumberTrivia(
      //   number: jsonMap['number'] as int,
      //   text: jsonMap['text'] as String,
      // );

      final NumberTrivia result = NumberTrivia.fromJson(jsonMap);

      expect(result, tNumberTriviaModel);
    });

    test('should return a valid model when the JSON number is a double',
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json')) as Map<String, dynamic>;

      // final NumberTrivia result = NumberTrivia(
      //   number: jsonMap['number'] as int,
      //   text: jsonMap['text'] as String,
      // );

      final NumberTrivia result = NumberTrivia.fromJson(jsonMap);

      expect(result, tNumberTriviaModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      final String result = tNumberTriviaModel.toJson();

      expect(result, fixture('trivia.json'));
    });
  });
}
