part of "../data.dart";

class USimCreateParams {
  final String? apiKey;
  final String? token;
  final String? detail1;
  final String? detail2;
  final List<int>? tags;
  final String? id;
  final String? creatorId;
  final String? number;
  final String? serial;

  USimCreateParams({
    this.apiKey,
    this.token,
    this.detail1,
    this.detail2,
    this.tags,
    this.id,
    this.creatorId,
    this.number,
    this.serial,
  });

  factory USimCreateParams.fromJson(String str) => USimCreateParams.fromJson(json.decode(str));

  String toJson() => json.encode(toJson());

  factory USimCreateParams.fromMap(Map<String, dynamic> json) => USimCreateParams(
    apiKey: json["apiKey"],
    token: json["token"],
    detail1: json["detail1"],
    detail2: json["detail2"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    creatorId: json["creatorId"],
    number: json["number"],
    serial: json["serial"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "apiKey": apiKey,
    "token": token,
    "detail1": detail1,
    "detail2": detail2,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "id": id,
    "creatorId": creatorId,
    "number": number,
    "serial": serial,
  };
}

class USimReadParams {
  final String? apiKey;
  final String? token;
  final int? pageSize;
  final int? pageNumber;
  final String? fromCreatedAt;
  final String? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? creatorId;
  final SimSelectorArgs? selectorArgs;

  USimReadParams({
    this.apiKey,
    this.token,
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.ids,
    this.creatorId,
    this.selectorArgs,
  });

  factory USimReadParams.fromJson(String str) => USimReadParams.fromJson(json.decode(str));

  String toJson() => json.encode(toJson());

  factory USimReadParams.fromMap(Map<String, dynamic> json) => USimReadParams(
    apiKey: json["apiKey"],
    token: json["token"],
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"],
    toCreatedAt: json["toCreatedAt"],
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    creatorId: json["creatorId"],
    selectorArgs: json["selectorArgs"] == null ? null : SimSelectorArgs.fromJson(json["selectorArgs"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "apiKey": apiKey,
    "token": token,
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt,
    "toCreatedAt": toCreatedAt,
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "creatorId": creatorId,
    "selectorArgs": selectorArgs?.toJson(),
  };
}

class USimUpdateParams {
  final String? apiKey;
  final String? token;
  final String? id;
  final String? detail1;
  final String? detail2;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final String? number;
  final String? serial;

  USimUpdateParams({
    this.apiKey,
    this.token,
    this.id,
    this.detail1,
    this.detail2,
    this.addTags,
    this.removeTags,
    this.tags,
    this.number,
    this.serial,
  });

  factory USimUpdateParams.fromJson(String str) => USimUpdateParams.fromJson(json.decode(str));

  String toJson() => json.encode(toJson());

  factory USimUpdateParams.fromMap(Map<String, dynamic> json) => USimUpdateParams(
    apiKey: json["apiKey"],
    token: json["token"],
    id: json["id"],
    detail1: json["detail1"],
    detail2: json["detail2"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    number: json["number"],
    serial: json["serial"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "apiKey": apiKey,
    "token": token,
    "id": id,
    "detail1": detail1,
    "detail2": detail2,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "number": number,
    "serial": serial,
  };
}
