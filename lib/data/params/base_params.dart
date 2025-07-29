part of "../data.dart";

class BaseParams {
  final String apiKey;
  final String? token;

  BaseParams({required this.apiKey, required this.token});

  Map<String, dynamic> toMap() => <String, dynamic>{"apiKey": apiKey, "token": token};
}

class IdParams {
  final String id;
  final String apiKey;
  final String? token;

  IdParams({
    required this.apiKey,
    this.token,
    required this.id,
  });

  factory IdParams.fromJson(String str) => IdParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IdParams.fromMap(Map<String, dynamic> json) => IdParams(
        apiKey: json["apiKey"],
        token: json["token"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "apiKey": apiKey,
        "token": token,
      };
}

class IdListParams {
  final List<String> ids;
  final String apiKey;
  final String? token;

  IdListParams({
    required this.apiKey,
    this.token,
    required this.ids,
  });

  factory IdListParams.fromJson(String str) => IdListParams.fromMap(json.decode(str));

  String toJson() => json.encode(toIdListMap());

  factory IdListParams.fromMap(Map<String, dynamic> json) => IdListParams(
        apiKey: json["apiKey"],
        token: json["token"],
        ids: List<String>.from(json["ids"]!.map((dynamic x) => x)),
      );

  Map<String, dynamic> toIdListMap() => <String, dynamic>{
        "ids": List<dynamic>.from(ids.map((String x) => x)),
        "apiKey": apiKey,
        "token": token,
      };
}
