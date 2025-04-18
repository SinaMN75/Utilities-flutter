import 'dart:convert';

import 'package:u/data/responses/media.dart';

class CategoryResponse {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final List<int>? tags;
  final CategoryJsonData? jsonData;
  final String? title;
  final List<String>? children;
  final List<MediaResponse>? media;

  CategoryResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.tags,
    this.jsonData,
    this.title,
    this.children,
    this.media,
  });

  factory CategoryResponse.fromJson(String str) => CategoryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryResponse.fromMap(Map<String, dynamic> json) => CategoryResponse(
    id: json["id"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
    jsonData: json["jsonData"] == null ? null : CategoryJsonData.fromMap(json["jsonData"]),
    title: json["title"],
    children: json["children"] == null ? [] : List<String>.from(json["children"]!.map((x) => x)),
    media: json["media"] == null ? [] : List<MediaResponse>.from(json["media"]!.map((x) => MediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "jsonData": jsonData?.toMap(),
    "title": title,
    "children": children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
    "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toMap())),
  };
}

class CategoryJsonData {
  final String? subtitle;

  CategoryJsonData({
    this.subtitle,
  });

  factory CategoryJsonData.fromJson(String str) => CategoryJsonData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryJsonData.fromMap(Map<String, dynamic> json) => CategoryJsonData(
    subtitle: json["subtitle"],
  );

  Map<String, dynamic> toMap() => {
    "subtitle": subtitle,
  };
}