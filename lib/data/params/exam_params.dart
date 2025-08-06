part of "../data.dart";

class ExamCreateParams {
  final String title;
  final String description;
  final List<QuestionJson> questions;
  final List<ExamScoreDetail> scoreDetails;
  final String categoryId;
  final List<int> tags;
  final String? token;

  ExamCreateParams({
    required this.title,
    required this.description,
    required this.questions,
    required this.scoreDetails,
    required this.categoryId,
    required this.tags,
    this.token,
  });

  factory ExamCreateParams.fromJson(String str) => ExamCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamCreateParams.fromMap(Map<String, dynamic> json) => ExamCreateParams(
        title: json["title"],
        description: json["description"],
        questions: List<QuestionJson>.from(json["questions"].map((dynamic x) => QuestionJson.fromMap(x))),
        scoreDetails: List<ExamScoreDetail>.from(json["scoreDetails"].map((dynamic x) => ExamScoreDetail.fromMap(x))),
        categoryId: json["categoryId"],
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "title": title,
        "description": description,
        "questions": List<dynamic>.from(questions.map((dynamic x) => x.toMap())),
        "scoreDetails": List<dynamic>.from(scoreDetails.map((dynamic x) => x.toMap())),
        "categoryId": categoryId,
        "tags": List<dynamic>.from(tags.map((dynamic x) => x)),
        "token": token,
      };
}

class ExamReadParams {
  final String? categoryId;
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final List<int>? tags;
  final String? token;

  ExamReadParams({
    this.categoryId,
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
    this.token,
  });

  factory ExamReadParams.fromJson(String str) => ExamReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamReadParams.fromMap(Map<String, dynamic> json) => ExamReadParams(
        categoryId: json["categoryId"],
        pageSize: json["pageSize"] ?? 0,
        pageNumber: json["pageNumber"] ?? 0,
        fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
        toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
        orderByCreatedAt: json["orderByCreatedAt"] ?? false,
        orderByCreatedAtDesc: json["orderByCreatedAtDesc"] ?? false,
        orderByUpdatedAt: json["orderByUpdatedAt"] ?? false,
        orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"] ?? false,
        tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "categoryId": categoryId,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "fromCreatedAt": fromCreatedAt?.toIso8601String(),
        "toCreatedAt": toCreatedAt?.toIso8601String(),
        "orderByCreatedAt": orderByCreatedAt,
        "orderByCreatedAtDesc": orderByCreatedAtDesc,
        "orderByUpdatedAt": orderByUpdatedAt,
        "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((dynamic x) => x)),
        "token": token,
      };
}

class SubmitAnswersParams {
  final List<UserAnswerResultJson> answers;
  final String userId;
  final String examId;
  final String? token;

  SubmitAnswersParams({
    required this.answers,
    required this.userId,
    required this.examId,
    this.token,
  });

  factory SubmitAnswersParams.fromJson(String str) => SubmitAnswersParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubmitAnswersParams.fromMap(Map<String, dynamic> json) => SubmitAnswersParams(
        answers: List<UserAnswerResultJson>.from(json["answers"].map((dynamic x) => UserAnswerResultJson.fromMap(x))),
        userId: json["userId"],
        examId: json["examId"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "answers": List<dynamic>.from(answers.map((dynamic x) => x.toMap())),
        "userId": userId,
        "examId": examId,
        "token": token,
      };
}
