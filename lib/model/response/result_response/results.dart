import 'dart:convert';
class Result {
  Result(
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  );

  String  category;
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
     json["category"],
     json["type"],
     json["difficulty"],
     json["question"],
     json["correct_answer"],
     List<String>.from(json["incorrect_answers"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "category": category,
    "type": type,
    "difficulty": difficulty,
    "question": question,
    "correct_answer": correctAnswer,
    "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
  };
}
