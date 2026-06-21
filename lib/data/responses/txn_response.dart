part of "../data.dart";

class UTxnResponse {
  UTxnResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.amount,
    this.trackingNumber,
    this.userId,
    this.user,
  });

  factory UTxnResponse.fromMap(Map<String, dynamic> json) => UTxnResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UTxnJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]),
    amount: json["amount"].toString().toDouble(),
    trackingNumber: json["trackingNumber"],
    userId: json["userId"],
    user: json["user"] == null ? null : UUserResponse.fromMap(json["user"]),
  );

  final String id;
  final DateTime createdAt;
  final UTxnJson jsonData;
  final List<int> tags;
  final double amount;
  final String? trackingNumber;
  final String? userId;
  final UUserResponse? user;

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": tags,
    "amount": amount,
    "trackingNumber": trackingNumber,
    "userId": userId,
    "user": user?.toMap(),
  };
}

class UTxnJson {
  UTxnJson({
    required this.status,
    this.referenceId,
    this.gateway,
    this.description,
  });

  factory UTxnJson.fromMap(Map<String, dynamic> json) => UTxnJson(
    status: json["status"],
    referenceId: json["referenceId"],
    gateway: json["gateway"],
    description: json["description"],
  );

  final String status;
  final String? referenceId;
  final String? gateway;
  final String? description;

  Map<String, dynamic> toMap() => <String, dynamic>{
    "status": status,
    "referenceId": referenceId,
    "gateway": gateway,
    "description": description,
  };
}
