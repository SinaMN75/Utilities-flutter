import 'package:u/utilities.dart';

class RegisterParams {
  final String apiKey;
  final String? token;
  final String userName;
  final String email;
  final String phoneNumber;
  final String password;
  final String? firstName;
  final String? lastName;
  final List<int> tags;

  RegisterParams({
    required this.apiKey,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.tags,
    this.firstName,
    this.lastName,
    this.token,
  });

  factory RegisterParams.fromJson(String str) => RegisterParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterParams.fromMap(Map<String, dynamic> json) => RegisterParams(
        apiKey: json["apiKey"],
        token: json["token"],
        userName: json["userName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        tags: List<int>.from(json["tags"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "apiKey": apiKey,
        "token": token,
        "userName": userName,
        "email": email,
        "phoneNumber": phoneNumber.englishNumber(),
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}

class LoginWithEmailPasswordParams {
  final String apiKey;
  final String token;
  final String email;
  final String password;

  LoginWithEmailPasswordParams({
    required this.apiKey,
    required this.token,
    required this.email,
    required this.password,
  });

  factory LoginWithEmailPasswordParams.fromJson(String str) => LoginWithEmailPasswordParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginWithEmailPasswordParams.fromMap(Map<String, dynamic> json) => LoginWithEmailPasswordParams(
        apiKey: json["apiKey"],
        token: json["token"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "apiKey": apiKey,
        "token": token,
        "email": email,
        "password": password,
      };
}

class LoginWithUserNamePasswordParams {
  final String apiKey;
  final String token;
  final String userName;
  final String password;

  LoginWithUserNamePasswordParams({
    required this.apiKey,
    required this.token,
    required this.userName,
    required this.password,
  });

  factory LoginWithUserNamePasswordParams.fromJson(String str) => LoginWithUserNamePasswordParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginWithUserNamePasswordParams.fromMap(Map<String, dynamic> json) => LoginWithUserNamePasswordParams(
        apiKey: json["apiKey"],
        token: json["token"],
        userName: json["userName"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "apiKey": apiKey,
        "token": token,
        "userName": userName,
        "password": password,
      };
}
