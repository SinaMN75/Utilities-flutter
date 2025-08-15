part of "../data.dart";

class UExamResponse {
  UExamResponse({
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

  factory UExamResponse.fromJson(String str) => UExamResponse.fromMap(json.decode(str));

  factory UExamResponse.fromMap(Map<String, dynamic> json) => UExamResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        jsonData: UExamJson.fromMap(json["jsonData"]),
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        title: json["title"],
        description: json["description"],
        categoryId: json["categoryId"],
        category: json["category"] == null ? null : UCategoryResponse.fromMap(json["category"]),
      );
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UExamJson jsonData;
  final List<int> tags;
  final String title;
  final String description;
  final String categoryId;
  final UCategoryResponse? category;

  String toJson() => json.encode(toMap());

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

class UExamJson {
  UExamJson({
    required this.questions,
    required this.scoreDetails,
  });

  factory UExamJson.fromJson(String str) => UExamJson.fromMap(json.decode(str));

  factory UExamJson.fromMap(Map<String, dynamic> json) => UExamJson(
        questions: List<UQuestionJson>.from(json["questions"].map((dynamic x) => UQuestionJson.fromMap(x))),
        scoreDetails: List<UExamScoreDetail>.from(json["scoreDetails"].map((dynamic x) => UExamScoreDetail.fromMap(x))),
      );
  final List<UQuestionJson> questions;
  final List<UExamScoreDetail> scoreDetails;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "questions": List<dynamic>.from(questions.map((UQuestionJson x) => x.toMap())),
        "scoreDetails": List<dynamic>.from(scoreDetails.map((UExamScoreDetail x) => x.toMap())),
      };
}

class UExamScoreDetail {
  UExamScoreDetail({
    required this.minScore,
    required this.maxScore,
    required this.label,
    required this.description,
  });

  factory UExamScoreDetail.fromJson(String str) => UExamScoreDetail.fromMap(json.decode(str));

  factory UExamScoreDetail.fromMap(Map<String, dynamic> json) => UExamScoreDetail(
        minScore: json["minScore"],
        maxScore: json["maxScore"],
        label: json["label"],
        description: json["description"],
      );
  final int minScore;
  final int maxScore;
  final String label;
  final String description;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "minScore": minScore,
        "maxScore": maxScore,
        "label": label,
        "description": description,
      };
}

class UQuestionJson {
  UQuestionJson({
    required this.title,
    required this.description,
    required this.options,
    this.order,
  });

  factory UQuestionJson.fromJson(String str) => UQuestionJson.fromMap(json.decode(str));

  factory UQuestionJson.fromMap(Map<String, dynamic> json) => UQuestionJson(
        order: json["order"],
        title: json["title"],
        description: json["description"],
        options: List<UQuestionOptionJson>.from(json["options"].map((dynamic x) => UQuestionOptionJson.fromMap(x))),
      );
  final int? order;
  final String title;
  final String description;
  final List<UQuestionOptionJson> options;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "order": order,
        "title": title,
        "description": description,
        "options": List<dynamic>.from(options.map((UQuestionOptionJson x) => x.toMap())),
      };
}

class UQuestionOptionJson {
  UQuestionOptionJson({
    required this.title,
    required this.hint,
    required this.score,
  });

  factory UQuestionOptionJson.fromJson(String str) => UQuestionOptionJson.fromMap(json.decode(str));

  factory UQuestionOptionJson.fromMap(Map<String, dynamic> json) => UQuestionOptionJson(
        title: json["title"],
        hint: json["hint"],
        score: json["score"],
      );
  final String title;
  final String hint;
  final int score;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "title": title,
        "hint": hint,
        "score": score,
      };
}

class UUserAnswerJson {
  UUserAnswerJson({
    required this.date,
    required this.totalScore,
    required this.results,
    required this.label,
    required this.description,
  });

  factory UUserAnswerJson.fromJson(String str) => UUserAnswerJson.fromMap(json.decode(str));

  factory UUserAnswerJson.fromMap(Map<String, dynamic> json) => UUserAnswerJson(
        date: DateTime.parse(json["date"]),
        totalScore: json["totalScore"],
        results: List<UUserAnswerResultJson>.from(json["results"].map((dynamic x) => UUserAnswerResultJson.fromMap(x))),
        label: json["label"],
        description: json["description"],
      );
  final DateTime date;
  final int totalScore;
  final List<UUserAnswerResultJson> results;
  final String label;
  final String description;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "date": date.toIso8601String(),
        "totalScore": totalScore,
        "results": List<dynamic>.from(results.map((UUserAnswerResultJson x) => x.toMap())),
        "label": label,
        "description": description,
      };
}

class UUserAnswerResultJson {
  UUserAnswerResultJson({
    required this.question,
    required this.answer,
  });

  factory UUserAnswerResultJson.fromJson(String str) => UUserAnswerResultJson.fromMap(json.decode(str));

  factory UUserAnswerResultJson.fromMap(Map<String, dynamic> json) => UUserAnswerResultJson(
        question: json["question"],
        answer: UQuestionOptionJson.fromMap(json["answer"]),
      );
  final String question;
  final UQuestionOptionJson answer;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "question": question,
        "answer": answer.toMap(),
      };
}
