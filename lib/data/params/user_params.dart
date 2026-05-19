part of "../data.dart";

class UUserBulkCreateParams {
  UUserBulkCreateParams({
    required this.users,
  });

  factory UUserBulkCreateParams.fromJson(String str) => UUserBulkCreateParams.fromMap(json.decode(str));

  factory UUserBulkCreateParams.fromMap(Map<String, dynamic> json) => UUserBulkCreateParams(
    users: List<UUserCreateParams>.from(json["users"].map((dynamic x) => UUserCreateParams.fromMap(x))),
  );
  final List<UUserCreateParams> users;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "users": List<dynamic>.from(users.map((UUserCreateParams x) => x.toMap())),
  };
}

class UUserCreateParams {
  UUserCreateParams({
    required this.userName,
    required this.password,
    required this.phoneNumber,
    required this.email,
    required this.tags,
    this.firstName,
    this.lastName,
    this.nationalCode,
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
    this.categories,
    this.nationalCardFront,
    this.nationalCardBack,
    this.birthCertificateFirst,
    this.birthCertificateSecond,
    this.birthCertificateThird,
    this.birthCertificateForth,
    this.birthCertificateFifth,
    this.visualAuthentication,
    this.eSignature,
  });

  factory UUserCreateParams.fromJson(String str) => UUserCreateParams.fromMap(json.decode(str));

  factory UUserCreateParams.fromMap(Map<String, dynamic> json) => UUserCreateParams(
    userName: json["userName"],
    password: json["password"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    nationalCode: json["nationalCode"],
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
    nationalCardFront: json["nationalCardFront"],
    nationalCardBack: json["nationalCardBack"],
    birthCertificateFirst: json["birthCertificateFirst"],
    birthCertificateSecond: json["birthCertificateSecond"],
    birthCertificateThird: json["birthCertificateThird"],
    birthCertificateForth: json["birthCertificateForth"],
    birthCertificateFifth: json["birthCertificateFifth"],
    visualAuthentication: json["visualAuthentication"],
    eSignature: json["eSignature"],
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
    categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((dynamic x) => x)),
  );
  final String userName;
  final String password;
  final String phoneNumber;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? nationalCode;
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
  final String? nationalCardFront;
  final String? nationalCardBack;
  final String? birthCertificateFirst;
  final String? birthCertificateSecond;
  final String? birthCertificateThird;
  final String? birthCertificateForth;
  final String? birthCertificateFifth;
  final String? visualAuthentication;
  final String? eSignature;
  final List<int> tags;
  final List<String>? categories;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userName": userName,
    "password": password,
    "phoneNumber": phoneNumber,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "nationalCode": nationalCode,
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
    "nationalCardFront": nationalCardFront,
    "nationalCardBack": nationalCardBack,
    "birthCertificateFirst": birthCertificateFirst,
    "birthCertificateSecond": birthCertificateSecond,
    "birthCertificateThird": birthCertificateThird,
    "birthCertificateForth": birthCertificateForth,
    "birthCertificateFifth": birthCertificateFifth,
    "visualAuthentication": visualAuthentication,
    "eSignature": eSignature,
    "tags": List<dynamic>.from(tags.map((dynamic x) => x)),
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((dynamic x) => x)),
  };
}

class UUserReadParams {
  UUserReadParams({
    this.userName,
    this.firstName,
    this.lastName,
    this.nationalCode,
    this.phoneNumber,
    this.email,
    this.bio,
    this.startBirthDate,
    this.endBirthDate,
    this.categories,
    this.orderByLastName,
    this.orderByLastNameDesc,
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.selectorArgs,
  });

  factory UUserReadParams.fromJson(String str) => UUserReadParams.fromMap(json.decode(str));

  factory UUserReadParams.fromMap(Map<String, dynamic> json) => UUserReadParams(
    userName: json["userName"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    nationalCode: json["nationalCode"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    bio: json["bio"],
    startBirthDate: json["startBirthDate"] == null ? null : DateTime.parse(json["startBirthDate"]),
    endBirthDate: json["endBirthDate"] == null ? null : DateTime.parse(json["endBirthDate"]),
    categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((dynamic x) => x)),
    orderByLastName: json["orderByLastName"] ?? false,
    orderByLastNameDesc: json["orderByLastNameDesc"] ?? false,
    pageSize: json["pageSize"] ?? 0,
    pageNumber: json["pageNumber"] ?? 0,
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"] ?? false,
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"] ?? false,
    tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
    selectorArgs: json["selectorArgs"] == null ? null : UserSelectorArgs.fromMap(json["selectorArgs"]),
  );
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? nationalCode;
  final String? phoneNumber;
  final String? email;
  final String? bio;
  final DateTime? startBirthDate;
  final DateTime? endBirthDate;
  final List<String>? categories;
  final bool? orderByLastName;
  final bool? orderByLastNameDesc;
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final UserSelectorArgs? selectorArgs;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userName": userName,
    "firstName": firstName,
    "lastName": lastName,
    "nationalCode": nationalCode,
    "phoneNumber": phoneNumber,
    "email": email,
    "bio": bio,
    "startBirthDate": startBirthDate?.toIso8601String(),
    "endBirthDate": endBirthDate?.toIso8601String(),
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((dynamic x) => x)),
    "orderByLastName": orderByLastName,
    "orderByLastNameDesc": orderByLastNameDesc,
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((dynamic x) => x)),
    "selectorArgs": selectorArgs?.toMap(),
  };
}

class UUserUpdateParams {
  UUserUpdateParams({
    required this.id,
    this.password,
    this.firstName,
    this.lastName,
    this.nationalCode,
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
    this.categories,
    this.addTags,
    this.removeTags,
    this.tags,
    this.nationalCardFront,
    this.nationalCardBack,
    this.birthCertificateFirst,
    this.birthCertificateSecond,
    this.birthCertificateThird,
    this.birthCertificateForth,
    this.birthCertificateFifth,
    this.visualAuthentication,
    this.eSignature,
  });

  factory UUserUpdateParams.fromJson(String str) => UUserUpdateParams.fromMap(json.decode(str));

  factory UUserUpdateParams.fromMap(Map<String, dynamic> json) => UUserUpdateParams(
    password: json["password"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    nationalCode: json["nationalCode"],
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
    nationalCardFront: json["nationalCardFront"],
    nationalCardBack: json["nationalCardBack"],
    birthCertificateFirst: json["birthCertificateFirst"],
    birthCertificateSecond: json["birthCertificateSecond"],
    birthCertificateThird: json["birthCertificateThird"],
    birthCertificateForth: json["birthCertificateForth"],
    birthCertificateFifth: json["birthCertificateFifth"],
    visualAuthentication: json["visualAuthentication"],
    eSignature: json["eSignature"],
    categories: json["categories"] == null ? null : List<String>.from(json["categories"].map((dynamic x) => x)),
    id: json["id"],
    addTags: json["addTags"] == null ? null : List<int>.from(json["addTags"].map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? null : List<int>.from(json["removeTags"].map((dynamic x) => x)),
    tags: json["tags"] == null ? null : List<int>.from(json["tags"].map((dynamic x) => x)),
  );
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? nationalCode;
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
  final List<String>? categories;
  final String id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final String? nationalCardFront;
  final String? nationalCardBack;
  final String? birthCertificateFirst;
  final String? birthCertificateSecond;
  final String? birthCertificateThird;
  final String? birthCertificateForth;
  final String? birthCertificateFifth;
  final String? visualAuthentication;
  final String? eSignature;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "password": password,
    "firstName": firstName,
    "lastName": lastName,
    "nationalCode": nationalCode,
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
    "nationalCardFront": nationalCardFront,
    "nationalCardBack": nationalCardBack,
    "birthCertificateFirst": birthCertificateFirst,
    "birthCertificateSecond": birthCertificateSecond,
    "birthCertificateThird": birthCertificateThird,
    "birthCertificateForth": birthCertificateForth,
    "birthCertificateFifth": birthCertificateFifth,
    "visualAuthentication": visualAuthentication,
    "eSignature": eSignature,
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((dynamic x) => x)),
    "id": id,
    "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((dynamic x) => x)),
    "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((dynamic x) => x)),
    "tags": tags == null ? null : List<dynamic>.from(tags!.map((dynamic x) => x)),
  };
}
