import 'package:flutter_quiz/models/quiz/question.dart';

class Quiz {
  final List<Question> questions;
  final String description;
  int totalPoints;

  Quiz(this.questions, this.description);

  factory Quiz.fromJson(Map<String, dynamic> json) {
    var list = json['questions'] as List;
    List<Question> questions = list.map((i) => Question.fromJson(i)).toList();
    var quiz = Quiz(
      questions,
      json['description'] as String,
    )..totalPoints = json['totalPoints'];
    return quiz;
  }

  Map<String, dynamic> toJson() => {
        "description": description == null ? null : description,
        "questions": questions == null
            ? null
            : List<dynamic>.from(questions.map((x) => x.toJson())),
        'totalPoints': totalPoints,
      };
}
