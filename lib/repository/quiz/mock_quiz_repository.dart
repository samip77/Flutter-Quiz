import 'package:flutter_quiz/models/quiz/answer_option.dart';
import 'package:flutter_quiz/models/quiz/question.dart';
import 'package:flutter_quiz/models/quiz/quiz.dart';
import './quiz_repository.dart';

class MockQuizRepository extends QuizRepository {
  @override
  Future<Quiz> loadQuiz() async {
    await Future.delayed(Duration(seconds: 1));
    return Quiz([
      Question("0", "Select your Age Group", [
        AnswerOption("0", "at least 18 and less than 25",
            "You will  get 25 points.", 25),
        AnswerOption("1", "at least 25 and less than 33",
            "You will  get 30 points.", 30),
        AnswerOption("2", "at least 33 and less than 40",
            "You will  get 25 points.", 25),
      ]),
      Question("1", "Rate your English", [
        AnswerOption("0", "Competent English", "You will  get 0 points.", 0),
        AnswerOption("1", "Proficient English", "You will  get 10 points.", 10),
        AnswerOption("2", "Superior English", "You will  get 20 points.", 20),
      ]),
    ], " Quiz description ");
  }
}
