part of '../data.dart';

class InstaPostReadDto {
  final List<InstagramPost>? instagramPosts;

  InstaPostReadDto({
    this.instagramPosts,
  });

  factory InstaPostReadDto.fromJson(String str) => InstaPostReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory InstaPostReadDto.fromMap(Map<String, dynamic> json) => InstaPostReadDto(
    instagramPosts: json["instagramPosts"] == null ? [] : List<InstagramPost>.from(json["instagramPosts"]!.map((x) => InstagramPost.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "instagramPosts": instagramPosts == null ? [] : List<dynamic>.from(instagramPosts!.map((x) => x.toMap())),
  };
}

class InstagramPost {
  final String? desctiption;
  final List<String>? images;

  InstagramPost({
    this.desctiption,
    this.images,
  });

  factory InstagramPost.fromJson(String str) => InstagramPost.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory InstagramPost.fromMap(Map<String, dynamic> json) => InstagramPost(
    desctiption: json["desctiption"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "desctiption": desctiption,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
  };
}