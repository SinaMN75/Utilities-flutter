part of "../data.dart";

class ExamResponse {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ExamJson jsonData;
  final List<int> tags;
  final String title;
  final String description;
  final String categoryId;
  final CategoryResponse? category;

  ExamResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    required this.description,
    required this.categoryId,
    this.category,
  });

  factory ExamResponse.fromJson(String str) => ExamResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamResponse.fromMap(Map<String, dynamic> json) => ExamResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        jsonData: ExamJson.fromMap(json["jsonData"]),
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        title: json["title"],
        description: json["description"],
        categoryId: json["categoryId"],
        category: json["category"] == null ? null : CategoryResponse.fromMap(json["category"]),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "jsonData": jsonData.toMap(),
        "tags": List<dynamic>.from(tags.map((int x) => x)),
        "title": title,
        "description": description,
        "categoryId": categoryId,
        "category": category?.toMap(),
      };
}

class ExamJson {
  final List<QuestionJson> questions;
  final List<ExamScoreDetail> scoreDetails;

  ExamJson({
    required this.questions,
    required this.scoreDetails,
  });

  factory ExamJson.fromJson(String str) => ExamJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamJson.fromMap(Map<String, dynamic> json) => ExamJson(
        questions: List<QuestionJson>.from(json["questions"].map((dynamic x) => QuestionJson.fromMap(x))),
        scoreDetails: List<ExamScoreDetail>.from(json["scoreDetails"].map((dynamic x) => ExamScoreDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "questions": List<dynamic>.from(questions.map((QuestionJson x) => x.toMap())),
        "scoreDetails": List<dynamic>.from(scoreDetails.map((ExamScoreDetail x) => x.toMap())),
      };
}

class ExamScoreDetail {
  final double minScore;
  final double maxScore;
  final String label;
  final String description;

  ExamScoreDetail({
    required this.minScore,
    required this.maxScore,
    required this.label,
    required this.description,
  });

  factory ExamScoreDetail.fromJson(String str) => ExamScoreDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamScoreDetail.fromMap(Map<String, dynamic> json) => ExamScoreDetail(
        minScore: json["minScore"],
        maxScore: json["maxScore"],
        label: json["label"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "minScore": minScore,
        "maxScore": maxScore,
        "label": label,
        "description": description,
      };
}

class QuestionJson {
  final int? order;
  final String title;
  final String description;
  final List<QuestionOptionJson> options;

  QuestionJson({
    this.order,
    required this.title,
    required this.description,
    required this.options,
  });

  factory QuestionJson.fromJson(String str) => QuestionJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionJson.fromMap(Map<String, dynamic> json) => QuestionJson(
        order: json["order"],
        title: json["title"],
        description: json["description"],
        options: List<QuestionOptionJson>.from(json["options"].map((dynamic x) => QuestionOptionJson.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "order": order,
        "title": title,
        "description": description,
        "options": List<dynamic>.from(options.map((QuestionOptionJson x) => x.toMap())),
      };
}

class QuestionOptionJson {
  final String title;
  final String hint;
  final int score;

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

  Map<String, dynamic> toMap() => <String, dynamic>{
        "title": title,
        "hint": hint,
        "score": score,
      };
}

class UserAnswerJson {
  final DateTime date;
  final int totalScore;
  final List<UserAnswerResultJson> results;
  final String label;
  final String description;

  UserAnswerJson({
    required this.date,
    required this.totalScore,
    required this.results,
    required this.label,
    required this.description,
  });

  factory UserAnswerJson.fromJson(String str) => UserAnswerJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAnswerJson.fromMap(Map<String, dynamic> json) => UserAnswerJson(
        date: DateTime.parse(json["date"]),
        totalScore: json["totalScore"],
        results: List<UserAnswerResultJson>.from(json["results"].map((dynamic x) => UserAnswerResultJson.fromMap(x))),
        label: json["label"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "date": date.toIso8601String(),
        "totalScore": totalScore,
        "results": List<dynamic>.from(results.map((UserAnswerResultJson x) => x.toMap())),
        "label": label,
        "description": description,
      };
}

class UserAnswerResultJson {
  final String question;
  final QuestionOptionJson answer;

  UserAnswerResultJson({
    required this.question,
    required this.answer,
  });

  factory UserAnswerResultJson.fromJson(String str) => UserAnswerResultJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAnswerResultJson.fromMap(Map<String, dynamic> json) => UserAnswerResultJson(
        question: json["question"],
        answer: QuestionOptionJson.fromMap(json["answer"]),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "question": question,
        "answer": answer.toMap(),
      };
}
