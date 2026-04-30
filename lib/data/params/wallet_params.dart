part of "../data.dart";

class UWalletReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? userId;
  final WalletSelectorArgs? selectorArgs;

  UWalletReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.ids,
    this.userId,
    this.selectorArgs,
  });

  factory UWalletReadParams.fromJson(String str) => UWalletReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UWalletReadParams.fromMap(Map<String, dynamic> json) => UWalletReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    userId: json["userId"],
    selectorArgs: json["selectorArgs"] == null ? null : WalletSelectorArgs.fromMap(json["selectorArgs"]),
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
    "userId": userId,
    "selectorArgs": selectorArgs?.toMap(),
  };
}

class UWalletTxnReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? userId;
  final WalletSelectorArgs? selectorArgs;

  UWalletTxnReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.ids,
    this.userId,
    this.selectorArgs,
  });

  factory UWalletTxnReadParams.fromJson(String str) => UWalletTxnReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UWalletTxnReadParams.fromMap(Map<String, dynamic> json) => UWalletTxnReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    userId: json["userId"],
    selectorArgs: json["selectorArgs"] == null ? null : WalletSelectorArgs.fromMap(json["selectorArgs"]),
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
    "userId": userId,
    "selectorArgs": selectorArgs?.toMap(),
  };
}
