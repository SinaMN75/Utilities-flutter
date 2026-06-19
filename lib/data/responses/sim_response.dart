part of "../data.dart";

class USimResponse {
  final String? id;
  final String? createdAt;
  final UBaseJson? jsonData;
  final List<int>? tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String? number;
  final String? serial;
  final String? userId;
  final UUserResponse? user;

  USimResponse({
    this.id,
    this.createdAt,
    this.jsonData,
    this.tags,
    this.creator,
    this.creatorId,
    this.number,
    this.serial,
    this.userId,
    this.user,
  });

  factory USimResponse.fromJson(String str) => USimResponse.fromJson(json.decode(str));

  String toJson() => json.encode(toJson());

  factory USimResponse.fromMap(Map<String, dynamic> json) => USimResponse(
    id: json["id"],
    createdAt: json["createdAt"],
    jsonData: json["jsonData"] == null ? null : UBaseJson.fromMap(json["jsonData"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    number: json["number"],
    serial: json["serial"],
    userId: json["userId"],
    user: json["user"] == null ? null : UUserResponse.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt,
    "jsonData": jsonData?.toJson(),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "creator": creator?.toJson(),
    "creatorId": creatorId,
    "number": number,
    "serial": serial,
    "userId": userId,
    "user": user?.toJson(),
  };
}
