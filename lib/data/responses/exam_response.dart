part of "../data.dart";

class ExamResponse {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<int> tags;
  final ResultJsonData jsonData;
  final String title;
  final String description;
  final CategoryResponse category;

  ExamResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.tags,
    required this.jsonData,
    required this.title,
    required this.description,
    required this.category,
  });

  factory ExamResponse.fromJson(String str) => ExamResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamResponse.fromMap(Map<String, dynamic> json) => ExamResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    tags: List<int>.from(json["tags"].map((x) => x)),
    jsonData: ResultJsonData.fromMap(json["jsonData"]),
    title: json["title"],
    description: json["description"],
    category: CategoryResponse.fromMap(json["category"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "jsonData": jsonData.toMap(),
    "title": title,
    "description": description,
    "category": category.toMap(),
  };
}

class ResultJsonData {
  final List<QuestionJson>? questions;

  ResultJsonData({
    this.questions,
  });

  factory ResultJsonData.fromJson(String str) => ResultJsonData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultJsonData.fromMap(Map<String, dynamic> json) => ResultJsonData(
        questions: json["questions"] == null ? [] : List<QuestionJson>.from(json["questions"]!.map((x) => QuestionJson.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x.toMap())),
      };
}

class UserAnswerJson {
  final String date;
  final int totalScore;
  final List<UserAnswerResultJson> results;

  UserAnswerJson({
    required this.date,
    required this.totalScore,
    required this.results,
  });

  factory UserAnswerJson.fromJson(String str) => UserAnswerJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAnswerJson.fromMap(Map<String, dynamic> json) => UserAnswerJson(
        date: json["date"],
        totalScore: json["totalScore"],
        results: List<UserAnswerResultJson>.from(json["results"]!.map((final dynamic x) => UserAnswerResultJson.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "date": date,
        "totalScore": totalScore,
        "results": List<dynamic>.from(results.map((UserAnswerResultJson x) => x.toMap())),
      };
}

class UserAnswerResultJson {
  final String? question;
  final QuestionOptionJson? answer;

  UserAnswerResultJson({
    this.question,
    this.answer,
  });

  factory UserAnswerResultJson.fromJson(String str) => UserAnswerResultJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAnswerResultJson.fromMap(Map<String, dynamic> json) => UserAnswerResultJson(
        question: json["question"],
        answer: json["answer"] == null ? null : QuestionOptionJson.fromMap(json["answer"]),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "question": question,
        "answer": answer?.toMap(),
      };
}

class QuestionJson {
  final int? order;
  final String title;
  final String description;
  final List<QuestionOptionJson> options;

  QuestionJson({
    required this.title,
    required this.description,
    required this.options,
    this.order,
  });

  factory QuestionJson.fromJson(String str) => QuestionJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionJson.fromMap(Map<String, dynamic> json) => QuestionJson(
        order: json["order"],
        title: json["title"],
        description: json["description"],
        options: List<QuestionOptionJson>.from(json["options"]!.map((x) => QuestionOptionJson.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "order": order,
        "title": title,
        "description": description,
        "options": List<dynamic>.from(options.map((x) => x.toMap())),
      };
}

class QuestionOptionJson {
  final String title;
  final String hint;
  final String score;

  QuestionOptionJson({
    required this.title,
    required this.hint,
    required this.score,
  });

  factory QuestionOptionJson.fromJson(String str) => QuestionOptionJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionOptionJson.fromMap(Map<String, dynamic> json) => QuestionOptionJson(
        title: json["title"],
        hint: json["hint"],
        score: json["score"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "hint": hint,
        "score": score,
      };
}
