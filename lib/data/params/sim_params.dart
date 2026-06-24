part of "../data.dart";

class USimCreateParams {
  final String number;
  final List<int> tags;
  final String? id;
  final String? serial;

  USimCreateParams({
    required this.number,
    required this.tags,
    this.id,
    this.serial,
  });

  factory USimCreateParams.fromJson(String str) => USimCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory USimCreateParams.fromMap(Map<String, dynamic> json) => USimCreateParams(
    number: json["number"],
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    serial: json["serial"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "number": number,
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "serial": serial,
  };
}

class USimReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final List<int>? tags;
  final List<String>? ids;
  final String? creatorId;
  final SimSelectorArgs? selectorArgs;

  USimReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.tags,
    this.ids,
    this.creatorId,
    this.selectorArgs,
  });

  factory USimReadParams.fromJson(String str) => USimReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory USimReadParams.fromMap(Map<String, dynamic> json) => USimReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    creatorId: json["creatorId"],
    selectorArgs: json["selectorArgs"] == null ? null : SimSelectorArgs.fromMap(json["selectorArgs"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "creatorId": creatorId,
    "selectorArgs": selectorArgs?.toMap(),
  };
}

class USimUpdateParams {
  final String id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final String? number;
  final String? serial;

  USimUpdateParams({
    required this.id,
    this.addTags,
    this.removeTags,
    this.tags,
    this.number,
    this.serial,
  });

  factory USimUpdateParams.fromJson(String str) => USimUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory USimUpdateParams.fromMap(Map<String, dynamic> json) => USimUpdateParams(
    id: json["id"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    number: json["number"],
    serial: json["serial"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "number": number,
    "serial": serial,
  };
}
