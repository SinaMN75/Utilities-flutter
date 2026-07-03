part of "../data.dart";

class UBlogResponse {
  final String id;
  final DateTime createdAt;
  final UBlogJson jsonData;
  final List<int> tags;
  final UUserResponse? creator;
  final String? creatorId;
  final List<String> adminUserIds;
  final String title;
  final String? subtitle;
  final String? slug;
  final String? content;
  final int viewCount;
  final DateTime? publishedAt;
  final List<UMediaResponse>? media;
  final List<UCategoryResponse>? categories;
  final List<UCommentResponse>? comments;
  final int? commentCount;

  UBlogResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    required this.viewCount,
    this.adminUserIds = const <String>[],
    this.creator,
    this.creatorId,
    this.subtitle,
    this.slug,
    this.content,
    this.publishedAt,
    this.media,
    this.categories,
    this.comments,
    this.commentCount,
  });

  factory UBlogResponse.fromJson(String str) => UBlogResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UBlogResponse.fromMap(Map<String, dynamic> json) => UBlogResponse(
    id: json["id"] as String,
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBlogJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    adminUserIds: json["adminUserIds"] == null ? <String>[] : List<String>.from(json["adminUserIds"]!.map((dynamic x) => x)),
    title: json["title"] as String,
    subtitle: json["subtitle"],
    slug: json["slug"],
    content: json["content"],
    viewCount: json["viewCount"] ?? 0,
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
    categories: json["categories"] == null ? <UCategoryResponse>[] : List<UCategoryResponse>.from(json["categories"]!.map((dynamic x) => UCategoryResponse.fromMap(x))),
    comments: json["comments"] == null ? <UCommentResponse>[] : List<UCommentResponse>.from(json["comments"]!.map((dynamic x) => UCommentResponse.fromMap(x))),
    commentCount: json["commentCount"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<int>.from(tags.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "adminUserIds": List<String>.from(adminUserIds.map((String x) => x)),
    "title": title,
    "subtitle": subtitle,
    "slug": slug,
    "content": content,
    "viewCount": viewCount,
    "publishedAt": publishedAt?.toIso8601String(),
    "media": media == null ? <UMediaResponse>[] : List<UMediaResponse>.from(media!.map((UMediaResponse x) => x.toMap())),
    "categories": categories == null ? <UCategoryResponse>[] : List<UCategoryResponse>.from(categories!.map((UCategoryResponse x) => x.toMap())),
    "comments": comments == null ? <UCommentResponse>[] : List<UCommentResponse>.from(comments!.map((UCommentResponse x) => x.toMap())),
    "commentCount": commentCount,
  };
}

class UBlogJson {
  final String? metaTitle;
  final String? metaDescription;
  final String? source;
  final int? readingTimeMinutes;

  UBlogJson({
    this.metaTitle,
    this.metaDescription,
    this.source,
    this.readingTimeMinutes,
  });

  factory UBlogJson.fromJson(String str) => UBlogJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UBlogJson.fromMap(Map<String, dynamic> json) => UBlogJson(
    metaTitle: json["metaTitle"],
    metaDescription: json["metaDescription"],
    source: json["source"],
    readingTimeMinutes: json["readingTimeMinutes"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "metaTitle": metaTitle,
    "metaDescription": metaDescription,
    "source": source,
    "readingTimeMinutes": readingTimeMinutes,
  };
}
