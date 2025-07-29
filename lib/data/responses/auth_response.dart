part of "../data.dart";

class LoginResponse {
  final String token;
  final String refreshToken;
  final String expires;
  final UserResponse user;

  LoginResponse({
    required this.token,
    required this.refreshToken,
    required this.expires,
    required this.user,
  });

  factory LoginResponse.fromJson(String str) => LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        refreshToken: json["refreshToken"],
        expires: json["expires"],
        user: UserResponse.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "token": token,
        "refreshToken": refreshToken,
        "expires": expires,
        "user": user.toMap(),
      };
}
