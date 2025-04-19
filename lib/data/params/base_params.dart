import 'dart:convert';

class IdParams {
  final String apiKey;
  final String token;
  final String id;

  IdParams({
    required this.apiKey,
    required this.token,
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
    "apiKey": apiKey,
    "token": token,
    "id": id,
  };
}