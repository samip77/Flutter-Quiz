// enum QuizEvent {
//   init,
//   next,
//   selectAnswer,
// }

abstract class QuizEvent {}

class QuizInitEvent extends QuizEvent {}

class QuizNextEvent extends QuizEvent {}

class QuizAnswerEvent extends QuizEvent {
  final String answerId;
  QuizAnswerEvent(this.answerId);
}

class QuizDoneEvent extends QuizEvent {}
