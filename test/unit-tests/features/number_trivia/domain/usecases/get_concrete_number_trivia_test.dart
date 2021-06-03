// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/error/failures.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/'
    'entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/'
    'repositories/number_trivia_repository.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/'
    'usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {
  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int? number) {
    // TODO: implement getConcreteNumberTrivia
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }
}

void main() {
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    final MockNumberTriviaRepository mockNumberTriviaRepository =
        MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });
  const int tNumber = 1;
  const NumberTrivia tNumberTrivia = NumberTrivia(number: 1, text: 'test');
  test('should get trivia for the number from repository', () async {
    //arrange
    when(mockNumberTriviaRepository?.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => right(tNumberTrivia));
    //act
    final Either<Failure, NumberTrivia> result =
        await usecase!(const Params(number: tNumber));

    expect(result, right<Failure, NumberTrivia>(tNumberTrivia));

    verify(mockNumberTriviaRepository?.getConcreteNumberTrivia(42));
  });
}
