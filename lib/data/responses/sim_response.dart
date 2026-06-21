part of "../data.dart";

class USimResponse {
  final String id;
  final String createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String number;
  final String? serial;
  final String userId;
  final UUserResponse? user;

  USimResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.number,
    required this.userId,
    this.creator,
    this.creatorId,
    this.serial,
    this.user,
  });

  factory USimResponse.fromJson(String str) => USimResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory USimResponse.fromMap(Map<String, dynamic> json) => USimResponse(
    id: json["id"] as String,
    createdAt: json["createdAt"] as String,
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    number: json["number"] as String,
    serial: json["serial"],
    userId: json["userId"] as String,
    user: json["user"] == null ? null : UUserResponse.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt,
    "jsonData": jsonData.toJson(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "creator": creator?.toJson(),
    "creatorId": creatorId,
    "number": number,
    "serial": serial,
    "userId": userId,
    "user": user?.toJson(),
  };
}
