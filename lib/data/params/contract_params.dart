part of "../data.dart";

class UContractCreateParams {
  final List<int> tags;
  final String? id;
  final DateTime startDate;
  final DateTime endDate;
  final double? price1;
  final double? price2;
  final String? userId;
  final String? productId;
  final String? description;

  UContractCreateParams({
    required this.tags,
    required this.startDate,
    required this.endDate,
    this.id,
    this.price1,
    this.price2,
    this.userId,
    this.productId,
    this.description,
  });

  factory UContractCreateParams.fromJson(String str) => UContractCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UContractCreateParams.fromMap(Map<String, dynamic> json) => UContractCreateParams(
        tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
        id: json["id"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
        price1: json["price1"].toString().toDouble(),
        price2: json["price2"].toString().toDouble(),
        userId: json["userId"],
        productId: json["productId"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "tags": List<dynamic>.from(tags.map((int x) => x)),
        "id": id,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
        "price1": price1,
        "price2": price2,
        "userId": userId,
        "productId": productId,
        "description": description,
      };
}

class UContractReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? userId;
  final String? creatorId;
  final String? productId;
  final DateTime? startDate;
  final DateTime? endDate;

  UContractReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
    this.ids,
    this.userId,
    this.creatorId,
    this.productId,
    this.startDate,
    this.endDate,
  });

  factory UContractReadParams.fromJson(String str) => UContractReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UContractReadParams.fromMap(Map<String, dynamic> json) => UContractReadParams(
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
        toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
        orderByCreatedAt: json["orderByCreatedAt"],
        orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
        orderByUpdatedAt: json["orderByUpdatedAt"],
        orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"],
        tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
        ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
        userId: json["userId"],
        creatorId: json["creatorId"],
        productId: json["productId"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "fromCreatedAt": fromCreatedAt?.toIso8601String(),
        "toCreatedAt": toCreatedAt?.toIso8601String(),
        "orderByCreatedAt": orderByCreatedAt,
        "orderByCreatedAtDesc": orderByCreatedAtDesc,
        "orderByUpdatedAt": orderByUpdatedAt,
        "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
        "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
        "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
        "userId": userId,
        "creatorId": creatorId,
        "productId": productId,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
      };
}

class UContractUpdateParams {
  final String id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? price1;
  final double? price2;

  UContractUpdateParams({
    required this.id,
    this.addTags,
    this.removeTags,
    this.tags,
    this.startDate,
    this.endDate,
    this.price1,
    this.price2,
  });

  factory UContractUpdateParams.fromJson(String str) => UContractUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UContractUpdateParams.fromMap(Map<String, dynamic> json) => UContractUpdateParams(
        id: json["id"],
        addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
        removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
        tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        price1: json["price1"].toString().toDouble(),
        price2: json["price2"].toString().toDouble(),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
        "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
        "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "price1": price1,
        "price2": price2,
      };
}
