part of "../data.dart";

class RefreshTokenParams {
  final String refreshToken;
  final String apiKey;
  final String? token;

  RefreshTokenParams({
    required this.refreshToken,
    required this.apiKey,
    this.token,
  });

  factory RefreshTokenParams.fromJson(String str) => RefreshTokenParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RefreshTokenParams.fromMap(Map<String, dynamic> json) => RefreshTokenParams(
        refreshToken: json["refreshToken"],
        apiKey: json["apiKey"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "refreshToken": refreshToken,
        "apiKey": apiKey,
        "token": token,
      };
}

class GetMobileVerificationCodeForLoginParams {
  final String phoneNumber;
  final String apiKey;
  final String? token;

  GetMobileVerificationCodeForLoginParams({
    required this.phoneNumber,
    required this.apiKey,
    this.token,
  });

  factory GetMobileVerificationCodeForLoginParams.fromJson(String str) => GetMobileVerificationCodeForLoginParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMobileVerificationCodeForLoginParams.fromMap(Map<String, dynamic> json) => GetMobileVerificationCodeForLoginParams(
        phoneNumber: json["phoneNumber"],
        apiKey: json["apiKey"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "phoneNumber": phoneNumber,
        "apiKey": apiKey,
        "token": token,
      };
}

class LoginWithEmailPasswordParams {
  final String email;
  final String password;
  final String apiKey;
  final String? token;

  LoginWithEmailPasswordParams({
    required this.email,
    required this.password,
    required this.apiKey,
    this.token,
  });

  factory LoginWithEmailPasswordParams.fromJson(String str) => LoginWithEmailPasswordParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginWithEmailPasswordParams.fromMap(Map<String, dynamic> json) => LoginWithEmailPasswordParams(
        email: json["email"],
        password: json["password"],
        apiKey: json["apiKey"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "email": email,
        "password": password,
        "apiKey": apiKey,
        "token": token,
      };
}

class LoginWithUserNamePasswordParams {
  final String userName;
  final String password;
  final String apiKey;
  final String? token;

  LoginWithUserNamePasswordParams({
    required this.userName,
    required this.password,
    required this.apiKey,
    this.token,
  });

  factory LoginWithUserNamePasswordParams.fromJson(String str) => LoginWithUserNamePasswordParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginWithUserNamePasswordParams.fromMap(Map<String, dynamic> json) => LoginWithUserNamePasswordParams(
        userName: json["userName"],
        password: json["password"],
        apiKey: json["apiKey"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "userName": userName,
        "password": password,
        "apiKey": apiKey,
        "token": token,
      };
}

class RegisterParams {
  final String userName;
  final String? email;
  final String? phoneNumber;
  final String password;
  final String? firstName;
  final String? lastName;
  final List<int> tags;
  final String apiKey;
  final String? token;

  RegisterParams({
    required this.userName,
    this.email,
    this.phoneNumber,
    required this.password,
    this.firstName,
    this.lastName,
    required this.tags,
    required this.apiKey,
    this.token,
  });

  factory RegisterParams.fromJson(String str) => RegisterParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterParams.fromMap(Map<String, dynamic> json) => RegisterParams(
        userName: json["userName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        apiKey: json["apiKey"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "userName": userName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "tags": List<dynamic>.from(tags.map((int x) => x)),
        "apiKey": apiKey,
        "token": token,
      };
}

class VerifyMobileForLoginParams {
  final String phoneNumber;
  final String otp;
  final String? firstName;
  final String? lastName;
  final String apiKey;
  final String? token;

  VerifyMobileForLoginParams({
    required this.phoneNumber,
    required this.otp,
    this.firstName,
    this.lastName,
    required this.apiKey,
    this.token,
  });

  factory VerifyMobileForLoginParams.fromJson(String str) => VerifyMobileForLoginParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VerifyMobileForLoginParams.fromMap(Map<String, dynamic> json) => VerifyMobileForLoginParams(
        phoneNumber: json["phoneNumber"],
        otp: json["otp"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        apiKey: json["apiKey"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "phoneNumber": phoneNumber,
        "otp": otp,
        "firstName": firstName,
        "lastName": lastName,
        "apiKey": apiKey,
        "token": token,
      };
}
