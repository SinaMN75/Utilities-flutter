part of "../data.dart";

class ContentCreateParams {
  final String title;
  final String description;
  final String subTitle;
  final String? instagram;
  final List<int> tags;
  final String? apiKey;
  final String? token;

  ContentCreateParams({
    required this.title,
    required this.description,
    required this.subTitle,
    this.instagram,
    required this.tags,
    this.apiKey,
    this.token,
  });

  factory ContentCreateParams.fromJson(String str) => ContentCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentCreateParams.fromMap(Map<String, dynamic> json) => ContentCreateParams(
    title: json["title"],
    description: json["description"],
    subTitle: json["subTitle"],
    instagram: json["instagram"],
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
    apiKey: json["apiKey"],
    token: json["token"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "title": title,
    "description": description,
    "subTitle": subTitle,
    "instagram": instagram,
    "tags": List<dynamic>.from(tags.map((dynamic x) => x)),
    "apiKey": apiKey,
    "token": token,
  };
}

class ContentUpdateParams {
  final String id;
  final String? title;
  final String? subTitle;
  final String? description;
  final String? instagram;
  final List<int>? addTags;
  final List<int>? removeTags;
  final String? apiKey;
  final String? token;

  ContentUpdateParams({
    required this.id,
    this.title,
    this.subTitle,
    this.description,
    this.instagram,
    this.addTags,
    this.removeTags,
    this.apiKey,
    this.token,
  });

  factory ContentUpdateParams.fromJson(String str) => ContentUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentUpdateParams.fromMap(Map<String, dynamic> json) => ContentUpdateParams(
    id: json["id"],
    title: json["title"],
    subTitle: json["subTitle"],
    description: json["description"],
    instagram: json["instagram"],
    addTags: json["addTags"] == null ? null : List<int>.from(json["addTags"].map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? null : List<int>.from(json["removeTags"].map((dynamic x) => x)),
    apiKey: json["apiKey"],
    token: json["token"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "title": title,
    "subTitle": subTitle,
    "description": description,
    "instagram": instagram,
    "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((dynamic x) => x)),
    "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((dynamic x) => x)),
    "apiKey": apiKey,
    "token": token,
  };
}

class ContentReadParams {
  final bool? showMedia;
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final List<int>? tags;
  final String? apiKey;
  final String? token;

  ContentReadParams({
    this.showMedia,
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
    this.apiKey,
    this.token,
  });

  factory ContentReadParams.fromJson(String str) => ContentReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentReadParams.fromMap(Map<String, dynamic> json) => ContentReadParams(
    showMedia: json["showMedia"] ?? false,
    pageSize: json["pageSize"] ?? 0,
    pageNumber: json["pageNumber"] ?? 0,
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"] ?? false,
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"] ?? false,
    orderByUpdatedAt: json["orderByUpdatedAt"] ?? false,
    orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"] ?? false,
    tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
    apiKey: json["apiKey"],
    token: json["token"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "showMedia": showMedia,
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "orderByUpdatedAt": orderByUpdatedAt,
    "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((dynamic x) => x)),
    "apiKey": apiKey,
    "token": token,
  };
}
