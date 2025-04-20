import 'dart:convert';

abstract class BaseParams {
  final String? apiKey;
  final String? token;

  BaseParams({required this.apiKey, required this.token});

  Map<String, dynamic> toBaseMap() => {"apiKey": apiKey, "token": token};
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
