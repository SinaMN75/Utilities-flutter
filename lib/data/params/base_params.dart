part of "../data.dart";

class BaseParams {
  BaseParams();

  Map<String, dynamic> toMap() => <String, dynamic>{};
}

class IdParams {

  IdParams({
    required this.id,
  });

  factory IdParams.fromJson(String str) => IdParams.fromMap(json.decode(str));

  factory IdParams.fromMap(Map<String, dynamic> json) => IdParams(
        id: json["id"],
      );
  final String id;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
      };
}

class IdListParams {

  IdListParams({
    required this.ids,
  });

  factory IdListParams.fromJson(String str) => IdListParams.fromMap(json.decode(str));

  factory IdListParams.fromMap(Map<String, dynamic> json) => IdListParams(
        ids: List<String>.from(json["ids"]!.map((dynamic x) => x)),
      );
  final List<String> ids;

  String toJson() => json.encode(toIdListMap());

  Map<String, dynamic> toIdListMap() => <String, dynamic>{
        "ids": List<dynamic>.from(ids.map((String x) => x)),
      };
}
