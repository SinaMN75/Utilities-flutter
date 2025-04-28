part of "../data.dart";

class ExamCreateParams extends BaseParams {
  final List<int> tags;
  final String title;
  final String description;
  final List<QuestionJson> questions;
  final String categoryId;

  ExamCreateParams({
    required super.apiKey,
    required super.token,
    required this.tags,
    required this.title,
    required this.description,
    required this.questions,
    required this.categoryId,
  });

  factory ExamCreateParams.fromJson(String str) => ExamCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamCreateParams.fromMap(Map<String, dynamic> json) => ExamCreateParams(
        apiKey: json["apiKey"],
        token: json["token"],
        tags: List<int>.from(json["tags"]!.map((x) => x)),
        title: json["title"],
        description: json["description"],
        questions: List<QuestionJson>.from(json["questions"]!.map((x) => QuestionJson.fromMap(x))),
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toMap() => {
        ...toBaseMap(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "title": title,
        "description": description,
        "questions": List<dynamic>.from(questions.map((x) => x.toMap())),
        "categoryId": categoryId,
      };
}

class ExamReadParams extends BaseReadParams {
  final String? categoryId;

  ExamReadParams({
    required super.apiKey,
    super.token,
    super.pageSize,
    super.pageNumber,
    super.fromDate,
    super.tags,
    this.categoryId,
  });

  factory ExamReadParams.fromJson(String str) => ExamReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamReadParams.fromMap(Map<String, dynamic> json) => ExamReadParams(
        apiKey: json["apiKey"],
        token: json["token"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        fromDate: json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toMap() => {
        ...toBaseReadMap(),
        "categoryId": categoryId,
      };
}

class SubmitAnswersParams extends BaseParams {
  final List<UserAnswerJson> userAnswers;
  final String userId;

  SubmitAnswersParams({
    required super.apiKey,
    required super.token,
    required this.userAnswers,
    required this.userId,
  });

  factory SubmitAnswersParams.fromJson(String str) => SubmitAnswersParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubmitAnswersParams.fromMap(Map<String, dynamic> json) => SubmitAnswersParams(
    apiKey: json["apiKey"],
    token: json["token"],
    userAnswers: json["userAnswers"] == null ? [] : List<UserAnswerJson>.from(json["userAnswers"]!.map((x) => UserAnswerJson.fromMap(x))),
    userId: json["userId"],
  );

  Map<String, dynamic> toMap() => {
    ...toBaseMap(),
    "userAnswers": List<dynamic>.from(userAnswers.map((x) => x.toMap())),
    "userId": userId,
  };
}
