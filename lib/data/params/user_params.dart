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
        health1: json["health1"] == null ? [] : List<String>.from(json["health1"]!.map((x) => x)),
        foodAllergies: json["foodAllergies"] == null ? [] : List<String>.from(json["foodAllergies"]!.map((x) => x)),
        drugAllergies: json["drugAllergies"] == null ? [] : List<String>.from(json["drugAllergies"]!.map((x) => x)),
        sickness: json["sickness"] == null ? [] : List<String>.from(json["sickness"]!.map((x) => x)),
        tags: List<int>.from(json["tags"]!.map((x) => x)),
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
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
        "health1": health1 == null ? [] : List<dynamic>.from(health1!.map((x) => x)),
        "foodAllergies": foodAllergies == null ? [] : List<dynamic>.from(foodAllergies!.map((x) => x)),
        "drugAllergies": drugAllergies == null ? [] : List<dynamic>.from(drugAllergies!.map((x) => x)),
        "sickness": sickness == null ? [] : List<dynamic>.from(sickness!.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
      };
}

class UserReadParams extends BaseReadParams {
  final String? userName;
  final String? phoneNumber;
  final String? email;
  final String? bio;
  final DateTime? startBirthDate;
  final DateTime? endBirthDate;
  final List<String>? categories;
  final bool? showCategories;
  final bool? showMedia;
  final bool? showChildren;

  UserReadParams({
    super.apiKey,
    super.token,
    super.pageSize,
    super.pageNumber,
    super.fromDate,
    super.tags,
    this.userName,
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

  factory UserReadParams.fromJson(String str) => UserReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserReadParams.fromMap(Map<String, dynamic> json) => UserReadParams(
        apiKey: json["apiKey"],
        token: json["token"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        fromDate: json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        bio: json["bio"],
        startBirthDate: json["startBirthDate"] == null ? null : DateTime.parse(json["startBirthDate"]),
        endBirthDate: json["endBirthDate"] == null ? null : DateTime.parse(json["endBirthDate"]),
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
        showCategories: json["showCategories"],
        showMedia: json["showMedia"],
        showChildren: json["showChildren"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        ...toReadBaseMap(),
        "apiKey": apiKey,
        "token": token,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "fromDate": fromDate?.toIso8601String(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "userName": userName,
        "phoneNumber": phoneNumber,
        "email": email,
        "bio": bio,
        "startBirthDate": startBirthDate?.toIso8601String(),
        "endBirthDate": endBirthDate?.toIso8601String(),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
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
  final List<String>? addFoodAllergies;
  final List<String>? removeFoodAllergies;
  final List<String>? addDrugAllergies;
  final List<String>? removeDrugAllergies;
  final List<String>? addSickness;
  final List<String>? removeSickness;
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
    this.addFoodAllergies,
    this.removeFoodAllergies,
    this.addDrugAllergies,
    this.removeDrugAllergies,
    this.addSickness,
    this.removeSickness,
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
        addFoodAllergies: json["addFoodAllergies"] == null ? <String>[] : List<String>.from(json["addFoodAllergies"]!.map((final dynamic x) => x)),
        removeFoodAllergies: json["removeFoodAllergies"] == null ? <String>[] : List<String>.from(json["removeFoodAllergies"]!.map((final dynamic x) => x)),
        addDrugAllergies: json["addDrugAllergies"] == null ? <String>[] : List<String>.from(json["addDrugAllergies"]!.map((final dynamic x) => x)),
        removeDrugAllergies: json["removeDrugAllergies"] == null ? <String>[] : List<String>.from(json["removeDrugAllergies"]!.map((final dynamic x) => x)),
        addSickness: json["addSickness"] == null ? <String>[] : List<String>.from(json["addSickness"]!.map((final dynamic x) => x)),
        removeSickness: json["removeSickness"] == null ? <String>[] : List<String>.from(json["removeSickness"]!.map((final dynamic x) => x)),
        categories: json["categories"] == null ? <String>[] : List<String>.from(json["categories"]!.map((final dynamic x) => x)),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        ...toUpdateBaseMap(),
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
        "addFoodAllergies": addFoodAllergies == null ? <dynamic>[] : List<dynamic>.from(addFoodAllergies!.map((String x) => x)),
        "removeFoodAllergies": removeFoodAllergies == null ? <dynamic>[] : List<dynamic>.from(removeFoodAllergies!.map((String x) => x)),
        "addDrugAllergies": addDrugAllergies == null ? <dynamic>[] : List<dynamic>.from(addDrugAllergies!.map((String x) => x)),
        "removeDrugAllergies": removeDrugAllergies == null ? <dynamic>[] : List<dynamic>.from(removeDrugAllergies!.map((String x) => x)),
        "addSickness": addSickness == null ? <dynamic>[] : List<dynamic>.from(addSickness!.map((String x) => x)),
        "removeSickness": removeSickness == null ? <dynamic>[] : List<dynamic>.from(removeSickness!.map((String x) => x)),
        "categories": categories == null ? <dynamic>[] : List<dynamic>.from(categories!.map((String x) => x)),
      };
}
