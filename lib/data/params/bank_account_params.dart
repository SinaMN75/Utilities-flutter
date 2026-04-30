part of "../data.dart";

class UBankAccountCreateParams {
  final String? cardNumber;
  final List<int> tags;
  final String? id;
  final String? accountNumber;
  final String? iBanNumber;
  final String? bankName;
  final String? ownerName;

  UBankAccountCreateParams({
    required this.tags,
    this.cardNumber,
    this.id,
    this.accountNumber,
    this.bankName,
    this.ownerName,
    this.iBanNumber,
  });

  factory UBankAccountCreateParams.fromJson(String str) => UBankAccountCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UBankAccountCreateParams.fromMap(Map<String, dynamic> json) => UBankAccountCreateParams(
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    cardNumber: json["cardNumber"],
    accountNumber: json["accountNumber"],
    iBanNumber: json["iBanNumber"],
    bankName: json["bankName"],
    ownerName: json["ownerName"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "cardNumber": cardNumber,
    "accountNumber": accountNumber,
    "iBanNumber": iBanNumber,
    "bankName": bankName,
    "ownerName": ownerName,
  };
}

class UBankAccountUpdateParams {
  final String id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final String? cardNumber;
  final String? accountNumber;
  final String? iBanNumber;

  UBankAccountUpdateParams({
    required this.id,
    this.addTags,
    this.removeTags,
    this.tags,
    this.cardNumber,
    this.accountNumber,
    this.iBanNumber,
  });

  factory UBankAccountUpdateParams.fromJson(String str) => UBankAccountUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UBankAccountUpdateParams.fromMap(Map<String, dynamic> json) => UBankAccountUpdateParams(
    id: json["id"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    cardNumber: json["cardNumber"],
    accountNumber: json["accountNumber"],
    iBanNumber: json["iBanNumber"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "cardNumber": cardNumber,
    "accountNumber": accountNumber,
    "iBanNumber": iBanNumber,
  };
}

class UBankAccountReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final bool? orderByOrder;
  final bool? orderByOrderDesc;
  final String? creatorId;
  final BankAccountSelectorArgs? selectorArgs;

  UBankAccountReadParams({
    required this.selectorArgs,
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.ids,
    this.orderByOrder,
    this.orderByOrderDesc,
    this.creatorId,
  });

  factory UBankAccountReadParams.fromJson(String str) => UBankAccountReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UBankAccountReadParams.fromMap(Map<String, dynamic> json) => UBankAccountReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    orderByOrder: json["orderByOrder"],
    orderByOrderDesc: json["orderByOrderDesc"],
    creatorId: json["creatorId"],
    selectorArgs: json["selectorArgs"] == null ? null : BankAccountSelectorArgs.fromMap(json["selectorArgs"]),
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
    "orderByOrder": orderByOrder,
    "orderByOrderDesc": orderByOrderDesc,
    "creatorId": creatorId,
    "selectorArgs": selectorArgs?.toMap(),
  };
}
