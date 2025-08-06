part of "../data.dart";

class BaseParams {
  BaseParams();

  Map<String, dynamic> toMap() => <String, dynamic>{};
}

class IdParams {
  final String id;

  IdParams({
    required this.id,
  });

  factory IdParams.fromJson(String str) => IdParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IdParams.fromMap(Map<String, dynamic> json) => IdParams(
        id: json["id"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
      };
}

class IdListParams {
  final List<String> ids;

  IdListParams({
    required this.ids,
  });

  factory IdListParams.fromJson(String str) => IdListParams.fromMap(json.decode(str));

  String toJson() => json.encode(toIdListMap());

  factory IdListParams.fromMap(Map<String, dynamic> json) => IdListParams(
        ids: List<String>.from(json["ids"]!.map((dynamic x) => x)),
      );

  Map<String, dynamic> toIdListMap() => <String, dynamic>{
        "ids": List<dynamic>.from(ids.map((String x) => x)),
      };
}
