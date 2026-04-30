part of "../data.dart";

class UNotificationResponse {
  UNotificationResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    this.media = const <UMediaResponse>[],
  });

  factory UNotificationResponse.fromJson(String str) => UNotificationResponse.fromMap(json.decode(str));

  factory UNotificationResponse.fromMap(Map<String, dynamic> json) => UNotificationResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"].map((dynamic x) => UMediaResponse.fromMap(x))),
  );
  final String id;
  final DateTime createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final List<UMediaResponse> media;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "media": List<dynamic>.from(media.map((UMediaResponse x) => x.toMap())),
  };
}
