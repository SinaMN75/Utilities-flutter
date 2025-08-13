part of "../data.dart";

class LoginResponse {

  LoginResponse({
    required this.token,
    required this.refreshToken,
    required this.expires,
    required this.user,
  });

  factory LoginResponse.fromJson(String str) => LoginResponse.fromMap(json.decode(str));

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        refreshToken: json["refreshToken"],
        expires: json["expires"],
        user: UserResponse.fromMap(json["user"]),
      );
  final String token;
  final String refreshToken;
  final String expires;
  final UserResponse user;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "token": token,
        "refreshToken": refreshToken,
        "expires": expires,
        "user": user.toMap(),
      };
}
