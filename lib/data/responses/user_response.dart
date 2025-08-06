part of "../data.dart";

class UserResponse {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserJson jsonData;
  final List<int> tags;
  final String userName;
  final String? password;
  final String? refreshToken;
  final String? phoneNumber;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? bio;
  final String? country;
  final String? state;
  final String? city;
  final DateTime? birthdate;
  final List<CategoryResponse>? categories;
  final List<MediaResponse>? media;

  UserResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.userName,
    this.password,
    this.refreshToken,
    this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
    this.bio,
    this.country,
    this.state,
    this.city,
    this.birthdate,
    this.categories,
    this.media,
  });

  factory UserResponse.fromJson(String str) => UserResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        jsonData: UserJson.fromMap(json["jsonData"]),
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        userName: json["userName"],
        password: json["password"],
        refreshToken: json["refreshToken"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        bio: json["bio"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
        categories: json["categories"] == null ? <CategoryResponse>[] : List<CategoryResponse>.from(json["categories"].map((dynamic x) => CategoryResponse.fromMap(x))),
        media: json["media"] == null ? <MediaResponse>[] : List<MediaResponse>.from(json["media"].map((dynamic x) => MediaResponse.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "jsonData": jsonData.toMap(),
        "tags": List<dynamic>.from(tags.map((int x) => x)),
        "userName": userName,
        "password": password,
        "refreshToken": refreshToken,
        "phoneNumber": phoneNumber,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "bio": bio,
        "country": country,
        "state": state,
        "city": city,
        "birthdate": birthdate?.toIso8601String(),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((CategoryResponse x) => x.toMap())),
        "media": media == null ? null : List<dynamic>.from(media!.map((MediaResponse x) => x.toMap())),
      };
}

class UserJson {
  final String? fcmToken;
  final List<String>? health1;
  final List<String>? foodAllergies;
  final List<String>? drugAllergies;
  final List<String>? sickness;
  final int? weight;
  final int? height;
  final String? address;
  final String? fatherName;
  final List<UserAnswerJson> userAnswerJson;
  final List<VisitCount>? visitCounts;

  UserJson({
    this.fcmToken,
    this.health1,
    this.foodAllergies,
    this.drugAllergies,
    this.sickness,
    this.weight,
    this.height,
    this.address,
    this.fatherName,
    this.visitCounts,
    this.userAnswerJson = const <UserAnswerJson>[],
  });

  factory UserJson.fromJson(String str) => UserJson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserJson.fromMap(Map<String, dynamic> json) => UserJson(
        fcmToken: json["fcmToken"],
        health1: json["health1"] == null ? <String>[] : List<String>.from(json["health1"].map((dynamic x) => x)),
        foodAllergies: json["foodAllergies"] == null ? <String>[] : List<String>.from(json["foodAllergies"].map((dynamic x) => x)),
        drugAllergies: json["drugAllergies"] == null ? <String>[] : List<String>.from(json["drugAllergies"].map((dynamic x) => x)),
        sickness: json["sickness"] == null ? <String>[] : List<String>.from(json["sickness"].map((dynamic x) => x)),
        weight: json["weight"],
        height: json["height"],
        address: json["address"],
        fatherName: json["fatherName"],
        visitCounts: json["visitCounts"] == null ? <VisitCount>[] : List<VisitCount>.from(json["visitCounts"].map((dynamic x) => VisitCount.fromMap(x))),
        userAnswerJson: json["userAnswerJson"] == null ? <UserAnswerJson>[] : List<UserAnswerJson>.from(json["userAnswerJson"].map((dynamic x) => UserAnswerJson.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "fcmToken": fcmToken,
        "health1": health1 == null ? null : List<dynamic>.from(health1!.map((String x) => x)),
        "foodAllergies": foodAllergies == null ? null : List<dynamic>.from(foodAllergies!.map((String x) => x)),
        "drugAllergies": drugAllergies == null ? null : List<dynamic>.from(drugAllergies!.map((String x) => x)),
        "sickness": sickness == null ? null : List<dynamic>.from(sickness!.map((String x) => x)),
        "weight": weight,
        "height": height,
        "address": address,
        "fatherName": fatherName,
        "visitCounts": visitCounts == null ? null : List<dynamic>.from(visitCounts!.map((VisitCount x) => x.toMap())),
        "userAnswerJson": List<dynamic>.from(userAnswerJson.map((UserAnswerJson x) => x.toMap())),
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
