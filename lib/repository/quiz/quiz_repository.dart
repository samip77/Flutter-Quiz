import 'package:flutter_quiz/models/quiz/quiz.dart';

abstract class QuizRepository {
  Future<Quiz> loadQuiz();
}
