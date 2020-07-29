import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/quiz/question.dart';

abstract class QuizState {}

class QuizInitialState extends QuizState {}

class QuizLoadingState extends QuizState {}

class QuizErrorState extends QuizState {
  final String message;
  QuizErrorState(this.message);
}

class QuizLoadingFailedState extends QuizErrorState {
  QuizLoadingFailedState(String message) : super(message);
}

class QuizNotAnsweredState extends QuizErrorState {
  QuizNotAnsweredState(String message) : super(message);
}

class QuizLoadedState extends QuizState {
  final List<Question> questions;
  final int currentIndex;

  QuizLoadedState({
    @required this.questions,
    @required this.currentIndex,
  });
}

class QuizCompletedState extends QuizState {
  final List<Question> questions;
  final int totalScore;

  QuizCompletedState({
    @required this.questions,
    @required this.totalScore,
  });
}
