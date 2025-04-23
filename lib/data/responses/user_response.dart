part of "../data.dart";

class UserResponse {
  final String id;
  final String createdAt;
  final String updatedAt;
  final List<int> tags;
  final UserJsonData jsonData;
  final String userName;
  final String phoneNumber;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? country;
  final String? state;
  final String? city;
  final String? bio;
  final DateTime? birthdate;
  final List<CategoryResponse>? categories;
  final List<MediaResponse>? media;
  final List<UserResponse>? children;

  UserResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.tags,
    required this.jsonData,
    required this.userName,
    required this.phoneNumber,
    required this.email,
    this.firstName,
    this.children,
    this.lastName,
    this.country,
    this.state,
    this.city,
    this.bio,
    this.birthdate,
    this.categories,
    this.media,
  });

  factory UserResponse.fromJson(String str) => UserResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        tags: List<int>.from(json["tags"]!.map((final dynamic x) => x)),
        jsonData: UserJsonData.fromMap(json["jsonData"]),
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        bio: json["bio"],
        birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
        categories: json["categories"] == null ? <CategoryResponse>[] : List<CategoryResponse>.from(json["categories"]!.map((final dynamic x) => CategoryResponse.fromMap(x))),
        children: json["children"] == null ? <UserResponse>[] : List<UserResponse>.from(json["children"]!.map((final dynamic x) => UserResponse.fromMap(x))),
        media: json["media"] == null ? <MediaResponse>[] : List<MediaResponse>.from(json["media"]!.map((final dynamic x) => MediaResponse.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "tags": List<dynamic>.from(tags.map((int x) => x)),
        "jsonData": jsonData.toMap(),
        "userName": userName,
        "phoneNumber": phoneNumber,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "country": country,
        "state": state,
        "city": city,
        "bio": bio,
        "birthdate": birthdate?.toIso8601String(),
        "categories": categories == null ? <dynamic>[] : List<dynamic>.from(categories!.map((CategoryResponse x) => x.toMap())),
        "children": children == null ? <dynamic>[] : List<dynamic>.from(children!.map((UserResponse x) => x.toMap())),
        "media": media == null ? <dynamic>[] : List<dynamic>.from(media!.map((MediaResponse x) => x.toMap())),
      };
}

class UserJsonData {
  final String? fcmToken;
  final List<String>? health1;
  final List<String>? foodAllergies;
  final List<String>? drugAllergies;
  final List<String>? sickness;
  final int? weight;
  final int? height;
  final String? address;
  final String? fatherName;
  final List<UserAnswerJson>? userAnswerJson;

  UserJsonData({
    this.fcmToken,
    this.health1,
    this.foodAllergies,
    this.drugAllergies,
    this.sickness,
    this.weight,
    this.height,
    this.address,
    this.fatherName,
    this.userAnswerJson,
  });

  factory UserJsonData.fromJson(String str) => UserJsonData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserJsonData.fromMap(Map<String, dynamic> json) => UserJsonData(
        fcmToken: json["fcmToken"],
        health1: json["health1"] == null ? <String>[] : List<String>.from(json["health1"]!.map((final dynamic x) => x)),
        foodAllergies: json["foodAllergies"] == null ? <String>[] : List<String>.from(json["foodAllergies"]!.map((final dynamic x) => x)),
        drugAllergies: json["drugAllergies"] == null ? <String>[] : List<String>.from(json["drugAllergies"]!.map((final dynamic x) => x)),
        sickness: json["sickness"] == null ? <String>[] : List<String>.from(json["sickness"]!.map((final dynamic x) => x)),
        weight: json["weight"],
        height: json["height"],
        address: json["address"],
        fatherName: json["fatherName"],
        userAnswerJson: json["userAnswerJson"] == null ? <UserAnswerJson>[] : List<UserAnswerJson>.from(json["userAnswerJson"]!.map((final dynamic x) => UserAnswerJson.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "fcmToken": fcmToken,
        "health1": health1 == null ? <dynamic>[] : List<dynamic>.from(health1!.map((String x) => x)),
        "foodAllergies": foodAllergies == null ? <dynamic>[] : List<dynamic>.from(foodAllergies!.map((String x) => x)),
        "drugAllergies": drugAllergies == null ? <dynamic>[] : List<dynamic>.from(drugAllergies!.map((String x) => x)),
        "sickness": sickness == null ? <dynamic>[] : List<dynamic>.from(sickness!.map((String x) => x)),
        "weight": weight,
        "height": height,
        "address": address,
        "fatherName": fatherName,
        "userAnswerJson": userAnswerJson == null ? <dynamic>[] : List<dynamic>.from(userAnswerJson!.map((UserAnswerJson x) => x.toMap())),
      };
}

class RegisterResponse {
  final String? token;
  final String? refreshToken;
  final String? expires;
  final UserResponse? user;

  RegisterResponse({
    this.token,
    this.refreshToken,
    this.expires,
    this.user,
  });

  factory RegisterResponse.fromJson(String str) => RegisterResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResponse.fromMap(Map<String, dynamic> json) => RegisterResponse(
        token: json["token"],
        refreshToken: json["refreshToken"],
        expires: json["expires"],
        user: json["user"] == null ? null : UserResponse.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "token": token,
        "refreshToken": refreshToken,
        "expires": expires,
        "user": user?.toMap(),
      };
}
