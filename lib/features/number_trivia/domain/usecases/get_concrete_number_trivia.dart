import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_number_trivia/core/error/failures.dart';
import 'package:flutter_number_trivia/core/usecases/usecases.dart';
import 'package:flutter_number_trivia/features/'
    'number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/number_trivia/'
    'domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params?> {
  GetConcreteNumberTrivia(this.repository);

  final NumberTriviaRepository repository;

  @override
  Future<Either<Failure, NumberTrivia>> call(
    Params? params,
  ) async {
    return await repository.getConcreteNumberTrivia(params?.number);
  }
}

@immutable
class Params extends Equatable {
  const Params({required this.number});

  final int number;

  @override
  List<Object?> get props => <Object?>[number];
}
