part of "../data.dart";

class UExamCreateParams {
  UExamCreateParams({
    required this.title,
    required this.description,
    required this.questions,
    required this.scoreDetails,
    required this.categoryId,
    required this.tags,
  });

  factory UExamCreateParams.fromJson(String str) => UExamCreateParams.fromMap(json.decode(str));

  factory UExamCreateParams.fromMap(Map<String, dynamic> json) => UExamCreateParams(
        title: json["title"],
        description: json["description"],
        questions: List<UQuestionJson>.from(json["questions"].map((dynamic x) => UQuestionJson.fromMap(x))),
        scoreDetails: List<UExamScoreDetail>.from(json["scoreDetails"].map((dynamic x) => UExamScoreDetail.fromMap(x))),
        categoryId: json["categoryId"],
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
      );
  final String title;
  final String description;
  final List<UQuestionJson> questions;
  final List<UExamScoreDetail> scoreDetails;
  final String categoryId;
  final List<int> tags;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "title": title,
        "description": description,
        "questions": List<dynamic>.from(questions.map((dynamic x) => x.toMap())),
        "scoreDetails": List<dynamic>.from(scoreDetails.map((dynamic x) => x.toMap())),
        "categoryId": categoryId,
        "tags": List<dynamic>.from(tags.map((dynamic x) => x)),
      };
}

class UExamReadParams {
  UExamReadParams({
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
  });

  factory UExamReadParams.fromJson(String str) => UExamReadParams.fromMap(json.decode(str));

  factory UExamReadParams.fromMap(Map<String, dynamic> json) => UExamReadParams(
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
      );
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

  String toJson() => json.encode(toMap());

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
      };
}

class USubmitAnswersParams {
  USubmitAnswersParams({
    required this.answers,
    required this.userId,
    required this.examId,
  });

  factory USubmitAnswersParams.fromJson(String str) => USubmitAnswersParams.fromMap(json.decode(str));

  factory USubmitAnswersParams.fromMap(Map<String, dynamic> json) => USubmitAnswersParams(
        answers: List<UUserAnswerResultJson>.from(json["answers"].map((dynamic x) => UUserAnswerResultJson.fromMap(x))),
        userId: json["userId"],
        examId: json["examId"],
      );
  final List<UUserAnswerResultJson> answers;
  final String userId;
  final String examId;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "answers": List<dynamic>.from(answers.map((dynamic x) => x.toMap())),
        "userId": userId,
        "examId": examId,
      };
}
