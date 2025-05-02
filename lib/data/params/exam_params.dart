part of "../data.dart";

class ExamCreateParams extends BaseParams {
  final List<int> tags;
  final String title;
  final String description;
  final List<QuestionJson> questions;
  final List<ExamScoreDetail> scoreDetails;
  final String categoryId;

  ExamCreateParams({
    required super.apiKey,
    required super.token,
    required this.tags,
    required this.title,
    required this.description,
    required this.questions,
    required this.scoreDetails,
    required this.categoryId,
  });

  factory ExamCreateParams.fromJson(String str) => ExamCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamCreateParams.fromMap(Map<String, dynamic> json) => ExamCreateParams(
        apiKey: json["apiKey"],
        token: json["token"],
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        title: json["title"],
        description: json["description"],
        questions: List<QuestionJson>.from(json["questions"].map((dynamic x) => QuestionJson.fromMap(x))),
        scoreDetails: List<ExamScoreDetail>.from(json["scoreDetails"].map((dynamic x) => ExamScoreDetail.fromMap(x))),
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        ...super.toBaseMap(),
        "tags": List<dynamic>.from(tags.map((dynamic x) => x)),
        "title": title,
        "description": description,
        "questions": List<dynamic>.from(questions.map((dynamic x) => x.toMap())),
        "scoreDetails": List<dynamic>.from(scoreDetails.map((dynamic x) => x.toMap())),
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
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    categoryId: json["categoryId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    ...toBaseReadMap(),
    "categoryId": categoryId,
  };
}


class SubmitAnswersParams extends BaseParams {
  final List<UserAnswerResultJson> answers;
  final String userId;
  final String examId;

  SubmitAnswersParams({
    required super.apiKey,
    required super.token,
    required this.answers,
    required this.userId,
    required this.examId,
  });

  factory SubmitAnswersParams.fromJson(String str) => SubmitAnswersParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubmitAnswersParams.fromMap(Map<String, dynamic> json) => SubmitAnswersParams(
        apiKey: json["apiKey"],
        token: json["token"],
        answers: List<UserAnswerResultJson>.from(json["answers"].map((dynamic x) => UserAnswerResultJson.fromMap(x))),
        userId: json["userId"],
        examId: json["examId"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        ...super.toBaseMap(),
        "answers": List<dynamic>.from(answers.map((dynamic x) => x.toMap())),
        "userId": userId,
        "examId": examId,
      };
}
