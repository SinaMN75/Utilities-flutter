part of "../data.dart";

class RefreshTokenParams {
  final String refreshToken;

  RefreshTokenParams({
    required this.refreshToken,
  });

  factory RefreshTokenParams.fromJson(String str) => RefreshTokenParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RefreshTokenParams.fromMap(Map<String, dynamic> json) => RefreshTokenParams(
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "refreshToken": refreshToken,
      };
}

class GetMobileVerificationCodeForLoginParams {
  final String phoneNumber;

  GetMobileVerificationCodeForLoginParams({
    required this.phoneNumber,
  });

  factory GetMobileVerificationCodeForLoginParams.fromJson(String str) => GetMobileVerificationCodeForLoginParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMobileVerificationCodeForLoginParams.fromMap(Map<String, dynamic> json) => GetMobileVerificationCodeForLoginParams(
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "phoneNumber": phoneNumber,
      };
}

class LoginWithEmailPasswordParams {
  final String email;
  final String password;

  LoginWithEmailPasswordParams({
    required this.email,
    required this.password,
  });

  factory LoginWithEmailPasswordParams.fromJson(String str) => LoginWithEmailPasswordParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginWithEmailPasswordParams.fromMap(Map<String, dynamic> json) => LoginWithEmailPasswordParams(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "email": email,
        "password": password,
      };
}

class LoginWithUserNamePasswordParams {
  final String userName;
  final String password;

  LoginWithUserNamePasswordParams({
    required this.userName,
    required this.password,
  });

  factory LoginWithUserNamePasswordParams.fromJson(String str) => LoginWithUserNamePasswordParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginWithUserNamePasswordParams.fromMap(Map<String, dynamic> json) => LoginWithUserNamePasswordParams(
        userName: json["userName"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "userName": userName,
        "password": password,
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

  RegisterParams({
    required this.userName,
    this.email,
    this.phoneNumber,
    required this.password,
    this.firstName,
    this.lastName,
    required this.tags,
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
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "userName": userName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "tags": List<dynamic>.from(tags.map((int x) => x)),
      };
}

class VerifyMobileForLoginParams {
  final String phoneNumber;
  final String otp;
  final String? firstName;
  final String? lastName;

  VerifyMobileForLoginParams({
    required this.phoneNumber,
    required this.otp,
    this.firstName,
    this.lastName,
  });

  factory VerifyMobileForLoginParams.fromJson(String str) => VerifyMobileForLoginParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VerifyMobileForLoginParams.fromMap(Map<String, dynamic> json) => VerifyMobileForLoginParams(
        phoneNumber: json["phoneNumber"],
        otp: json["otp"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "phoneNumber": phoneNumber,
        "otp": otp,
        "firstName": firstName,
        "lastName": lastName,
      };
}
