part of "../data.dart";

class UChatBotCreateParams {
  final String? apiKey;
  final String? token;
  final String? locale;
  final String? message;
  final List<int>? tags;
  final String? chatId;

  UChatBotCreateParams({
    this.apiKey,
    this.token,
    this.locale,
    this.message,
    this.tags,
    this.chatId,
  });

  factory UChatBotCreateParams.fromJson(String str) => UChatBotCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UChatBotCreateParams.fromMap(Map<String, dynamic> json) => UChatBotCreateParams(
    apiKey: json["apiKey"],
    token: json["token"],
    locale: json["locale"],
    message: json["message"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    chatId: json["chatId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "apiKey": apiKey,
    "token": token,
    "locale": locale,
    "message": message,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "chatId": chatId,
  };
}

class UChatBotReadParams {
  final String? apiKey;
  final String? token;
  final String? locale;
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? userId;

  UChatBotReadParams({
    this.apiKey,
    this.token,
    this.locale,
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
    this.ids,
    this.userId,
  });

  factory UChatBotReadParams.fromJson(String str) => UChatBotReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UChatBotReadParams.fromMap(Map<String, dynamic> json) => UChatBotReadParams(
    apiKey: json["apiKey"],
    token: json["token"],
    locale: json["locale"],
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    orderByUpdatedAt: json["orderByUpdatedAt"],
    orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    userId: json["userId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "apiKey": apiKey,
    "token": token,
    "locale": locale,
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "orderByUpdatedAt": orderByUpdatedAt,
    "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "userId": userId,
  };
}
