import 'dart:convert';

class UserReadParams {
  final String apiKey;
  final String token;
  final String id;

  UserReadParams({
    required this.apiKey,
    required this.token,
    required this.id,
  });

  factory UserReadParams.fromJson(String str) => UserReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserReadParams.fromMap(Map<String, dynamic> json) => UserReadParams(
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
