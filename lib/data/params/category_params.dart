import 'dart:convert';

import 'package:u/data/params/base_params.dart';

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
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
    ids: json["ids"] == null ? [] : List<String>.from(json["ids"]!.map((x) => x)),
    showMedia: json["showMedia"],
  );

  Map<String, dynamic> toMap() => {
    ...super.toBaseMap(),
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
    addTags: json["addTags"] == null ? [] : List<int>.from(json["addTags"]!.map((x) => x)),
    removeTags: json["removeTags"] == null ? [] : List<int>.from(json["removeTags"]!.map((x) => x)),
    title: json["title"],
    subtitle: json["subtitle"],
  );

  Map<String, dynamic> toMap() => {
    ...toUpdateBaseMap(),
    "apiKey": apiKey,
    "token": token,
    "id": id,
    "addTags": addTags == null ? [] : List<dynamic>.from(addTags!.map((x) => x)),
    "removeTags": removeTags == null ? [] : List<dynamic>.from(removeTags!.map((x) => x)),
    "title": title,
    "subtitle": subtitle,
  };
}