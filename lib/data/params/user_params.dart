part of "../data.dart";

class UserBulkCreateParams {
  final String token;
  final List<UserCreateParams> users;

  UserBulkCreateParams({
    required this.token,
    required this.users,
  });

  factory UserBulkCreateParams.fromJson(String str) => UserBulkCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserBulkCreateParams.fromMap(Map<String, dynamic> json) => UserBulkCreateParams(
        token: json["token"],
        users: List<UserCreateParams>.from(json["users"].map((dynamic x) => UserCreateParams.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "token": token,
        "users": List<dynamic>.from(users.map((UserCreateParams x) => x.toMap())),
      };
}

class UserCreateParams {
  final String userName;
  final String password;
  final String phoneNumber;
  final String email;
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
  final String token;

  UserCreateParams({
    required this.userName,
    required this.password,
    required this.phoneNumber,
    required this.email,
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
    required this.tags,
    this.categories,
    required this.token,
  });

  factory UserCreateParams.fromJson(String str) => UserCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserCreateParams.fromMap(Map<String, dynamic> json) => UserCreateParams(
        userName: json["userName"],
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
        health1: json["health1"] == null ? null : List<String>.from(json["health1"].map((dynamic x) => x)),
        foodAllergies: json["foodAllergies"] == null ? null : List<String>.from(json["foodAllergies"].map((dynamic x) => x)),
        drugAllergies: json["drugAllergies"] == null ? <String>[] : List<String>.from(json["drugAllergies"].map((dynamic x) => x)),
        sickness: json["sickness"] == null ? null : List<String>.from(json["sickness"].map((dynamic x) => x)),
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((dynamic x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "userName": userName,
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
        "health1": health1 == null ? null : List<dynamic>.from(health1!.map((dynamic x) => x)),
        "foodAllergies": foodAllergies == null ? null : List<dynamic>.from(foodAllergies!.map((dynamic x) => x)),
        "drugAllergies": drugAllergies == null ? null : List<dynamic>.from(drugAllergies!.map((dynamic x) => x)),
        "sickness": sickness == null ? null : List<dynamic>.from(sickness!.map((dynamic x) => x)),
        "tags": List<dynamic>.from(tags.map((dynamic x) => x)),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((dynamic x) => x)),
        "token": token,
      };
}

class UserReadParams {
  final String? userName;
  final String? phoneNumber;
  final String? email;
  final String? bio;
  final DateTime? startBirthDate;
  final DateTime? endBirthDate;
  final List<String>? categories;
  final bool? showCategories;
  final bool? showMedia;
  final bool? orderByLastName;
  final bool? orderByLastNameDesc;
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final List<int>? tags;
  final String? token;

  UserReadParams({
    this.userName,
    this.phoneNumber,
    this.email,
    this.bio,
    this.startBirthDate,
    this.endBirthDate,
    this.categories,
    this.showCategories,
    this.showMedia,
    this.orderByLastName,
    this.orderByLastNameDesc,
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
    this.token,
  });

  factory UserReadParams.fromJson(String str) => UserReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserReadParams.fromMap(Map<String, dynamic> json) => UserReadParams(
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        bio: json["bio"],
        startBirthDate: json["startBirthDate"] == null ? null : DateTime.parse(json["startBirthDate"]),
        endBirthDate: json["endBirthDate"] == null ? null : DateTime.parse(json["endBirthDate"]),
        categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((dynamic x) => x)),
        showCategories: json["showCategories"] ?? false,
        showMedia: json["showMedia"] ?? false,
        orderByLastName: json["orderByLastName"] ?? false,
        orderByLastNameDesc: json["orderByLastNameDesc"] ?? false,
        pageSize: json["pageSize"] ?? 0,
        pageNumber: json["pageNumber"] ?? 0,
        fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
        toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
        orderByCreatedAt: json["orderByCreatedAt"] ?? false,
        orderByCreatedAtDesc: json["orderByCreatedAtDesc"] ?? false,
        orderByUpdatedAt: json["orderByUpdatedAt"] ?? false,
        orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"] ?? false,
        tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "userName": userName,
        "phoneNumber": phoneNumber,
        "email": email,
        "bio": bio,
        "startBirthDate": startBirthDate?.toIso8601String(),
        "endBirthDate": endBirthDate?.toIso8601String(),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((dynamic x) => x)),
        "showCategories": showCategories,
        "showMedia": showMedia,
        "orderByLastName": orderByLastName,
        "orderByLastNameDesc": orderByLastNameDesc,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "fromCreatedAt": fromCreatedAt?.toIso8601String(),
        "toCreatedAt": toCreatedAt?.toIso8601String(),
        "orderByCreatedAt": orderByCreatedAt,
        "orderByCreatedAtDesc": orderByCreatedAtDesc,
        "orderByUpdatedAt": orderByUpdatedAt,
        "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((dynamic x) => x)),
        "token": token,
      };
}

class UserUpdateParams {
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
  final String? address;
  final String? fatherName;
  final int? weight;
  final int? height;
  final List<String>? addHealth1;
  final List<String>? removeHealth1;
  final List<String>? foodAllergies;
  final List<String>? drugAllergies;
  final List<String>? sickness;
  final List<String>? health1;
  final List<String>? categories;
  final String id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final String token;

  UserUpdateParams({
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
    this.address,
    this.fatherName,
    this.weight,
    this.height,
    this.addHealth1,
    this.removeHealth1,
    this.foodAllergies,
    this.drugAllergies,
    this.sickness,
    this.health1,
    this.categories,
    required this.id,
    this.addTags,
    this.removeTags,
    this.tags,
    required this.token,
  });

  factory UserUpdateParams.fromJson(String str) => UserUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserUpdateParams.fromMap(Map<String, dynamic> json) => UserUpdateParams(
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
        address: json["address"],
        fatherName: json["fatherName"],
        weight: json["weight"],
        height: json["height"],
        addHealth1: json["addHealth1"] == null ? null : List<String>.from(json["addHealth1"].map((dynamic x) => x)),
        removeHealth1: json["removeHealth1"] == null ? null : List<String>.from(json["removeHealth1"].map((dynamic x) => x)),
        foodAllergies: json["foodAllergies"] == null ? null : List<String>.from(json["foodAllergies"].map((dynamic x) => x)),
        drugAllergies: json["drugAllergies"] == null ? null : List<String>.from(json["drugAllergies"].map((dynamic x) => x)),
        sickness: json["sickness"] == null ? null : List<String>.from(json["sickness"].map((dynamic x) => x)),
        health1: json["health1"] == null ? null : List<String>.from(json["health1"].map((dynamic x) => x)),
        categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((dynamic x) => x)),
        id: json["id"],
        addTags: json["addTags"] == null ? null : List<int>.from(json["addTags"].map((dynamic x) => x)),
        removeTags: json["removeTags"] == null ? null : List<int>.from(json["removeTags"].map((dynamic x) => x)),
        tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
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
        "address": address,
        "fatherName": fatherName,
        "weight": weight,
        "height": height,
        "addHealth1": addHealth1 == null ? null : List<dynamic>.from(addHealth1!.map((dynamic x) => x)),
        "removeHealth1": removeHealth1 == null ? null : List<dynamic>.from(removeHealth1!.map((dynamic x) => x)),
        "foodAllergies": foodAllergies == null ? null : List<dynamic>.from(foodAllergies!.map((dynamic x) => x)),
        "drugAllergies": drugAllergies == null ? null : List<dynamic>.from(drugAllergies!.map((dynamic x) => x)),
        "sickness": sickness == null ? null : List<dynamic>.from(sickness!.map((dynamic x) => x)),
        "health1": health1 == null ? null : List<dynamic>.from(health1!.map((dynamic x) => x)),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((dynamic x) => x)),
        "id": id,
        "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((dynamic x) => x)),
        "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((dynamic x) => x)),
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((dynamic x) => x)),
        "token": token,
      };
}
