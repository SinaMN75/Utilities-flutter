part of "../data.dart";

class UContentCreateParams {
  UContentCreateParams({
    required this.title,
    required this.description,
    required this.subTitle,
    required this.tags,
    this.instagram,
  });

  factory UContentCreateParams.fromJson(String str) => UContentCreateParams.fromMap(json.decode(str));

  factory UContentCreateParams.fromMap(Map<String, dynamic> json) => UContentCreateParams(
    title: json["title"],
    description: json["description"],
    subTitle: json["subTitle"],
    instagram: json["instagram"],
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
  );
  final String title;
  final String description;
  final String subTitle;
  final String? instagram;
  final List<int> tags;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "title": title,
    "description": description,
    "subTitle": subTitle,
    "instagram": instagram,
    "tags": List<dynamic>.from(tags.map((dynamic x) => x)),
  };
}

class UContentUpdateParams {
  UContentUpdateParams({
    required this.id,
    this.title,
    this.subTitle,
    this.description,
    this.instagram,
    this.addTags,
    this.removeTags,
  });

  factory UContentUpdateParams.fromJson(String str) => UContentUpdateParams.fromMap(json.decode(str));

  factory UContentUpdateParams.fromMap(Map<String, dynamic> json) => UContentUpdateParams(
    id: json["id"],
    title: json["title"],
    subTitle: json["subTitle"],
    description: json["description"],
    instagram: json["instagram"],
    addTags: json["addTags"] == null ? null : List<int>.from(json["addTags"].map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? null : List<int>.from(json["removeTags"].map((dynamic x) => x)),
  );
  final String id;
  final String? title;
  final String? subTitle;
  final String? description;
  final String? instagram;
  final List<int>? addTags;
  final List<int>? removeTags;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "title": title,
    "subTitle": subTitle,
    "description": description,
    "instagram": instagram,
    "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((dynamic x) => x)),
    "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((dynamic x) => x)),
  };
}

class UContentReadParams {
  UContentReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
    this.selectorArgs,
  });

  factory UContentReadParams.fromJson(String str) => UContentReadParams.fromMap(json.decode(str));

  factory UContentReadParams.fromMap(Map<String, dynamic> json) => UContentReadParams(
    pageSize: json["pageSize"] ?? 0,
    pageNumber: json["pageNumber"] ?? 0,
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"] ?? false,
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"] ?? false,
    orderByUpdatedAt: json["orderByUpdatedAt"] ?? false,
    orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"] ?? false,
    tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
    selectorArgs: json["selectorArgs"] == null ? null : CategorySelectorArgs.fromMap(json["selectorArgs"]),
  );
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final List<int>? tags;
  final CategorySelectorArgs? selectorArgs;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "orderByUpdatedAt": orderByUpdatedAt,
    "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((dynamic x) => x)),
    "selectorArgs": selectorArgs?.toMap(),
  };
}
