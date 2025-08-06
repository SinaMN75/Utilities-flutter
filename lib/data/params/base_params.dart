part of "../data.dart";

class BaseParams {
  final String? token;

  BaseParams({required this.token});

  Map<String, dynamic> toMap() => <String, dynamic>{"token": token};
}

class IdParams {
  final String id;
  final String? token;

  IdParams({
    this.token,
    required this.id,
  });

  factory IdParams.fromJson(String str) => IdParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IdParams.fromMap(Map<String, dynamic> json) => IdParams(
        token: json["token"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "token": token,
      };
}

class IdListParams {
  final List<String> ids;
  final String? token;

  IdListParams({
    this.token,
    required this.ids,
  });

  factory IdListParams.fromJson(String str) => IdListParams.fromMap(json.decode(str));

  String toJson() => json.encode(toIdListMap());

  factory IdListParams.fromMap(Map<String, dynamic> json) => IdListParams(
        token: json["token"],
        ids: List<String>.from(json["ids"]!.map((dynamic x) => x)),
      );

  Map<String, dynamic> toIdListMap() => <String, dynamic>{
        "ids": List<dynamic>.from(ids.map((String x) => x)),
        "token": token,
      };
}
