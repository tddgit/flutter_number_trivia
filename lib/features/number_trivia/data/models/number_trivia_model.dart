import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({required this.newText, required this.newNumber})
      : super(text: newText, number: newNumber);

  final String newText;
  final int newNumber;
}
