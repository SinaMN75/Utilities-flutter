part of '../data.dart';

class QuestionCreateDto {
  final String question;
  final List<AnswerDetail> answers;
  final List<int> tags;
  final List<String> categories;

  QuestionCreateDto({
    required this.question,
    required this.answers,
    required this.tags,
    required this.categories,
  });

  factory QuestionCreateDto.fromJson(String str) => QuestionCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionCreateDto.fromMap(dynamic json) => QuestionCreateDto(
        question: json["question"],
        answers: List<AnswerDetail>.from(json["answers"].map((x) => AnswerDetail.fromMap(x))),
        tags: List<int>.from(json["tags"].map((x) => x)),
        categories: List<String>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x.toMap())),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => x)),
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

  String toJson() => json.encode(toMap());

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
  final List<String>? categories;
  final List<int>? tags;

  QuestionFilterDto({
    this.pageSize,
    this.pageNumber,
    this.fromDate,
    this.categories,
    this.tags,
  });

  factory QuestionFilterDto.fromJson(String str) => QuestionFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionFilterDto.fromMap(Map<String, dynamic> json) => QuestionFilterDto(
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        fromDate: json["fromDate"],
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "fromDate": fromDate,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
      };
}

class QuestionReadDto {
  final String id;
  final String createdAt;
  final String updatedAt;
  final QuestionJsonDetail jsonDetail;
  final List<int> tags;
  final List<CategoryReadDto> categories;

  QuestionReadDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonDetail,
    required this.tags,
    required this.categories,
  });

  factory QuestionReadDto.fromJson(String str) => QuestionReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionReadDto.fromMap(Map<String, dynamic> json) => QuestionReadDto(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        jsonDetail: QuestionJsonDetail.fromMap(json["jsonDetail"]),
        tags: List<int>.from(json["tags"].map((x) => x)),
        categories: List<CategoryReadDto>.from(json["categories"].map((x) => CategoryReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "jsonDetail": jsonDetail.toMap(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
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

  String toJson() => json.encode(toMap());

  factory QuestionJsonDetail.fromMap(Map<String, dynamic> json) => QuestionJsonDetail(
        question: json["question"],
        answers: List<AnswerDetail>.from(json["answers"].map((x) => AnswerDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x.toMap())),
      };
}
