part of "../data.dart";

abstract class BaseParams {
  final String apiKey;
  final String? token;

  BaseParams({required this.apiKey, required this.token});

  Map<String, dynamic> toBaseMap() => <String, dynamic>{"apiKey": apiKey, "token": token};
}

abstract class BaseReadParams extends BaseParams {
  BaseReadParams({
    required super.apiKey,
    required super.token,
    this.pageSize = 100,
    this.pageNumber = 1,
    this.fromDate,
    this.tags,
  });

  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromDate;
  final List<int>? tags;

  Map<String, dynamic> toBaseReadMap() => <String, dynamic>{...toBaseMap(), "pageSize": pageSize, "pageNumber": pageNumber};
}

abstract class BaseUpdateParams extends BaseParams {
  BaseUpdateParams({
    required this.id,
    required super.apiKey,
    required super.token,
    this.addTags,
    this.removeTags,
  });

  final List<int>? addTags;
  final List<int>? removeTags;
  final String id;

  Map<String, dynamic> toBaseUpdateBaseMap() => <String, dynamic>{
        ...toBaseMap(),
        "id": id,
        "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
        "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
      };
}

class IdParams extends BaseParams {
  final String id;

  IdParams({
    required super.apiKey,
    super.token,
    required this.id,
  });

  factory IdParams.fromJson(String str) => IdParams.fromMap(json.decode(str));

  String toJson() => json.encode(toIdParamMap());

  factory IdParams.fromMap(Map<String, dynamic> json) => IdParams(
        apiKey: json["apiKey"],
        token: json["token"],
        id: json["id"],
      );

  Map<String, dynamic> toIdParamMap() => <String, dynamic>{
        ...toBaseMap(),
        "id": id,
      };
}

class IdListParams extends BaseParams {
  final List<String> ids;

  IdListParams({
    required super.apiKey,
    required super.token,
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
        ...toBaseMap(),
        "ids": List<dynamic>.from(ids.map((String x) => x)),
      };
}
