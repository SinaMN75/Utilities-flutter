part of "../data.dart";

class UWalletResponse {
  final String id;
  final List<int> tags;
  final UGeneralJson jsonData;
  final DateTime? createdAt;
  final DateTime? deletedAt;
  final double balance;
  final UUserResponse? user;
  final String userId;

  UWalletResponse({
    required this.id,
    required this.tags,
    required this.jsonData,
    required this.balance,
    required this.userId,
    this.createdAt,
    this.deletedAt,
    this.user,
  });

  factory UWalletResponse.fromJson(String str) => UWalletResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UWalletResponse.fromMap(Map<String, dynamic> json) => UWalletResponse(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
    jsonData: UGeneralJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    balance: json["balance"].toString().toDouble(),
    user: json["user"] == null ? null : UUserResponse.fromMap(json["user"]),
    userId: json["userId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "deletedAt": deletedAt?.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "balance": balance,
    "user": user?.toMap(),
    "userId": userId,
  };
}

class UWalletTxnResponse {
  final String id;
  final List<int> tags;
  final UGeneralJson jsonData;
  final DateTime createdAt;
  final DateTime? deletedAt;
  final double? amount;
  final UUserResponse? sender;
  final String? senderId;
  final UUserResponse? receiver;
  final String? receiverId;

  UWalletTxnResponse({
    required this.id,
    required this.tags,
    required this.jsonData,
    required this.createdAt,
    this.deletedAt,
    this.amount,
    this.sender,
    this.senderId,
    this.receiver,
    this.receiverId,
  });

  factory UWalletTxnResponse.fromJson(String str) => UWalletTxnResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UWalletTxnResponse.fromMap(Map<String, dynamic> json) => UWalletTxnResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
    jsonData: UGeneralJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    amount: json["amount"].toString().toDouble(),
    sender: json["sender"] == null ? null : UUserResponse.fromMap(json["sender"]),
    senderId: json["senderId"],
    receiver: json["receiver"] == null ? null : UUserResponse.fromMap(json["receiver"]),
    receiverId: json["receiverId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "deletedAt": deletedAt?.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "amount": amount,
    "sender": sender?.toMap(),
    "senderId": senderId,
    "receiver": receiver?.toMap(),
    "receiverId": receiverId,
  };
}
