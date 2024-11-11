import 'dart:convert';

class Vocabulary {
  final String id;
  final String korean;
  final String translation;
  final bool completed;

  Vocabulary({
    required this.id,
    required this.korean,
    required this.translation,
    required this.completed,
  });

  factory Vocabulary.fromJson(Map<String, dynamic> json) {
    return Vocabulary(
      id: json['id'] as String,
      korean: json['korean'] as String,
      translation: json['translation'] as String,
      completed: json['completed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'korean': korean,
      'translation': translation,
      'completed': completed,
    };
  }
}
