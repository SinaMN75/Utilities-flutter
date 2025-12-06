part of "../data.dart";

class UChatBotResponse {
  final String? userId;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UChatBotResponseJsonData? jsonData;
  final List<int>? tags;

  UChatBotResponse({
    this.userId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.jsonData,
    this.tags,
  });

  factory UChatBotResponse.fromJson(String str) => UChatBotResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UChatBotResponse.fromMap(Map<String, dynamic> json) => UChatBotResponse(
    userId: json["userId"],
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    jsonData: json["jsonData"] == null ? null : UChatBotResponseJsonData.fromMap(json["jsonData"]),
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

class UChatBotResponseJsonData {
  final List<UChatBotResponseHistory>? history;

  UChatBotResponseJsonData({
    this.history,
  });

  factory UChatBotResponseJsonData.fromJson(String str) => UChatBotResponseJsonData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UChatBotResponseJsonData.fromMap(Map<String, dynamic> json) => UChatBotResponseJsonData(
    history: json["history"] == null ? <UChatBotResponseHistory>[] : List<UChatBotResponseHistory>.from(json["history"]!.map((dynamic x) => UChatBotResponseHistory.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "history": history == null ? <dynamic>[] : List<dynamic>.from(history!.map((UChatBotResponseHistory x) => x.toMap())),
  };
}

class UChatBotResponseHistory {
  final String? user;
  final String? bot;

  UChatBotResponseHistory({
    this.user,
    this.bot,
  });

  factory UChatBotResponseHistory.fromJson(String str) => UChatBotResponseHistory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UChatBotResponseHistory.fromMap(Map<String, dynamic> json) => UChatBotResponseHistory(
    user: json["user"],
    bot: json["bot"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "user": user,
    "bot": bot,
  };
}
