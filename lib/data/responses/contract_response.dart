part of "../data.dart";

class UContractResponse {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final UContractJsonData jsonData;
  final List<int> tags;
  final DateTime startDate;
  final DateTime endDate;
  final double? deposit;
  final double? rent;
  final UUserResponse? user;
  final String? userId;
  final UUserResponse? creator;
  final String? creatorId;
  final UProductResponse? product;
  final String? productId;
  final List<UInvoiceResponse>? invoices;

  UContractResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.startDate,
    required this.endDate,
    this.deletedAt,
    this.deposit,
    this.rent,
    this.user,
    this.userId,
    this.creator,
    this.creatorId,
    this.product,
    this.productId,
    this.invoices,
  });

  factory UContractResponse.fromJson(String str) => UContractResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UContractResponse.fromMap(Map<String, dynamic> json) => UContractResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
        jsonData: UContractJsonData.fromMap(json["jsonData"]),
        tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
    deposit: json["deposit"].toString().toDouble(),
    rent: json["rent"].toString().toDouble(),
    user: json["user"] == null ? null : UUserResponse.fromMap(json["user"]),
        userId: json["userId"],
        creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
        creatorId: json["creatorId"],
        product: json["product"] == null ? null : UProductResponse.fromMap(json["product"]),
        productId: json["productId"],
        invoices: json["invoices"] == null ? <UInvoiceResponse>[] : List<UInvoiceResponse>.from(json["invoices"]!.map((dynamic x) => UInvoiceResponse.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt?.toIso8601String(),
        "jsonData": jsonData.toMap(),
        "tags": List<dynamic>.from(tags.map((int x) => x)),
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
    "deposit": deposit,
    "rent": rent,
    "user": user?.toMap(),
        "userId": userId,
        "creator": creator?.toMap(),
        "creatorId": creatorId,
        "product": product?.toMap(),
        "productId": productId,
        "invoices": invoices == null ? <dynamic>[] : List<dynamic>.from(invoices!.map((UInvoiceResponse x) => x.toMap())),
      };
}

class UContractJsonData {
  final String? description;

  UContractJsonData({
    this.description,
  });

  factory UContractJsonData.fromJson(String str) => UContractJsonData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UContractJsonData.fromMap(Map<String, dynamic> json) => UContractJsonData(
        description: json["description"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "description": description,
      };
}
