import 'dart:convert';

class Option {
  int id;
  String option;
  bool isCorrect;
  Option({
    required this.option,
    required this.id,
    this.isCorrect = false,
  });

  Option copyWith({
    String? option,
    int? id,
    bool? isCorrect,
  }) {
    return Option(
      option: option ?? this.option,
      id: id ?? this.id,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'option': option,
      'id': id,
      'isCorrect': isCorrect,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      option: map['option'],
      id: map['id'],
      isCorrect: map['isCorrect'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Option.fromJson(String source) => Option.fromMap(json.decode(source));

  @override
  String toString() =>
      'Option(option: $option, id: $id, isCorrect: $isCorrect)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Option &&
        other.option == option &&
        other.id == id &&
        other.isCorrect == isCorrect;
  }

  @override
  int get hashCode => option.hashCode ^ id.hashCode ^ isCorrect.hashCode;
}
