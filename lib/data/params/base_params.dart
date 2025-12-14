part of "../data.dart";

class UBaseParams {
  UBaseParams();

  Map<String, dynamic> toMap() => <String, dynamic>{};
}

class UIdParams {
  UIdParams({
    required this.id,
  });

  factory UIdParams.fromJson(String str) => UIdParams.fromMap(json.decode(str));

  factory UIdParams.fromMap(Map<String, dynamic> json) => UIdParams(
    id: json["id"],
  );
  final String id;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
  };
}

class UIdListParams {
  UIdListParams({
    required this.ids,
  });

  factory UIdListParams.fromJson(String str) => UIdListParams.fromMap(
    json.decode(str),
  );

  factory UIdListParams.fromMap(Map<String, dynamic> json) => UIdListParams(
    ids: List<String>.from(json["ids"]!.map((dynamic x) => x)),
  );
  final List<String> ids;

  String toJson() => json.encode(toIdListMap());

  Map<String, dynamic> toIdListMap() => <String, dynamic>{
    "ids": List<dynamic>.from(ids.map((String x) => x)),
  };
}
