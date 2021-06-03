import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/error/failures.dart';
import 'package:flutter_number_trivia/core/platform/network_info.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/'
    'datasources/number_trivia_local_data_source.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/'
    'datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_number_trivia/features/number_trivia/'
    'data/models/number_trivia_model.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/'
    'repositories/number_trivia_repository_impl.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  final MockRemoteDataSource mockRemoteDataSource = MockRemoteDataSource();
  final MockLocalDataSource mockLocalDataSource = MockLocalDataSource();
  final MockNetworkInfo mockNetworkInfo = MockNetworkInfo();
  final NumberTriviaRepositoryImpl repository = NumberTriviaRepositoryImpl(
    remoteDataSource: mockRemoteDataSource,
    localDataSource: mockLocalDataSource,
    networkInfo: mockNetworkInfo,
  );

  const int tNumber = 1;
  const NumberTriviaModel tNumberTriviaModel = NumberTriviaModel(
    newNumber: tNumber,
    newText: 'test trivia',
  );
  const NumberTriviaModel tNumberTrivia = tNumberTriviaModel;

  // setUp(() {
  //   mockRemoteDataSource = MockRemoteDataSource();
  //   mockLocalDataSource = MockLocalDataSource();
  //   mockNetworkInfo = MockNetworkInfo();
  //   repository = NumberTriviaRepositoryImpl(
  //     remoteDataSource: mockRemoteDataSource,
  //     localDataSource: mockLocalDataSource,
  //     networkInfo: mockNetworkInfo,
  //   );
  // });

  group('getConcreteNumberTrivia', () {
    test('should check if the device is online', () async {
      when(mockNetworkInfo.isConnected)
          .thenAnswer((Invocation _) async => true);

      await repository.getConcreteNumberTrivia(tNumber);

      verify(mockNetworkInfo.isConnected);
    });
  });

  group('device is online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected)
          .thenAnswer((Invocation _) async => true);
    });
    test(
        'should return remote data when the call to remote data '
        'source is successful', () async {
      when(mockRemoteDataSource.getConcreteNumberTrivia(any))
          .thenAnswer((Invocation _) async => tNumberTriviaModel);

      final Either<Failure, NumberTrivia> result =
          await repository.getConcreteNumberTrivia(tNumber);

      verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));

      expect(result, right<Failure, NumberTrivia>(tNumberTrivia));
    });
  });

  group('device is offline', () {
    setUp(() {
      when(mockNetworkInfo.isConnected)
          .thenAnswer((Invocation _) async => false);
    });
    test('', () {});
  });
}
