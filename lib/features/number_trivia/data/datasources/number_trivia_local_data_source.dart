import 'package:flutter_number_trivia/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  /// Get the cached [NumberTriviaModel] which was gotten the last time the
  /// user had an internet connection
  ///
  /// Throws a [CacheException] for all error codes
  Future<NumberTriviaModel> getLastNumberTrivia();

  /// Calls the http://numberapi.com/{number} endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}
