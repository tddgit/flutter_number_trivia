import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class NumberTrivia extends Equatable {
  const NumberTrivia({required this.text, required this.number}) : super();

  factory NumberTrivia.fromJson(Map<String, dynamic> json) {
    return NumberTrivia(
        text: json['text'] as String, number: (json['number'] as num).toInt());
  }

  final String text;
  final int number;

  String toJson() {
    return '{\n'
        '  "text": "$text",\n'
        '  "number": $number,\n'
        '  "found": true,\n'
        '  "type": "trivia"\n'
        '}';
  }

  @override
  List<Object?> get props => <Object?>[];
}
