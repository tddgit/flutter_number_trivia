import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/error/failures.dart';
import 'package:flutter_number_trivia/core/platform/network_info.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/'
    'datasources/number_trivia_local_data_source.dart';
import 'package:flutter_number_trivia/features/number_trivia/data/'
    'datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/'
    'entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/number_trivia/domain/'
    'repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl extends NumberTriviaRepository {
  NumberTriviaRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int? number) async {
    await networkInfo.isConnected;
    return right(await remoteDataSource.getConcreteNumberTrivia(number));
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    // TODO: implement getRandomNumberTrivia
    throw UnimplementedError();
  }
}
