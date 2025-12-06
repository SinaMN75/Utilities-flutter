part of "../data.dart";

class UChatBotResponse {
  final Result? result;
  final int? status;
  final String? message;

  UChatBotResponse({
    this.result,
    this.status,
    this.message,
  });

  factory UChatBotResponse.fromJson(String str) => UChatBotResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UChatBotResponse.fromMap(Map<String, dynamic> json) => UChatBotResponse(
    result: json["result"] == null ? null : Result.fromMap(json["result"]),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "result": result?.toMap(),
    "status": status,
    "message": message,
  };
}

class Result {
  final String? userId;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final JsonData? jsonData;
  final List<int>? tags;

  Result({
    this.userId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.jsonData,
    this.tags,
  });

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    userId: json["userId"],
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    jsonData: json["jsonData"] == null ? null : JsonData.fromMap(json["jsonData"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userId": userId,
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "jsonData": jsonData?.toMap(),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
  };
}

class JsonData {
  final List<History>? history;

  JsonData({
    this.history,
  });

  factory JsonData.fromJson(String str) => JsonData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JsonData.fromMap(Map<String, dynamic> json) => JsonData(
    history: json["history"] == null ? <History>[] : List<History>.from(json["history"]!.map((dynamic x) => History.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "history": history == null ? <dynamic>[] : List<dynamic>.from(history!.map((History x) => x.toMap())),
  };
}

class History {
  final String? user;
  final String? bot;

  History({
    this.user,
    this.bot,
  });

  factory History.fromJson(String str) => History.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory History.fromMap(Map<String, dynamic> json) => History(
    user: json["user"],
    bot: json["bot"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "user": user,
    "bot": bot,
  };
}
