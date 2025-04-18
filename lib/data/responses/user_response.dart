import 'dart:convert';

import 'package:u/data/responses/category.dart';
import 'package:u/data/responses/exam.dart';
import 'package:u/data/responses/media.dart';

class UserResponse {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final List<int>? tags;
  final UserJsonData? jsonData;
  final String? userName;
  final String? phoneNumber;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? country;
  final String? state;
  final String? city;
  final String? bio;
  final String? birthdate;
  final List<CategoryResponse>? categories;
  final List<MediaResponse>? media;

  UserResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.tags,
    this.jsonData,
    this.userName,
    this.phoneNumber,
    this.email,
    this.firstName,
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
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
        jsonData: json["jsonData"] == null ? null : UserJsonData.fromMap(json["jsonData"]),
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        bio: json["bio"],
        birthdate: json["birthdate"],
        categories: json["categories"] == null ? [] : List<CategoryResponse>.from(json["categories"]!.map((x) => CategoryResponse.fromMap(x))),
        media: json["media"] == null ? [] : List<MediaResponse>.from(json["media"]!.map((x) => MediaResponse.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "jsonData": jsonData?.toMap(),
        "userName": userName,
        "phoneNumber": phoneNumber,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "country": country,
        "state": state,
        "city": city,
        "bio": bio,
        "birthdate": birthdate,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toMap())),
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toMap())),
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
        health1: json["health1"] == null ? [] : List<String>.from(json["health1"]!.map((x) => x)),
        foodAllergies: json["foodAllergies"] == null ? [] : List<String>.from(json["foodAllergies"]!.map((x) => x)),
        drugAllergies: json["drugAllergies"] == null ? [] : List<String>.from(json["drugAllergies"]!.map((x) => x)),
        sickness: json["sickness"] == null ? [] : List<String>.from(json["sickness"]!.map((x) => x)),
        weight: json["weight"],
        height: json["height"],
        address: json["address"],
        fatherName: json["fatherName"],
        userAnswerJson: json["userAnswerJson"] == null ? [] : List<UserAnswerJson>.from(json["userAnswerJson"]!.map((x) => UserAnswerJson.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "fcmToken": fcmToken,
        "health1": health1 == null ? [] : List<dynamic>.from(health1!.map((x) => x)),
        "foodAllergies": foodAllergies == null ? [] : List<dynamic>.from(foodAllergies!.map((x) => x)),
        "drugAllergies": drugAllergies == null ? [] : List<dynamic>.from(drugAllergies!.map((x) => x)),
        "sickness": sickness == null ? [] : List<dynamic>.from(sickness!.map((x) => x)),
        "weight": weight,
        "height": height,
        "address": address,
        "fatherName": fatherName,
        "userAnswerJson": userAnswerJson == null ? [] : List<dynamic>.from(userAnswerJson!.map((x) => x.toMap())),
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

  Map<String, dynamic> toMap() => {
    "token": token,
    "refreshToken": refreshToken,
    "expires": expires,
    "user": user?.toMap(),
  };
}
