import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quiz/models/quiz/answer_option.dart';
import 'package:flutter_quiz/models/quiz/question.dart';
import 'package:flutter_quiz/repository/quiz/quiz_repository.dart';
import './quiz_event.dart';
import './quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({this.repository});

  @override
  QuizState get initialState => QuizInitialState();

  final QuizRepository repository;

  @override
  Stream<QuizState> mapEventToState(QuizEvent event) async* {
    if (event is QuizInitEvent) {
      yield QuizLoadingState();
      try {
        var quiz = await repository.loadQuiz();
        var totalQuestions = quiz.questions.length;
        if (totalQuestions > 0) {
          yield QuizLoadedState(questions: quiz.questions, currentIndex: 0);
        } else {
          yield QuizLoadingFailedState("There is no question to show.");
        }
      } catch (error) {
        yield QuizLoadingFailedState(error.toString());
      }
    }

    if (event is QuizNextEvent && state is QuizLoadedState) {
      var currentState = (state as QuizLoadedState);
      if (currentState.questions[currentState.currentIndex].selectedAnswerId ==
          null) {
        yield QuizNotAnsweredState("Select an Answer first.");
        yield currentState;
      } else if (currentState.currentIndex < currentState.questions.length) {
        yield QuizLoadedState(
            questions: currentState.questions,
            currentIndex: currentState.currentIndex + 1);
      }
    }

    if (event is QuizAnswerEvent && state is QuizLoadedState) {
      var currentState = (state as QuizLoadedState);
      var index = currentState.currentIndex;
      currentState.questions[index].selectedAnswerId = event.answerId;
      yield QuizLoadedState(
          questions: currentState.questions, currentIndex: index);
    }

    if (event is QuizDoneEvent && state is QuizLoadedState) {
      int total = 0;
      List<Question> questions = (state as QuizLoadedState).questions;

      for (Question question in questions) {
        for (AnswerOption answerOption in question.answerOptions) {
          if (answerOption.id == question.selectedAnswerId) {
            total += answerOption.points;
          }
        }
      }

      yield QuizCompletedState(questions: questions, totalScore: total);
      yield QuizLoadedState(questions: questions, currentIndex: 0);
    }

    yield state;
  }
}
