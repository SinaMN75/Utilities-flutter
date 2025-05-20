part of "../data.dart";

class UserCreateParams {
  final String apiKey;
  final String? token;
  final String? userName;
  final String? parentId;
  final String? password;
  final String? phoneNumber;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? bio;
  final String? country;
  final String? state;
  final String? city;
  final DateTime? birthdate;
  final int? weight;
  final int? height;
  final String? address;
  final String? fatherName;
  final String? fcmToken;
  final List<String>? health1;
  final List<String>? foodAllergies;
  final List<String>? drugAllergies;
  final List<String>? sickness;
  final List<int> tags;
  final List<String>? categories;

  UserCreateParams({
    required this.apiKey,
    required this.token,
    required this.tags,
    this.userName,
    this.password,
    this.parentId,
    this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
    this.bio,
    this.country,
    this.state,
    this.city,
    this.birthdate,
    this.weight,
    this.height,
    this.address,
    this.fatherName,
    this.fcmToken,
    this.health1,
    this.foodAllergies,
    this.drugAllergies,
    this.sickness,
    this.categories,
  });

  factory UserCreateParams.fromJson(String str) => UserCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserCreateParams.fromMap(Map<String, dynamic> json) => UserCreateParams(
        apiKey: json["apiKey"],
        token: json["token"],
        userName: json["userName"],
        parentId: json["parentId"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        bio: json["bio"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
        weight: json["weight"],
        height: json["height"],
        address: json["address"],
        fatherName: json["fatherName"],
        fcmToken: json["fcmToken"],
        health1: json["health1"] == null ? <String>[] : List<String>.from(json["health1"]!.map((dynamic x) => x)),
        foodAllergies: json["foodAllergies"] == null ? <String>[] : List<String>.from(json["foodAllergies"]!.map((dynamic x) => x)),
        drugAllergies: json["drugAllergies"] == null ? <String>[] : List<String>.from(json["drugAllergies"]!.map((dynamic x) => x)),
        sickness: json["sickness"] == null ? <String>[] : List<String>.from(json["sickness"]!.map((dynamic x) => x)),
        tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
        categories: json["categories"] == null ? <String>[] : List<String>.from(json["categories"]!.map((dynamic x) => x)),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "apiKey": apiKey,
        "token": token,
        "userName": userName,
        "parentId": parentId,
        "password": password,
        "phoneNumber": phoneNumber,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "bio": bio,
        "country": country,
        "state": state,
        "city": city,
        "birthdate": birthdate?.toIso8601String(),
        "weight": weight,
        "height": height,
        "address": address,
        "fatherName": fatherName,
        "fcmToken": fcmToken,
        "health1": health1 == null ? <dynamic>[] : List<dynamic>.from(health1!.map((String x) => x)),
        "foodAllergies": foodAllergies == null ? <dynamic>[] : List<dynamic>.from(foodAllergies!.map((String x) => x)),
        "drugAllergies": drugAllergies == null ? <dynamic>[] : List<dynamic>.from(drugAllergies!.map((String x) => x)),
        "sickness": sickness == null ? <dynamic>[] : List<dynamic>.from(sickness!.map((String x) => x)),
        "tags": List<dynamic>.from(tags.map((int x) => x)),
        "categories": categories == null ? <dynamic>[] : List<dynamic>.from(categories!.map((String x) => x)),
      };
}

class UserReadParams extends BaseReadParams {
  final String? userName;
  final String? phoneNumber;
  final String? email;
  final String? bio;
  final String? parentId;
  final DateTime? startBirthDate;
  final DateTime? endBirthDate;
  final List<String>? categories;
  final bool? showCategories;
  final bool? showMedia;
  final bool? showChildren;

  UserReadParams({
    required super.apiKey,
    super.token,
    super.pageSize,
    super.pageNumber,
    super.fromCreatedAt,
    super.toCreatedAt,
    super.orderByCreatedAt,
    super.orderByCreatedAtDesc,
    super.orderByLastName,
    super.orderByLastNameDesc,
    super.tags,
    this.userName,
    this.parentId,
    this.phoneNumber,
    this.email,
    this.bio,
    this.startBirthDate,
    this.endBirthDate,
    this.categories,
    this.showCategories,
    this.showMedia,
    this.showChildren,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        ...toBaseReadMap(),
        "apiKey": apiKey,
        "token": token,
        "parentId": parentId,
        "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
        "userName": userName,
        "phoneNumber": phoneNumber,
        "email": email,
        "bio": bio,
        "startBirthDate": startBirthDate?.toIso8601String(),
        "endBirthDate": endBirthDate?.toIso8601String(),
        "categories": categories == null ? <dynamic>[] : List<dynamic>.from(categories!.map((String x) => x)),
        "showCategories": showCategories,
        "showMedia": showMedia,
        "showChildren": showChildren,
      };
}

class UserUpdateParams extends BaseUpdateParams {
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
  final DateTime? birthdate;
  final String? fcmToken;
  final int? weight;
  final int? height;
  final String? address;
  final String? fatherName;
  final List<String>? addHealth1;
  final List<String>? removeHealth1;
  final List<String>? health1;
  final List<String>? foodAllergies;
  final List<String>? drugAllergies;
  final List<String>? sickness;
  final List<String>? categories;

  UserUpdateParams({
    required super.id,
    required super.apiKey,
    required super.token,
    super.addTags,
    super.removeTags,
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
    this.birthdate,
    this.fcmToken,
    this.weight,
    this.height,
    this.address,
    this.fatherName,
    this.addHealth1,
    this.removeHealth1,
    this.health1,
    this.foodAllergies,
    this.drugAllergies,
    this.sickness,
    this.categories,
  });

  factory UserUpdateParams.fromJson(String str) => UserUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserUpdateParams.fromMap(Map<String, dynamic> json) => UserUpdateParams(
        id: json["id"],
        token: json["token"],
        apiKey: json["apiKey"],
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
        birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
        fcmToken: json["fcmToken"],
        weight: json["weight"],
        height: json["height"],
        address: json["address"],
        fatherName: json["fatherName"],
        addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((final dynamic x) => x)),
        removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((final dynamic x) => x)),
        addHealth1: json["addHealth1"] == null ? <String>[] : List<String>.from(json["addHealth1"]!.map((final dynamic x) => x)),
        removeHealth1: json["removeHealth1"] == null ? <String>[] : List<String>.from(json["removeHealth1"]!.map((final dynamic x) => x)),
        foodAllergies: json["foodAllergies"] == null ? <String>[] : List<String>.from(json["foodAllergies"]!.map((final dynamic x) => x)),
        drugAllergies: json["drugAllergies"] == null ? <String>[] : List<String>.from(json["drugAllergies"]!.map((final dynamic x) => x)),
        sickness: json["sickness"] == null ? <String>[] : List<String>.from(json["sickness"]!.map((final dynamic x) => x)),
        health1: json["health1"] == null ? <String>[] : List<String>.from(json["health1"]!.map((final dynamic x) => x)),
        categories: json["categories"] == null ? <String>[] : List<String>.from(json["categories"]!.map((final dynamic x) => x)),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        ...toBaseUpdateBaseMap(),
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
        "birthdate": birthdate?.toIso8601String(),
        "fcmToken": fcmToken,
        "weight": weight,
        "height": height,
        "address": address,
        "fatherName": fatherName,
        "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
        "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
        "addHealth1": addHealth1 == null ? <dynamic>[] : List<dynamic>.from(addHealth1!.map((String x) => x)),
        "removeHealth1": removeHealth1 == null ? <dynamic>[] : List<dynamic>.from(removeHealth1!.map((String x) => x)),
        "health1": health1 == null ? <dynamic>[] : List<dynamic>.from(health1!.map((String x) => x)),
        "sickness": sickness == null ? <dynamic>[] : List<dynamic>.from(sickness!.map((String x) => x)),
        "foodAllergies": foodAllergies == null ? <dynamic>[] : List<dynamic>.from(foodAllergies!.map((String x) => x)),
        "drugAllergies": drugAllergies == null ? <dynamic>[] : List<dynamic>.from(drugAllergies!.map((String x) => x)),
        "categories": categories == null ? <dynamic>[] : List<dynamic>.from(categories!.map((String x) => x)),
      };
}
