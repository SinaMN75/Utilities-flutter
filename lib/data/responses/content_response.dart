part of "../data.dart";

extension ContentListExtension on Iterable<UContentResponse> {
  UContentResponse? firstByTag(TagContent tag) => firstWhereOrNull((final UContentResponse i) => i.tags.contains(tag.number));

  List<UContentResponse> byTag(TagContent tag) => where((final UContentResponse i) => i.tags.contains(tag.number)).toList();
}

class UContentResponse {
  UContentResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    this.media = const <UMediaResponse>[],
  });

  factory UContentResponse.fromJson(String str) => UContentResponse.fromMap(json.decode(str));

  factory UContentResponse.fromMap(Map<String, dynamic> json) => UContentResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    jsonData: UContentJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"].map((dynamic x) => UMediaResponse.fromMap(x))),
  );
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UContentJson jsonData;
  final List<int> tags;
  final List<UMediaResponse> media;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "media": List<dynamic>.from(media.map((UMediaResponse x) => x.toMap())),
  };
}

class UContentJson {
  UContentJson({
    this.title,
    this.subTitle,
    this.description,
    this.instagram,
    this.telegram,
    this.whatsapp,
    this.phone,
  });

  factory UContentJson.fromJson(String str) => UContentJson.fromMap(json.decode(str));

  factory UContentJson.fromMap(Map<String, dynamic> json) => UContentJson(
    title: json["title"],
    subTitle: json["subTitle"],
    description: json["description"],
    instagram: json["instagram"],
    telegram: json["telegram"],
    whatsapp: json["whatsapp"],
    phone: json["phone"],
  );
  final String? title;
  final String? subTitle;
  final String? description;
  final String? instagram;
  final String? telegram;
  final String? whatsapp;
  final String? phone;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "title": title,
    "subTitle": subTitle,
    "description": description,
    "instagram": instagram,
    "telegram": telegram,
    "whatsapp": whatsapp,
    "phone": phone,
  };
}
