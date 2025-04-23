import 'dart:convert';

abstract class BaseParams {
  final String? apiKey;
  final String? token;

  BaseParams({required this.apiKey, required this.token});

  Map<String, dynamic> toBaseMap() => {"apiKey": apiKey, "token": token};
}

abstract class BaseReadParams extends BaseParams {
  BaseReadParams({
    required super.apiKey,
    required super.token,
    this.pageSize,
    this.pageNumber,
    this.fromDate,
    this.tags,
  });

  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromDate;
  final List<int>? tags;

  Map<String, dynamic> toReadBaseMap() => {...toBaseMap()};
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

  Map<String, dynamic> toUpdateBaseMap() => {
        ...toBaseMap(),
        "id": id,
        "addTags": addTags == null ? [] : List<dynamic>.from(addTags!.map((x) => x)),
        "removeTags": removeTags == null ? [] : List<dynamic>.from(removeTags!.map((x) => x)),
      };
}

class IdParams extends BaseParams {
  final String id;

  IdParams({
    required super.apiKey,
    required super.token,
    required this.id,
  });

  factory IdParams.fromJson(String str) => IdParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IdParams.fromMap(Map<String, dynamic> json) => IdParams(
        apiKey: json["apiKey"],
        token: json["token"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        ...toBaseMap(),
        "id": id,
      };
}
