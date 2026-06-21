part of "../data.dart";

class UMerchantCreateParams {
  final String? detail1;
  final String? detail2;
  final List<int> tags;
  final String? id;
  final String? creatorId;
  final String zipCode;
  final String? userId;
  final String? businessTitle;
  final String cityCode;
  final String address;
  final String phoneNumber;
  final String title;
  final String landline;
  final String nationalCode;
  final String ownerPhoneNumber;
  final String ownerName;
  final String? bankAccountId;
  final String mcc;

  UMerchantCreateParams({
    required this.tags,
    required this.zipCode,
    required this.cityCode,
    required this.address,
    required this.title,
    required this.landline,
    required this.nationalCode,
    required this.ownerPhoneNumber,
    required this.ownerName,
    required this.phoneNumber,
    required this.mcc,
    this.detail1,
    this.detail2,
    this.id,
    this.creatorId,
    this.businessTitle,
    this.userId,
    this.bankAccountId,
  });

  factory UMerchantCreateParams.fromJson(String str) => UMerchantCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UMerchantCreateParams.fromMap(Map<String, dynamic> json) => UMerchantCreateParams(
    detail1: json["detail1"],
    detail2: json["detail2"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    creatorId: json["creatorId"],
    zipCode: json["zipCode"],
    userId: json["userId"],
    businessTitle: json["businessTitle"],
    cityCode: json["cityCode"],
    address: json["address"],
    phoneNumber: json["phoneNumber"],
    title: json["title"],
    landline: json["landline"],
    nationalCode: json["nationalCode"],
    ownerPhoneNumber: json["ownerPhoneNumber"],
    ownerName: json["ownerName"],
    bankAccountId: json["bankAccountId"],
    mcc: json["mcc"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "detail1": detail1,
    "detail2": detail2,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "id": id,
    "creatorId": creatorId,
    "zipCode": zipCode,
    "userId": userId,
    "businessTitle": businessTitle,
    "cityCode": cityCode,
    "address": address,
    "phoneNumber": phoneNumber,
    "title": title,
    "landline": landline,
    "nationalCode": nationalCode,
    "ownerPhoneNumber": ownerPhoneNumber,
    "ownerName": ownerName,
    "bankAccountId": bankAccountId,
    "mcc": mcc,
  };
}

class UMerchantReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? creatorId;
  final String? zipCode;
  final String? userId;
  final String? cityCode;
  final String? phoneNumber;
  final String? title;
  final String? landline;
  final String? nationalCode;
  final String? bankAccountId;
  final String? mcc;
  final String? merchantId;
  final String? insId;

  UMerchantReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.ids,
    this.creatorId,
    this.zipCode,
    this.userId,
    this.cityCode,
    this.phoneNumber,
    this.title,
    this.landline,
    this.nationalCode,
    this.bankAccountId,
    this.mcc,
    this.merchantId,
    this.insId,
  });

  factory UMerchantReadParams.fromJson(String str) => UMerchantReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UMerchantReadParams.fromMap(Map<String, dynamic> json) => UMerchantReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    creatorId: json["creatorId"],
    zipCode: json["zipCode"],
    userId: json["userId"],
    cityCode: json["cityCode"],
    phoneNumber: json["phoneNumber"],
    title: json["title"],
    landline: json["landline"],
    nationalCode: json["nationalCode"],
    bankAccountId: json["bankAccountId"],
    mcc: json["mcc"],
    merchantId: json["merchantId"],
    insId: json["insId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "creatorId": creatorId,
    "zipCode": zipCode,
    "userId": userId,
    "cityCode": cityCode,
    "phoneNumber": phoneNumber,
    "title": title,
    "landline": landline,
    "nationalCode": nationalCode,
    "bankAccountId": bankAccountId,
    "mcc": mcc,
    "merchantId": merchantId,
    "insId": insId,
  };
}
