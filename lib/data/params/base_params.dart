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

  Map<String, dynamic> toBaseReadMap() => {...toBaseMap()};
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
