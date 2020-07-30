import './answer_option.dart';

class Question {
  final String id;
  final String question;

  final List<AnswerOption> answerOptions;
  String selectedAnswerId;

  Question(this.id, this.question, this.answerOptions);

  factory Question.fromJson(Map<String, dynamic> json) {
    var list = json['answerOptions'] as List;
    List<AnswerOption> options =
        list.map((i) => AnswerOption.fromJson(i)).toList();
    var question = Question(json['id'], json['question'], options)
      ..selectedAnswerId = json['selectedAnswerId'];
    return question;
  }

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "question": question == null ? null : question,
        "answerOptions": answerOptions == null
            ? null
            : List<dynamic>.from(answerOptions.map((x) => x.toJson())),
        "selectedAnswerId": selectedAnswerId == null ? null : selectedAnswerId,
      };
}
