part of "../data.dart";

class ULoginResponse {
  ULoginResponse({
    required this.token,
    required this.refreshToken,
    required this.expires,
    required this.user,
  });

  factory ULoginResponse.fromJson(String str) => ULoginResponse.fromMap(json.decode(str));

  factory ULoginResponse.fromMap(Map<String, dynamic> json) => ULoginResponse(
    token: json["token"],
    refreshToken: json["refreshToken"],
    expires: json["expires"],
    user: UUserResponse.fromMap(json["user"]),
  );
  final String token;
  final String refreshToken;
  final String expires;
  final UUserResponse user;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "token": token,
    "refreshToken": refreshToken,
    "expires": expires,
    "user": user.toMap(),
  };
}
