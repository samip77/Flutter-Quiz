class AnswerOption {
  final String id;
  final String answer;
  final String description;
  final int points;
  bool isSelected = false;

  AnswerOption(
    this.id,
    this.answer,
    this.description,
    this.points,
  );

  // AnswerOption.fromJson(Map<String, dynamic> json)
  //     : id = json['id'] as String,
  //       answer = json['answer'] as String,
  //       description = json['description'] as String,
  //       points = json['points'] as int;

  AnswerOption.fromJson(Map<String, dynamic> json)
      : id = json["id"] == null ? null : json["id"],
        answer = json["answer"] == null ? null : json["answer"],
        description = json["description"] == null ? null : json["description"],
        points = json["points"] == null ? null : json["points"];

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "answer": answer == null ? null : answer,
        "description": description == null ? null : description,
        "points": points == null ? null : points,
      };
}
