part of "../data.dart";

class UContentCreateParams {
  UContentCreateParams({
    required this.tags,
    required this.title,
    this.link,
    this.detail1,
    this.detail2,
    this.instagram,
    this.id,
    this.creatorId,
    this.adminUserIds,
    this.description,
    this.subTitle,
    this.telegram,
    this.whatsapp,
    this.phone,
  });

  factory UContentCreateParams.fromJson(String str) => UContentCreateParams.fromMap(json.decode(str));

  factory UContentCreateParams.fromMap(Map<String, dynamic> json) => UContentCreateParams(
    title: json["title"] as String,
    detail1: json["detail1"],
    link: json["link"],
    detail2: json["detail2"],
    instagram: json["instagram"],
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
    id: json["id"],
    creatorId: json["creatorId"],
    adminUserIds: json["adminUserIds"] == null ? <String>[] : List<String>.from(json["adminUserIds"]!.map((dynamic x) => x)),
    description: json["description"],
    subTitle: json["subTitle"],
    telegram: json["telegram"],
    whatsapp: json["whatsapp"],
    phone: json["phone"],
  );
  final String title;
  final String? link;
  final String? detail1;
  final String? detail2;
  final String? instagram;
  final List<int> tags;
  final String? id;
  final String? creatorId;
  final List<String>? adminUserIds;
  final String? description;
  final String? subTitle;
  final String? telegram;
  final String? whatsapp;
  final String? phone;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "title": title,
    "link": link,
    "detail1": detail1,
    "detail2": detail2,
    "instagram": instagram,
    "tags": List<dynamic>.from(tags.map((dynamic x) => x)),
    "id": id,
    "creatorId": creatorId,
    "adminUserIds": adminUserIds == null ? <dynamic>[] : List<dynamic>.from(adminUserIds!.map((String x) => x)),
    "description": description,
    "subTitle": subTitle,
    "telegram": telegram,
    "whatsapp": whatsapp,
    "phone": phone,
  };
}

class UContentUpdateParams {
  UContentUpdateParams({
    required this.id,
    this.title,
    this.detail1,
    this.link,
    this.detail2,
    this.instagram,
    this.addTags,
    this.removeTags,
    this.tags,
    this.adminUserIds,
    this.addAdminUserIds,
    this.removeAdminUserIds,
    this.description,
    this.subTitle,
    this.telegram,
    this.whatsapp,
    this.phone,
  });

  factory UContentUpdateParams.fromJson(String str) => UContentUpdateParams.fromMap(json.decode(str));

  factory UContentUpdateParams.fromMap(Map<String, dynamic> json) => UContentUpdateParams(
    id: json["id"],
    title: json["title"],
    link: json["link"],
    detail1: json["detail1"],
    detail2: json["detail2"],
    instagram: json["instagram"],
    addTags: json["addTags"] == null ? null : List<int>.from(json["addTags"].map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? null : List<int>.from(json["removeTags"].map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    adminUserIds: json["adminUserIds"] == null ? <String>[] : List<String>.from(json["adminUserIds"]!.map((dynamic x) => x)),
    addAdminUserIds: json["addAdminUserIds"] == null ? <String>[] : List<String>.from(json["addAdminUserIds"]!.map((dynamic x) => x)),
    removeAdminUserIds: json["removeAdminUserIds"] == null ? <String>[] : List<String>.from(json["removeAdminUserIds"]!.map((dynamic x) => x)),
    description: json["description"],
    subTitle: json["subTitle"],
    telegram: json["telegram"],
    whatsapp: json["whatsapp"],
    phone: json["phone"],
  );
  final String id;
  final String? title;
  final String? link;
  final String? detail1;
  final String? detail2;
  final String? instagram;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final List<String>? adminUserIds;
  final List<String>? addAdminUserIds;
  final List<String>? removeAdminUserIds;
  final String? description;
  final String? subTitle;
  final String? telegram;
  final String? whatsapp;
  final String? phone;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "title": title,
    "link": link,
    "detail1": detail1,
    "detail2": detail2,
    "instagram": instagram,
    "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((dynamic x) => x)),
    "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((dynamic x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "adminUserIds": adminUserIds == null ? <dynamic>[] : List<dynamic>.from(adminUserIds!.map((String x) => x)),
    "addAdminUserIds": addAdminUserIds == null ? <dynamic>[] : List<dynamic>.from(addAdminUserIds!.map((String x) => x)),
    "removeAdminUserIds": removeAdminUserIds == null ? <dynamic>[] : List<dynamic>.from(removeAdminUserIds!.map((String x) => x)),
    "description": description,
    "subTitle": subTitle,
    "telegram": telegram,
    "whatsapp": whatsapp,
    "phone": phone,
  };
}

class UContentReadParams {
  UContentReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.tags,
    this.selectorArgs,
    this.orderBy,
    this.ids,
    this.creatorId,
  });

  factory UContentReadParams.fromJson(String str) => UContentReadParams.fromMap(json.decode(str));

  factory UContentReadParams.fromMap(Map<String, dynamic> json) => UContentReadParams(
    pageSize: json["pageSize"] ?? 0,
    pageNumber: json["pageNumber"] ?? 0,
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
    selectorArgs: json["selectorArgs"] == null ? null : ContentSelectorArgs.fromMap(json["selectorArgs"]),
    orderBy: json["orderBy"],
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    creatorId: json["creatorId"],
  );
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final List<int>? tags;
  final ContentSelectorArgs? selectorArgs;
  final int? orderBy;
  final List<String>? ids;
  final String? creatorId;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((dynamic x) => x)),
    "selectorArgs": selectorArgs?.toMap(),
    "orderBy": orderBy,
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "creatorId": creatorId,
  };
}
