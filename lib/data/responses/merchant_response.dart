part of "../data.dart";

class UMerchantResponse {
  final String? id;
  final DateTime? createdAt;
  final MerchantJsonData? jsonData;
  final List<int>? tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String? zipCode;
  final String? cityCode;
  final String? phoneNumber;
  final String? title;
  final String? landline;
  final String? nationalCode;
  final String? bankAccountId;
  final String? mcc;
  final String? merchantId;
  final String? insId;
  final String? userId;
  final UUserResponse? user;
  final List<UTerminalResponse>? terminals;

  // final List<Agreement>? agreements;

  UMerchantResponse({
    this.id,
    this.createdAt,
    this.jsonData,
    this.tags,
    this.creator,
    this.creatorId,
    this.zipCode,
    this.cityCode,
    this.phoneNumber,
    this.title,
    this.landline,
    this.nationalCode,
    this.bankAccountId,
    this.mcc,
    this.merchantId,
    this.insId,
    this.userId,
    this.user,
    this.terminals,
    // this.agreements,
  });

  factory UMerchantResponse.fromJson(String str) => UMerchantResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UMerchantResponse.fromMap(Map<String, dynamic> json) => UMerchantResponse(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    jsonData: json["jsonData"] == null ? null : MerchantJsonData.fromMap(json["jsonData"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    zipCode: json["zipCode"],
    cityCode: json["cityCode"],
    phoneNumber: json["phoneNumber"],
    title: json["title"],
    landline: json["landline"],
    nationalCode: json["nationalCode"],
    bankAccountId: json["bankAccountId"],
    mcc: json["mcc"],
    merchantId: json["merchantId"],
    insId: json["insId"],
    userId: json["userId"],
    user: json["user"] == null ? null : UUserResponse.fromMap(json["user"]),
    terminals: json["terminals"] == null ? <UTerminalResponse>[] : List<UTerminalResponse>.from(json["terminals"]!.map((dynamic x) => UTerminalResponse.fromMap(x))),
    // agreements: json["agreements"] == null ? <dynamic>[] : List<Agreement>.from(json["agreements"]!.map((x) => Agreement.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "jsonData": jsonData?.toMap(),
    "tags": tags == null ? <int>[] : List<int>.from(tags!.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "zipCode": zipCode,
    "cityCode": cityCode,
    "phoneNumber": phoneNumber,
    "title": title,
    "landline": landline,
    "nationalCode": nationalCode,
    "bankAccountId": bankAccountId,
    "mcc": mcc,
    "merchantId": merchantId,
    "insId": insId,
    "userId": userId,
    "user": user?.toMap(),
    "terminals": terminals == null ? <UTerminalResponse>[] : List<UTerminalResponse>.from(terminals!.map((UTerminalResponse x) => x.toMap())),
    // "agreements": agreements == null ? <dynamic>[] : List<dynamic>.from(agreements!.map((Object? x) => x.toMap())),
  };
}

class MerchantJsonData {
  final String? detail1;
  final String? detail2;
  final String? businessTitle;
  final String? address;
  final String? ownerPhoneNumber;
  final int? definitionTemplate;
  final int? settlementCurrency;
  final String? ownerName;

  MerchantJsonData({
    this.detail1,
    this.detail2,
    this.businessTitle,
    this.address,
    this.ownerPhoneNumber,
    this.definitionTemplate,
    this.settlementCurrency,
    this.ownerName,
  });

  factory MerchantJsonData.fromJson(String str) => MerchantJsonData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MerchantJsonData.fromMap(Map<String, dynamic> json) => MerchantJsonData(
    detail1: json["detail1"],
    detail2: json["detail2"],
    businessTitle: json["businessTitle"],
    address: json["address"],
    ownerPhoneNumber: json["ownerPhoneNumber"],
    definitionTemplate: json["definitionTemplate"],
    settlementCurrency: json["settlementCurrency"],
    ownerName: json["ownerName"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "detail1": detail1,
    "detail2": detail2,
    "businessTitle": businessTitle,
    "address": address,
    "ownerPhoneNumber": ownerPhoneNumber,
    "definitionTemplate": definitionTemplate,
    "settlementCurrency": settlementCurrency,
    "ownerName": ownerName,
  };
}
