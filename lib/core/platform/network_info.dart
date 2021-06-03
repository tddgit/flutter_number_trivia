import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NetworkInfo {
  Future<NumberTrivia> getConcreteNumberTrivia(int number);

  Future<NumberTrivia> getRandomNumberTrivia();
}
