import 'package:flutter_quiz/models/quiz/answer_option.dart';
import 'package:flutter_quiz/models/quiz/question.dart';
import 'package:flutter_quiz/models/quiz/quiz.dart';

abstract class QuizRepository {
  Future<Quiz> loadQuiz();
}

class MockQuizRepository extends QuizRepository {
  @override
  Future<Quiz> loadQuiz() async {
    await Future.delayed(Duration(seconds: 1));
    return Quiz([
      Question("0", "question1", "description1", [
        AnswerOption("0", "answer1", "description1", 10),
        AnswerOption("1", "answer2", "description2", 10),
        AnswerOption("2", "answer3", "description3", 10),
      ]),
      Question("0", "question2", "description2", [
        AnswerOption("0", "answer1", "description1", 10),
        AnswerOption("1", "answer2", "description2", 10),
        AnswerOption("2", "answer3", "description3", 10),
      ]),
    ], " Quiz description : Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam");
  }
}
