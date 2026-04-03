part of "../data.dart";

class UTerminalCreateParams {
  final String title;
  final List<int> tags;
  final String? id;
  final String? simCardNumber;
  final String? simCardSerial;
  final String? imei;

  UTerminalCreateParams({
    required this.title,
    required this.tags,
    this.id,
    this.simCardNumber,
    this.simCardSerial,
    this.imei,
  });

  factory UTerminalCreateParams.fromJson(String str) => UTerminalCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UTerminalCreateParams.fromMap(Map<String, dynamic> json) => UTerminalCreateParams(
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    title: json["title"],
    simCardNumber: json["simCardNumber"],
    simCardSerial: json["simCardSerial"],
    imei: json["imei"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "title": title,
    "simCardNumber": simCardNumber,
    "simCardSerial": simCardSerial,
    "imei": imei,
  };
}

class UTerminalUpdateParams {
  final String id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final String? simCardNumber;
  final String? simCardSerial;
  final String? imei;

  UTerminalUpdateParams({
    required this.id,
    this.addTags,
    this.removeTags,
    this.tags,
    this.simCardNumber,
    this.simCardSerial,
    this.imei,
  });

  factory UTerminalUpdateParams.fromJson(String str) => UTerminalUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UTerminalUpdateParams.fromMap(Map<String, dynamic> json) => UTerminalUpdateParams(
    id: json["id"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    simCardNumber: json["simCardNumber"],
    simCardSerial: json["simCardSerial"],
    imei: json["imei"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "simCardNumber": simCardNumber,
    "simCardSerial": simCardSerial,
    "imei": imei,
  };
}

class UTerminalReadParams {
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
  final bool? orderByOrder;
  final bool? orderByOrderDesc;
  final String? creatorId;
  final AddressSelectorArgs? selectorArgs;

  UTerminalReadParams({
    required this.selectorArgs,
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
    this.orderByOrder,
    this.orderByOrderDesc,
    this.creatorId,
  });

  factory UTerminalReadParams.fromJson(String str) => UTerminalReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UTerminalReadParams.fromMap(Map<String, dynamic> json) => UTerminalReadParams(
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
    orderByOrder: json["orderByOrder"],
    orderByOrderDesc: json["orderByOrderDesc"],
    creatorId: json["creatorId"],
    selectorArgs: json["selectorArgs"] == null ? null : AddressSelectorArgs.fromMap(json["selectorArgs"]),
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
    "orderByOrder": orderByOrder,
    "orderByOrderDesc": orderByOrderDesc,
    "creatorId": creatorId,
    "selectorArgs": selectorArgs?.toMap(),
  };
}
