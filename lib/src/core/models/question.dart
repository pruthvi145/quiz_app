import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:quiz_app/src/core/models/option.dart';

class Question {
  int id;
  String question;
  List<Option> options;

  Question({
    required this.id,
    required this.question,
    required this.options,
  });

  Question copyWith({
    int? id,
    String? question,
    List<Option>? options,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      question: map['question'],
      options: List<Option>.from(map['options']?.map((x) => Option.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));

  @override
  String toString() =>
      'Question(id: $id, question: $question, options: $options)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.id == id &&
        other.question == question &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode => id.hashCode ^ question.hashCode ^ options.hashCode;
}
