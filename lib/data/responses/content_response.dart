part of "../data.dart";

extension ContentListExtension on Iterable<UContentResponse> {
  UContentResponse? firstByTag(TagContent tag) => firstWhereOrNull((final UContentResponse i) => i.tags.contains(tag.number));

  List<UContentResponse> byTag(TagContent tag) => where((final UContentResponse i) => i.tags.contains(tag.number)).toList();
}

class UContentResponse {
  UContentResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.adminUserIds,
    this.creator,
    this.creatorId,
    this.media = const <UMediaResponse>[],
  });

  factory UContentResponse.fromJson(String str) => UContentResponse.fromMap(json.decode(str));

  factory UContentResponse.fromMap(Map<String, dynamic> json) => UContentResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UContentJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"].map((dynamic x) => UMediaResponse.fromMap(x))),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    adminUserIds: json["adminUserIds"] == null ? <String>[] : List<String>.from(json["adminUserIds"]!.map((dynamic x) => x)),
  );

  final String id;
  final DateTime createdAt;
  final UContentJson jsonData;
  final List<int> tags;
  final List<UMediaResponse> media;
  final UUserResponse? creator;
  final String? creatorId;
  final List<String> adminUserIds;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "media": List<dynamic>.from(media.map((UMediaResponse x) => x.toMap())),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "adminUserIds": List<dynamic>.from(adminUserIds.map((String x) => x)),
  };
}

class UContentJson {
  UContentJson({
    this.title,
    this.detail1,
    this.detail2,
    this.link,
    this.instagram,
    this.telegram,
    this.whatsapp,
    this.phone,
    this.subTitle,
    this.description,
  });

  factory UContentJson.fromJson(String str) => UContentJson.fromMap(json.decode(str));

  factory UContentJson.fromMap(Map<String, dynamic> json) => UContentJson(
    title: json["title"],
    detail1: json["detail1"],
    detail2: json["detail2"],
    link: json["link"],
    instagram: json["instagram"],
    telegram: json["telegram"],
    whatsapp: json["whatsapp"],
    phone: json["phone"],
    subTitle: json["subTitle"],
    description: json["description"],
  );
  final String? title;
  final String? detail1;
  final String? detail2;
  final String? link;
  final String? instagram;
  final String? telegram;
  final String? whatsapp;
  final String? phone;
  final String? subTitle;
  final String? description;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "title": title,
    "detail1": detail1,
    "detail2": detail2,
    "link": link,
    "instagram": instagram,
    "telegram": telegram,
    "whatsapp": whatsapp,
    "phone": phone,
    "subTitle": subTitle,
    "description": description,
  };
}
