import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_quiz/models/quiz/quiz.dart';
import './quiz_repository.dart';

class MockQuizRepository extends QuizRepository {
  @override
  Future<Quiz> loadQuiz() async {
    // TODO: replace url with your API url for quiz.
    final String url = "";

    var response = await http.get(url);
    print(response.body);
    var jsonData = json.decode(response.body);
    return Quiz.fromJson(jsonData);
  }
}
