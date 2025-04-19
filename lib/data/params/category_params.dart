import 'dart:convert';

class CategoryReadParams {
  final String? apiKey;
  final String? token;
  final int? pageSize;
  final int? pageNumber;
  final String? fromDate;
  final List<int>? tags;
  final List<String>? ids;
  final bool? showMedia;

  CategoryReadParams({
    this.apiKey,
    this.token,
    this.pageSize,
    this.pageNumber,
    this.fromDate,
    this.tags,
    this.ids,
    this.showMedia,
  });

  factory CategoryReadParams.fromJson(String str) => CategoryReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryReadParams.fromMap(Map<String, dynamic> json) => CategoryReadParams(
    apiKey: json["apiKey"],
    token: json["token"],
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromDate: json["fromDate"],
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
    ids: json["ids"] == null ? [] : List<String>.from(json["ids"]!.map((x) => x)),
    showMedia: json["showMedia"],
  );

  Map<String, dynamic> toMap() => {
    "apiKey": apiKey,
    "token": token,
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromDate": fromDate,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "ids": ids == null ? [] : List<dynamic>.from(ids!.map((x) => x)),
    "showMedia": showMedia,
  };
}

class CategoryCreateParams {
  final String apiKey;
  final String token;
  final String title;
  final String? subtitle;
  final List<int> tags;

  CategoryCreateParams({
    required this.apiKey,
    required this.token,
    required this.title,
    required this.tags,
    this.subtitle,
  });

  factory CategoryCreateParams.fromJson(String str) => CategoryCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryCreateParams.fromMap(Map<String, dynamic> json) => CategoryCreateParams(
    apiKey: json["apiKey"],
    token: json["token"],
    title: json["title"],
    subtitle: json["subtitle"],
    tags: List<int>.from(json["tags"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "apiKey": apiKey,
    "token": token,
    "title": title,
    "subtitle": subtitle,
    "tags": List<dynamic>.from(tags.map((x) => x)),
  };
}
