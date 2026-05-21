part of "../data.dart";

class UUserResponse {
  UUserResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.userName,
    this.password,
    this.refreshToken,
    this.phoneNumber,
    this.email,
    this.firstName,
    this.lastName,
    this.nationalCode,
    this.bio,
    this.country,
    this.state,
    this.city,
    this.birthdate,
    this.categories,
    this.media,
    this.addresses,
    this.merchants,
    this.wallets,
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

  factory UUserResponse.fromJson(String str) => UUserResponse.fromMap(json.decode(str));

  factory UUserResponse.fromMap(Map<String, dynamic> json) => UUserResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UUserJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"].map((dynamic x) => x)),
    userName: json["userName"],
    password: json["password"],
    refreshToken: json["refreshToken"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    nationalCode: json["nationalCode"],
    bio: json["bio"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    nationalCardFront: json["nationalCardFront"],
    nationalCardBack: json["nationalCardBack"],
    birthCertificateFirst: json["birthCertificateFirst"],
    birthCertificateSecond: json["birthCertificateSecond"],
    birthCertificateThird: json["birthCertificateThird"],
    birthCertificateForth: json["birthCertificateForth"],
    birthCertificateFifth: json["birthCertificateFifth"],
    visualAuthentication: json["visualAuthentication"],
    eSignature: json["eSignature"],
    birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
    categories: json["categories"] == null ? <UCategoryResponse>[] : List<UCategoryResponse>.from(json["categories"].map((dynamic x) => UCategoryResponse.fromMap(x))),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"].map((dynamic x) => UMediaResponse.fromMap(x))),
    merchants: json["merchants"] == null ? <UMerchantResponse>[] : List<UMerchantResponse>.from(json["merchants"].map((dynamic x) => UMerchantResponse.fromMap(x))),
    wallets: json["wallets"] == null ? <UWalletResponse>[] : List<UWalletResponse>.from(json["wallets"].map((dynamic x) => UWalletResponse.fromMap(x))),
  );
  final String id;
  final DateTime createdAt;
  final UUserJson jsonData;
  final List<int> tags;
  final String userName;
  final String? password;
  final String? refreshToken;
  final String? phoneNumber;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? nationalCode;
  final String? bio;
  final String? country;
  final String? state;
  final String? city;
  final DateTime? birthdate;
  final String? nationalCardFront;
  final String? nationalCardBack;
  final String? birthCertificateFirst;
  final String? birthCertificateSecond;
  final String? birthCertificateThird;
  final String? birthCertificateForth;
  final String? birthCertificateFifth;
  final String? visualAuthentication;
  final String? eSignature;
  final List<UCategoryResponse>? categories;
  final List<UMediaResponse>? media;
  final List<UAddressResponse>? addresses;
  final List<UMerchantResponse>? merchants;
  final List<UWalletResponse>? wallets;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "userName": userName,
    "password": password,
    "refreshToken": refreshToken,
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
    "nationalCardFront": nationalCardFront,
    "nationalCardBack": nationalCardBack,
    "birthCertificateFirst": birthCertificateFirst,
    "birthCertificateSecond": birthCertificateSecond,
    "birthCertificateThird": birthCertificateThird,
    "birthCertificateForth": birthCertificateForth,
    "birthCertificateFifth": birthCertificateFifth,
    "visualAuthentication": visualAuthentication,
    "eSignature": eSignature,
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((UCategoryResponse x) => x.toMap())),
    "media": media == null ? null : List<dynamic>.from(media!.map((UMediaResponse x) => x.toMap())),
    "addresses": addresses == null ? null : List<dynamic>.from(addresses!.map((UAddressResponse x) => x.toMap())),
    "merchants": merchants == null ? null : List<dynamic>.from(merchants!.map((UMerchantResponse x) => x.toMap())),
    "wallets": wallets == null ? null : List<dynamic>.from(wallets!.map((UWalletResponse x) => x.toMap())),
  };
}

class UUserJson {
  UUserJson({
    this.fcmToken,
    this.weight,
    this.height,
    this.address,
    this.fatherName,
  });

  factory UUserJson.fromJson(String str) => UUserJson.fromMap(json.decode(str));

  factory UUserJson.fromMap(Map<String, dynamic> json) => UUserJson(
    fcmToken: json["fcmToken"],
    weight: json["weight"],
    height: json["height"],
    address: json["address"],
    fatherName: json["fatherName"],
  );
  final String? fcmToken;
  final int? weight;
  final int? height;
  final String? address;
  final String? fatherName;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "fcmToken": fcmToken,
    "weight": weight,
    "height": height,
    "address": address,
    "fatherName": fatherName,
  };
}

class URegisterResponse {
  URegisterResponse({
    this.token,
    this.refreshToken,
    this.expires,
    this.user,
  });

  factory URegisterResponse.fromJson(String str) => URegisterResponse.fromMap(json.decode(str));

  factory URegisterResponse.fromMap(Map<String, dynamic> json) => URegisterResponse(
    token: json["token"],
    refreshToken: json["refreshToken"],
    expires: json["expires"],
    user: json["user"] == null ? null : UUserResponse.fromMap(json["user"]),
  );
  final String? token;
  final String? refreshToken;
  final String? expires;
  final UUserResponse? user;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "token": token,
    "refreshToken": refreshToken,
    "expires": expires,
    "user": user?.toMap(),
  };
}
