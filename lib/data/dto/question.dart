part of '../data.dart';

class QuestionCreateDto {
  final String question;
  final List<AnswerDetail> answers;
  final List<int> tags;
  final String categoryId;

  QuestionCreateDto({
    required this.question,
    required this.answers,
    required this.tags,
    required this.categoryId,
  });

  factory QuestionCreateDto.fromJson(String str) => QuestionCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory QuestionCreateDto.fromMap(dynamic json) => QuestionCreateDto(
        question: json["question"],
        answers: List<AnswerDetail>.from(json["answers"].map((x) => AnswerDetail.fromMap(x))),
        tags: List<int>.from(json["tags"].map((x) => x)),
        categoryId: json["question"],
      );

  Map<String, dynamic> toMap() => {
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x.toMap())),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "categoryId": categoryId,
      };
}

class AnswerDetail {
  final String answer;
  final String hint;
  final int point;

  AnswerDetail({
    required this.answer,
    required this.hint,
    required this.point,
  });

  factory AnswerDetail.fromJson(String str) => AnswerDetail.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory AnswerDetail.fromMap(dynamic json) => AnswerDetail(
        answer: json["answer"],
        hint: json["hint"],
        point: json["point"],
      );

  Map<String, dynamic> toMap() => {
        "answer": answer,
        "hint": hint,
        "point": point,
      };
}

class QuestionFilterDto {
  final int? pageSize;
  final int? pageNumber;
  final String? fromDate;
  final String? categoryId;
  final List<int>? tags;

  QuestionFilterDto({
    this.pageSize,
    this.pageNumber,
    this.fromDate,
    this.categoryId,
    this.tags,
  });

  factory QuestionFilterDto.fromJson(String str) => QuestionFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory QuestionFilterDto.fromMap(Map<String, dynamic> json) => QuestionFilterDto(
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        fromDate: json["fromDate"],
        categoryId: json["question"],
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "fromDate": fromDate,
        "categoryId": categoryId,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
      };
}

class QuestionReadDto {
  final String id;
  final String createdAt;
  final String updatedAt;
  final QuestionJsonDetail jsonDetail;
  final List<int> tags;
  final CategoryReadDto categoryId;

  QuestionReadDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonDetail,
    required this.tags,
    required this.categoryId,
  });

  factory QuestionReadDto.fromJson(String str) => QuestionReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory QuestionReadDto.fromMap(Map<String, dynamic> json) => QuestionReadDto(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        jsonDetail: QuestionJsonDetail.fromMap(json["jsonDetail"]),
        tags: List<int>.from(json["tags"].map((x) => x)),
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "jsonDetail": jsonDetail.toMap(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "categoryId": categoryId,
      };
}

class QuestionJsonDetail {
  final String question;
  final List<AnswerDetail> answers;

  QuestionJsonDetail({
    required this.question,
    required this.answers,
  });

  factory QuestionJsonDetail.fromJson(String str) => QuestionJsonDetail.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory QuestionJsonDetail.fromMap(Map<String, dynamic> json) => QuestionJsonDetail(
        question: json["question"],
        answers: List<AnswerDetail>.from(json["answers"].map((x) => AnswerDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x.toMap())),
      };
}

class UserQuestionAnswerCreateDto {
  final String userId;
  final List<UserQuestionAnswer> userQuestionAnswer;

  UserQuestionAnswerCreateDto({
    required this.userId,
    required this.userQuestionAnswer,
  });

  factory UserQuestionAnswerCreateDto.fromJson(String str) => UserQuestionAnswerCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory UserQuestionAnswerCreateDto.fromMap(Map<String, dynamic> json) => UserQuestionAnswerCreateDto(
        userId: json["userId"],
        userQuestionAnswer: List<UserQuestionAnswer>.from(json["userQuestionAnswer"].map((x) => UserQuestionAnswer.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "userQuestionAnswer": List<dynamic>.from(userQuestionAnswer.map((x) => x.toMap())),
      };
}

class UserQuestionAnswer {
  final String question;
  final String? title;
  final String answer;
  final String hint;
  final int point;

  UserQuestionAnswer({
    required this.question,
    required this.answer,
    required this.hint,
    required this.point,
    this.title,
  });

  factory UserQuestionAnswer.fromJson(String str) => UserQuestionAnswer.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory UserQuestionAnswer.fromMap(Map<String, dynamic> json) => UserQuestionAnswer(
        title: json["title"],
        question: json["question"],
        answer: json["answer"],
        hint: json["hint"],
        point: json["point"],
      );

  Map<String, dynamic> toMap() => {
        "question": question,
        "title": title,
        "answer": answer,
        "hint": hint,
        "point": point,
      };
}

class UserQuestionAnswerFilterDto {
  final int? pageSize;
  final int? pageNumber;
  final String? fromDate;
  final List<String>? userIds;

  UserQuestionAnswerFilterDto({
    this.pageSize,
    this.pageNumber,
    this.fromDate,
    this.userIds,
  });

  factory UserQuestionAnswerFilterDto.fromJson(String str) => UserQuestionAnswerFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory UserQuestionAnswerFilterDto.fromMap(Map<String, dynamic> json) => UserQuestionAnswerFilterDto(
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        fromDate: json["fromDate"],
        userIds: json["userIds"] == null ? [] : List<String>.from(json["userIds"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "fromDate": fromDate,
        "userIds": userIds == null ? [] : List<dynamic>.from(userIds!.map((x) => x)),
      };
}

class UserQuestionAnswerReadDto {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? userId;
  final UserReadDto? user;
  final UserQuestionAnswerReadDtoJsonDetail? jsonDetail;

  UserQuestionAnswerReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.user,
    this.jsonDetail,
  });

  factory UserQuestionAnswerReadDto.fromJson(String str) => UserQuestionAnswerReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory UserQuestionAnswerReadDto.fromMap(Map<String, dynamic> json) => UserQuestionAnswerReadDto(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        userId: json["userId"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        jsonDetail: json["jsonDetail"] == null ? null : UserQuestionAnswerReadDtoJsonDetail.fromMap(json["jsonDetail"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "userId": userId,
        "user": user?.toMap(),
        "jsonDetail": jsonDetail?.toMap(),
      };
}

class UserQuestionAnswerReadDtoJsonDetail {
  final List<UserQuestionAnswer>? userQuestionAnswer;

  UserQuestionAnswerReadDtoJsonDetail({
    this.userQuestionAnswer,
  });

  factory UserQuestionAnswerReadDtoJsonDetail.fromJson(String str) => UserQuestionAnswerReadDtoJsonDetail.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory UserQuestionAnswerReadDtoJsonDetail.fromMap(Map<String, dynamic> json) => UserQuestionAnswerReadDtoJsonDetail(
        userQuestionAnswer: json["userQuestionAnswer"] == null ? [] : List<UserQuestionAnswer>.from(json["userQuestionAnswer"]!.map((x) => UserQuestionAnswer.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "userQuestionAnswer": userQuestionAnswer == null ? [] : List<dynamic>.from(userQuestionAnswer!.map((x) => x.toMap())),
      };
}
