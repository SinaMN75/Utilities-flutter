part of "../data.dart";

class CategoryCreateParams extends BaseParams {
  final String title;
  final String? subtitle;
  final List<int> tags;

  CategoryCreateParams({
    required super.apiKey,
    super.token,
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
    tags: List<int>.from(json["tags"]!.map((final dynamic x) => x)),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "apiKey": apiKey,
    "token": token,
    "title": title,
    "subtitle": subtitle,
    "tags": List<dynamic>.from(tags.map((int x) => x)),
  };
}

class CategoryReadParams extends BaseReadParams {
  final List<String>? ids;
  final bool? showMedia;

  CategoryReadParams({
    required super.apiKey,
    super.token,
    super.pageSize,
    super.pageNumber,
    super.fromDate,
    super.tags,
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
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((final dynamic x) => x)),
    showMedia: json["showMedia"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    ...super.toBaseMap(),
    "apiKey": apiKey,
    "token": token,
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromDate": fromDate,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "showMedia": showMedia,
  };
}

class CategoryUpdateParams extends BaseUpdateParams {
  final String? title;
  final String? subtitle;

  CategoryUpdateParams({
    required super.apiKey,
    required super.id,
    required super.token,
    super.addTags,
    super.removeTags,
    this.title,
    this.subtitle,
  });

  factory CategoryUpdateParams.fromJson(String str) => CategoryUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryUpdateParams.fromMap(Map<String, dynamic> json) => CategoryUpdateParams(
    apiKey: json["apiKey"],
    token: json["token"],
    id: json["id"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((final dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((final dynamic x) => x)),
    title: json["title"],
    subtitle: json["subtitle"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    ...toBaseUpdateBaseMap(),
    "apiKey": apiKey,
    "token": token,
    "id": id,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "title": title,
    "subtitle": subtitle,
  };
}