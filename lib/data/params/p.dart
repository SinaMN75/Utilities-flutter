import 'dart:convert';

class BaseParams {
  BaseParams({
    required this.apiKey,
    required this.token,
  });

  factory BaseParams.fromJson(String str) => BaseParams.fromMap(json.decode(str));

  factory BaseParams.fromMap(Map<String, dynamic> json) => BaseParams(
        apiKey: json["api_key"],
        token: json["token"],
      );

  final String apiKey;
  final String token;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "api_key": apiKey,
        "token": token,
      };
}

class RefreshTokenParams extends BaseParams {
  RefreshTokenParams({
    required this.refreshToken,
    required super.apiKey,
    required super.token,
  });

  factory RefreshTokenParams.fromJson(String str) => RefreshTokenParams.fromMap(json.decode(str));

  factory RefreshTokenParams.fromMap(Map<String, dynamic> json) => RefreshTokenParams(
        refreshToken: json["refresh_token"],
        apiKey: json["api_key"],
        token: json["token"],
      );

  final String refreshToken;

  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "refresh_token": refreshToken,
      };
}

class GetMobileVerificationCodeForLoginParams extends BaseParams {
  GetMobileVerificationCodeForLoginParams({
    required this.phoneNumber,
    required super.apiKey,
    required super.token,
  });

  factory GetMobileVerificationCodeForLoginParams.fromJson(String str) => GetMobileVerificationCodeForLoginParams.fromMap(json.decode(str));

  factory GetMobileVerificationCodeForLoginParams.fromMap(Map<String, dynamic> json) => GetMobileVerificationCodeForLoginParams(
        phoneNumber: json["phone_number"],
        apiKey: json["api_key"],
        token: json["token"],
      );

  final String phoneNumber;

  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "phone_number": phoneNumber,
      };
}

class LoginWithEmailPasswordParams extends BaseParams {
  LoginWithEmailPasswordParams({
    required this.email,
    required this.password,
    required super.apiKey,
    required super.token,
  });

  factory LoginWithEmailPasswordParams.fromJson(String str) => LoginWithEmailPasswordParams.fromMap(json.decode(str));

  factory LoginWithEmailPasswordParams.fromMap(Map<String, dynamic> json) => LoginWithEmailPasswordParams(
        email: json["email"],
        password: json["password"],
        apiKey: json["api_key"],
        token: json["token"],
      );

  final String email;
  final String password;

  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "email": email,
        "password": password,
      };
}

class RegisterParams extends BaseParams {
  RegisterParams({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.firstName,
    this.lastName,
    required this.tags,
    required super.apiKey,
    required super.token,
  });

  factory RegisterParams.fromJson(String str) => RegisterParams.fromMap(json.decode(str));

  factory RegisterParams.fromMap(Map<String, dynamic> json) => RegisterParams(
        userName: json["user_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        password: json["password"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        tags: List<TagUser>.from(json["tags"].map((x) => TagUser.fromMap(x))),
        apiKey: json["api_key"],
        token: json["token"],
      );

  final String userName;
  final String email;
  final String phoneNumber;
  final String password;
  final String? firstName;
  final String? lastName;
  final List<TagUser> tags;

  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "user_name": userName,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "tags": List<dynamic>.from(tags.map((x) => x.toMap())),
      };
}

class VerifyMobileForLoginParams extends BaseParams {
  VerifyMobileForLoginParams({
    required this.phoneNumber,
    required this.otp,
    this.firstName,
    this.lastName,
    required super.apiKey,
    required super.token,
  });

  factory VerifyMobileForLoginParams.fromJson(String str) => VerifyMobileForLoginParams.fromMap(json.decode(str));

  factory VerifyMobileForLoginParams.fromMap(Map<String, dynamic> json) => VerifyMobileForLoginParams(
        phoneNumber: json["phone_number"],
        otp: json["otp"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        apiKey: json["api_key"],
        token: json["token"],
      );

  final String phoneNumber;
  final String otp;
  final String? firstName;
  final String? lastName;

  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "phone_number": phoneNumber,
        "otp": otp,
        "first_name": firstName,
        "last_name": lastName,
      };
}

class IdParams extends BaseParams {
  IdParams({
    required this.id,
    required super.apiKey,
    required super.token,
  });

  factory IdParams.fromJson(String str) => IdParams.fromMap(json.decode(str));

  factory IdParams.fromMap(Map<String, dynamic> json) => IdParams(
        id: json["id"],
        apiKey: json["api_key"],
        token: json["token"],
      );

  final String id;

  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "id": id,
      };
}

class IdListParams extends BaseParams {
  IdListParams({
    required this.ids,
    required super.apiKey,
    required super.token,
  });

  factory IdListParams.fromJson(String str) => IdListParams.fromMap(json.decode(str));

  factory IdListParams.fromMap(Map<String, dynamic> json) => IdListParams(
        ids: List<String>.from(json["ids"].map((x) => x)),
        apiKey: json["api_key"],
        token: json["token"],
      );

  final List<String> ids;

  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "ids": List<dynamic>.from(ids.map((x) => x)),
      };
}

class IdTitleParams extends BaseParams {
  IdTitleParams({
    this.id,
    this.title,
    required super.apiKey,
    required super.token,
  });

  factory IdTitleParams.fromJson(String str) => IdTitleParams.fromMap(json.decode(str));

  factory IdTitleParams.fromMap(Map<String, dynamic> json) => IdTitleParams(
        id: json["id"],
        title: json["title"],
        apiKey: json["api_key"],
        token: json["token"],
      );

  final int? id;
  final String? title;

  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "id": id,
        "title": title,
      };
}

class BaseReadParams<T> extends BaseParams {
  BaseReadParams({
    this.pageSize = 100,
    this.pageNumber = 1,
    this.fromDate,
    this.tags,
    required super.apiKey,
    required super.token,
  });

  factory BaseReadParams.fromJson(String str) => BaseReadParams.fromMap(json.decode(str));

  factory BaseReadParams.fromMap(Map<String, dynamic> json) => BaseReadParams(
        pageSize: json["page_size"],
        pageNumber: json["page_number"],
        fromDate: json["from_date"] == null ? null : DateTime.parse(json["from_date"]),
        tags: json["tags"] == null ? null : List<T>.from(json["tags"].map((x) => x)),
        apiKey: json["api_key"],
        token: json["token"],
      );

  final int pageSize;
  final int pageNumber;
  final DateTime? fromDate;
  final List<T>? tags;

  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "page_size": pageSize,
        "page_number": pageNumber,
        "from_date": fromDate?.toIso8601String(),
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
      };
}

class BaseUpdateParams<T> extends BaseParams {
  BaseUpdateParams({
    required this.id,
    this.addTags,
    this.removeTags,
    required super.apiKey,
    required super.token,
  });

  factory BaseUpdateParams.fromJson(String str) => BaseUpdateParams.fromMap(json.decode(str));

  factory BaseUpdateParams.fromMap(Map<String, dynamic> json) => BaseUpdateParams(
        id: json["id"],
        addTags: json["add_tags"] == null ? null : List<T>.from(json["add_tags"].map((x) => x)),
        removeTags: json["remove_tags"] == null ? null : List<T>.from(json["remove_tags"].map((x) => x)),
        apiKey: json["api_key"],
        token: json["token"],
      );

  final String id;
  final List<T>? addTags;
  final List<T>? removeTags;

  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "id": id,
        "add_tags": addTags == null ? null : List<dynamic>.from(addTags!.map((x) => x)),
        "remove_tags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((x) => x)),
      };
}

class BaseCreateParams<T> extends BaseParams {
  BaseCreateParams({
    required this.tags,
    required super.apiKey,
    required super.token,
  });

  factory BaseCreateParams.fromJson(String str) => BaseCreateParams.fromMap(json.decode(str));

  factory BaseCreateParams.fromMap(Map<String, dynamic> json) => BaseCreateParams(
        tags: List<T>.from(json["tags"].map((x) => x)),
        apiKey: json["api_key"],
        token: json["token"],
      );

  final List<T> tags;

  @override
  String toJson() => json.encode(toMap());

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}

class TagUser {
  TagUser();

  factory TagUser.fromJson(String str) => TagUser.fromMap(json.decode(str));

  factory TagUser.fromMap(Map<String, dynamic> json) => TagUser();

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {};
}
