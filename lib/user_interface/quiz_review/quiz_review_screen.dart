import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/quiz/question.dart';
import 'package:flutter_quiz/utilities/base_screen.dart';

class QuizReviewScreenArguments {
  final List<Question> questions;
  final int totalScore;

  QuizReviewScreenArguments(this.totalScore, this.questions);
}

class QuizReviewScreen extends BaseStatelessWidget {
  static const String routeName = "/quiz_review_screen";

  final QuizReviewScreenArguments arguments;

  QuizReviewScreen(this.arguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.popUntil(
                context, ModalRoute.withName(Navigator.defaultRouteName))),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: _getBody(context),
    );
  }

  Widget _getScoreWidget(int totalScore) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 4, color: Colors.amber)),
      child: Text(
        totalScore.toString(),
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.blueAccent),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: <Widget>[
          Text(
            "Your current Score:",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.amber),
          ),
          _getScoreWidget(arguments.totalScore),
        ],
      ),
    );
  }
}
