part of "../data.dart";

class UNotificationResponse {
  UNotificationResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.userId,
    this.user,
  });

  factory UNotificationResponse.fromJson(String str) => UNotificationResponse.fromMap(json.decode(str));

  factory UNotificationResponse.fromMap(Map<String, dynamic> json) => UNotificationResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
    userId: json["userId"],
    user: json["user"] == null ? null : UUserResponse.fromMap(json["user"]),
  );
  final String id;
  final DateTime createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final String userId;
  final UUserResponse? user;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "userId": userId,
    "user": user?.toMap(),
  };
}
