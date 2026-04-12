part of "../data.dart";

class UBaseParams {
  UBaseParams();

  Map<String, dynamic> toMap() => <String, dynamic>{};
}

class UIdParams {
  UIdParams({
    required this.id,
    this.selectorArgs,
  });

  final String id;
  final dynamic selectorArgs;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "selectorArgs": selectorArgs.toMap(),
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
