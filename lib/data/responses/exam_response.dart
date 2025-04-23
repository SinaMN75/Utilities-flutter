part of "../data.dart";

class UserAnswerJson {
  final String? date;
  final int? totalScore;
  final List<ResultElement>? results;

  UserAnswerJson({
    this.date,
    this.totalScore,
    this.results,
  });

  factory UserAnswerJson.fromJson(String str) => UserAnswerJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAnswerJson.fromMap(Map<String, dynamic> json) => UserAnswerJson(
    date: json["date"],
    totalScore: json["totalScore"],
    results: json["results"] == null ? <ResultElement>[] : List<ResultElement>.from(json["results"]!.map((final dynamic x) => ResultElement.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "date": date,
    "totalScore": totalScore,
    "results": results == null ? <dynamic>[] : List<dynamic>.from(results!.map((ResultElement x) => x.toMap())),
  };
}

class ResultElement {
  final String? question;
  final Answer? answer;

  ResultElement({
    this.question,
    this.answer,
  });

  factory ResultElement.fromJson(String str) => ResultElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultElement.fromMap(Map<String, dynamic> json) => ResultElement(
    question: json["question"],
    answer: json["answer"] == null ? null : Answer.fromMap(json["answer"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "question": question,
    "answer": answer?.toMap(),
  };
}

class Answer {
  final String? title;
  final String? score;

  Answer({
    this.title,
    this.score,
  });

  factory Answer.fromJson(String str) => Answer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Answer.fromMap(Map<String, dynamic> json) => Answer(
    title: json["title"],
    score: json["score"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "title": title,
    "score": score,
  };
}
