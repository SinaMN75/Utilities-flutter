import 'dart:convert';

class UserReadParams {
  final String apiKey;
  final String token;
  final String id;

  UserReadParams({
    required this.apiKey,
    required this.token,
    required this.id,
  });

  factory UserReadParams.fromJson(String str) => UserReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserReadParams.fromMap(Map<String, dynamic> json) => UserReadParams(
        apiKey: json["apiKey"],
        token: json["token"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "apiKey": apiKey,
        "token": token,
        "id": id,
      };
}

class UserUpdateParams {
  final String id;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? country;
  final String? state;
  final String? city;
  final String? userName;
  final String? phoneNumber;
  final String? email;
  final String? bio;
  final String? fcmToken;
  final String? birthdate;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? addHealth1;
  final List<int>? removeHealth1;
  final List<int>? addFoodAllergies;
  final List<int>? removeFoodAllergies;
  final List<int>? addSickness;
  final List<int>? removeSickness;
  final List<String>? categories;

  UserUpdateParams({
    required this.id,
    this.password,
    this.firstName,
    this.lastName,
    this.country,
    this.state,
    this.city,
    this.userName,
    this.phoneNumber,
    this.email,
    this.bio,
    this.fcmToken,
    this.birthdate,
    this.addTags,
    this.removeTags,
    this.addHealth1,
    this.removeHealth1,
    this.addFoodAllergies,
    this.removeFoodAllergies,
    this.addSickness,
    this.removeSickness,
    this.categories,
  });

  factory UserUpdateParams.fromJson(String str) => UserUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserUpdateParams.fromMap(Map<String, dynamic> json) => UserUpdateParams(
        id: json["id"],
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        bio: json["bio"],
        fcmToken: json["fcmToken"],
        birthdate: json["birthdate"],
        addTags: json["addTags"] == null ? [] : List<int>.from(json["addTags"]!.map((x) => x)),
        removeTags: json["removeTags"] == null ? [] : List<int>.from(json["removeTags"]!.map((x) => x)),
        addHealth1: json["addHealth1"] == null ? [] : List<int>.from(json["addHealth1"]!.map((x) => x)),
        removeHealth1: json["removeHealth1"] == null ? [] : List<int>.from(json["removeHealth1"]!.map((x) => x)),
        addFoodAllergies: json["addFoodAllergies"] == null ? [] : List<int>.from(json["addFoodAllergies"]!.map((x) => x)),
        removeFoodAllergies: json["removeFoodAllergies"] == null ? [] : List<int>.from(json["removeFoodAllergies"]!.map((x) => x)),
        addSickness: json["addSickness"] == null ? [] : List<int>.from(json["addSickness"]!.map((x) => x)),
        removeSickness: json["removeSickness"] == null ? [] : List<int>.from(json["removeSickness"]!.map((x) => x)),
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "country": country,
        "state": state,
        "city": city,
        "userName": userName,
        "phoneNumber": phoneNumber,
        "email": email,
        "bio": bio,
        "fcmToken": fcmToken,
        "birthdate": birthdate,
        "addTags": addTags == null ? [] : List<dynamic>.from(addTags!.map((x) => x)),
        "removeTags": removeTags == null ? [] : List<dynamic>.from(removeTags!.map((x) => x)),
        "addHealth1": addHealth1 == null ? [] : List<dynamic>.from(addHealth1!.map((x) => x)),
        "removeHealth1": removeHealth1 == null ? [] : List<dynamic>.from(removeHealth1!.map((x) => x)),
        "addFoodAllergies": addFoodAllergies == null ? [] : List<dynamic>.from(addFoodAllergies!.map((x) => x)),
        "removeFoodAllergies": removeFoodAllergies == null ? [] : List<dynamic>.from(removeFoodAllergies!.map((x) => x)),
        "addSickness": addSickness == null ? [] : List<dynamic>.from(addSickness!.map((x) => x)),
        "removeSickness": removeSickness == null ? [] : List<dynamic>.from(removeSickness!.map((x) => x)),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
      };
}
