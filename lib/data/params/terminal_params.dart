part of "../data.dart";

class UTerminalCreateParams {
  final List<int> tags;
  final String? id;
  final String? simCardNumber;
  final String? serial;
  final String? simCardSerial;
  final String? imei;
  final String? terminalId;

  UTerminalCreateParams({
    required this.tags,
    this.id,
    this.simCardNumber,
    this.serial,
    this.simCardSerial,
    this.imei,
    this.terminalId,
  });

  factory UTerminalCreateParams.fromJson(String str) => UTerminalCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UTerminalCreateParams.fromMap(Map<String, dynamic> json) => UTerminalCreateParams(
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    serial: json["serial"],
    simCardNumber: json["simCardNumber"],
    simCardSerial: json["simCardSerial"],
    imei: json["imei"],
    terminalId: json["terminalId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "serial": serial,
    "simCardNumber": simCardNumber,
    "simCardSerial": simCardSerial,
    "imei": imei,
    "terminalId": terminalId,
  };
}

class UTerminalAssignParams {
  final String? serial;
  final String? simCardSerial;
  final String? merchantId;
  final String? title;

  UTerminalAssignParams({
    this.serial,
    this.simCardSerial,
    this.merchantId,
    this.title,
  });

  factory UTerminalAssignParams.fromJson(String str) => UTerminalAssignParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UTerminalAssignParams.fromMap(Map<String, dynamic> json) => UTerminalAssignParams(
    serial: json["serial"],
    simCardSerial: json["simCardSerial"],
    merchantId: json["merchantId"],
    title: json["title"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "serial": serial,
    "simCardSerial": simCardSerial,
    "merchantId": merchantId,
    "title": title,
  };
}

class UTerminalReadParams {
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
  final String? serial;
  final String? merchantId;
  final TerminalSelectorArgs? selectorArgs;

  UTerminalReadParams({
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
    this.serial,
    this.merchantId,
  });

  factory UTerminalReadParams.fromJson(String str) => UTerminalReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UTerminalReadParams.fromMap(Map<String, dynamic> json) => UTerminalReadParams(
    pageSize: json["pageSize"],
    serial: json["serial"],
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
    merchantId: json["merchantId"],
    selectorArgs: json["selectorArgs"] == null ? null : TerminalSelectorArgs.fromMap(json["selectorArgs"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "serial": serial,
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
    "merchantId": merchantId,
    "selectorArgs": selectorArgs?.toMap(),
  };
}
