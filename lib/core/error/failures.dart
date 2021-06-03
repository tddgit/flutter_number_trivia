import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class Failure extends Equatable {
  // ignore:avoid_unused_constructor_parameters
  const Failure([List<dynamic> properties = const <dynamic>[]]) : super();
}

class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CacheFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
