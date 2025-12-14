part of "../data.dart";

class URefreshTokenParams {
  URefreshTokenParams({
    required this.refreshToken,
  });

  factory URefreshTokenParams.fromJson(String str) => URefreshTokenParams.fromMap(json.decode(str));

  factory URefreshTokenParams.fromMap(Map<String, dynamic> json) => URefreshTokenParams(
    refreshToken: json["refreshToken"],
  );
  final String refreshToken;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "refreshToken": refreshToken,
  };
}

class UGetMobileVerificationCodeForLoginParams {
  UGetMobileVerificationCodeForLoginParams({
    required this.phoneNumber,
  });

  factory UGetMobileVerificationCodeForLoginParams.fromJson(String str) => UGetMobileVerificationCodeForLoginParams.fromMap(
    json.decode(str),
  );

  factory UGetMobileVerificationCodeForLoginParams.fromMap(Map<String, dynamic> json) => UGetMobileVerificationCodeForLoginParams(
    phoneNumber: json["phoneNumber"],
  );
  final String phoneNumber;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "phoneNumber": phoneNumber,
  };
}

class ULoginWithEmailPasswordParams {
  ULoginWithEmailPasswordParams({
    required this.email,
    required this.password,
  });

  factory ULoginWithEmailPasswordParams.fromJson(String str) => ULoginWithEmailPasswordParams.fromMap(json.decode(str));

  factory ULoginWithEmailPasswordParams.fromMap(Map<String, dynamic> json) => ULoginWithEmailPasswordParams(
    email: json["email"],
    password: json["password"],
  );
  final String email;
  final String password;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "email": email,
    "password": password,
  };
}

class ULoginWithUserNamePasswordParams {
  ULoginWithUserNamePasswordParams({
    required this.userName,
    required this.password,
  });

  factory ULoginWithUserNamePasswordParams.fromJson(String str) => ULoginWithUserNamePasswordParams.fromMap(
    json.decode(str),
  );

  factory ULoginWithUserNamePasswordParams.fromMap(Map<String, dynamic> json) => ULoginWithUserNamePasswordParams(
    userName: json["userName"],
    password: json["password"],
  );
  final String userName;
  final String password;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userName": userName,
    "password": password,
  };
}

class URegisterParams {
  URegisterParams({
    required this.userName,
    required this.password,
    required this.tags,
    this.email,
    this.phoneNumber,
    this.firstName,
    this.lastName,
  });

  factory URegisterParams.fromJson(String str) => URegisterParams.fromMap(json.decode(str));

  factory URegisterParams.fromMap(Map<String, dynamic> json) => URegisterParams(
    userName: json["userName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
  );
  final String userName;
  final String? email;
  final String? phoneNumber;
  final String password;
  final String? firstName;
  final String? lastName;
  final List<int> tags;

  String toJson() => json.encode(toMap());

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

class UVerifyMobileForLoginParams {
  UVerifyMobileForLoginParams({
    required this.phoneNumber,
    required this.otp,
    this.firstName,
    this.lastName,
  });

  factory UVerifyMobileForLoginParams.fromJson(String str) => UVerifyMobileForLoginParams.fromMap(json.decode(str));

  factory UVerifyMobileForLoginParams.fromMap(Map<String, dynamic> json) => UVerifyMobileForLoginParams(
    phoneNumber: json["phoneNumber"],
    otp: json["otp"],
    firstName: json["firstName"],
    lastName: json["lastName"],
  );
  final String phoneNumber;
  final String otp;
  final String? firstName;
  final String? lastName;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "phoneNumber": phoneNumber,
    "otp": otp,
    "firstName": firstName,
    "lastName": lastName,
  };
}
