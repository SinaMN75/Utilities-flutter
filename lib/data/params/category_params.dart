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
  final String? token;
  final String title;
  final String? subtitle;
  final List<int> tags;

  CategoryCreateParams({
    required this.apiKey,
    required this.title,
    required this.tags,
    this.token,
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

class CategoryUpdateParams {
  final String apiKey;
  final String? token;
  final String id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final String? title;
  final String? subtitle;

  CategoryUpdateParams({
    required this.apiKey,
    required this.id,
    this.token,
    this.addTags,
    this.removeTags,
    this.title,
    this.subtitle,
  });

  factory CategoryUpdateParams.fromJson(String str) => CategoryUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryUpdateParams.fromMap(Map<String, dynamic> json) => CategoryUpdateParams(
    apiKey: json["apiKey"],
    token: json["token"],
    id: json["id"],
    addTags: json["addTags"] == null ? [] : List<int>.from(json["addTags"]!.map((x) => x)),
    removeTags: json["removeTags"] == null ? [] : List<int>.from(json["removeTags"]!.map((x) => x)),
    title: json["title"],
    subtitle: json["subtitle"],
  );

  Map<String, dynamic> toMap() => {
    "apiKey": apiKey,
    "token": token,
    "id": id,
    "addTags": addTags == null ? [] : List<dynamic>.from(addTags!.map((x) => x)),
    "removeTags": removeTags == null ? [] : List<dynamic>.from(removeTags!.map((x) => x)),
    "title": title,
    "subtitle": subtitle,
  };
}