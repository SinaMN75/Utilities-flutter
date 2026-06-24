part of "../data.dart";

class UBedCreateParams {
  final String? id;
  final String? detail1;
  final String? detail2;
  final String? creatorId;
  final double deposit;
  final double rent;
  final String? parentId;
  final List<int> tags;

  UBedCreateParams({
    required this.tags,
    required this.deposit,
    required this.rent,
    this.id,
    this.detail1,
    this.detail2,
    this.creatorId,
    this.parentId,
  });

  factory UBedCreateParams.fromJson(String str) => UBedCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UBedCreateParams.fromMap(Map<String, dynamic> json) => UBedCreateParams(
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    deposit: (json["deposit"] as num).toDouble(),
    rent: (json["rent"] as num).toDouble(),
    id: json["id"],
    detail1: json["detail1"],
    detail2: json["detail2"],
    creatorId: json["creatorId"],
    parentId: json["parentId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "deposit": deposit,
    "rent": rent,
    "id": id,
    "detail1": detail1,
    "detail2": detail2,
    "creatorId": creatorId,
    "parentId": parentId,
  };
}

class UBedUpdateParams {
  final String id;
  final String? detail1;
  final String? detail2;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final double? deposit;
  final double? rent;
  final String? parentId;
  final List<String>? media;

  UBedUpdateParams({
    required this.id,
    this.addTags,
    this.removeTags,
    this.detail1,
    this.detail2,
    this.tags,
    this.deposit,
    this.rent,
    this.parentId,
    this.media,
  });

  factory UBedUpdateParams.fromJson(String str) => UBedUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UBedUpdateParams.fromMap(Map<String, dynamic> json) => UBedUpdateParams(
    id: json["id"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    deposit: json["deposit"] == null ? null : (json["deposit"] as num).toDouble(),
    rent: json["rent"] == null ? null : (json["rent"] as num).toDouble(),
    detail1: json["detail1"],
    detail2: json["detail2"],
    parentId: json["parentId"],
    media: json["media"] == null ? <String>[] : List<String>.from(json["media"]!.map((dynamic x) => x)),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "deposit": deposit,
    "rent": rent,
    "detail1": detail1,
    "detail2": detail2,
    "parentId": parentId,
    "media": media == null ? <dynamic>[] : List<dynamic>.from(media!.map((String x) => x)),
  };
}

class UBedReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final List<int>? tags;
  final List<String>? ids;
  final String? creatorId;
  final double? deposit;
  final double? rent;
  final String? parentId;
  final BedSelectorArgs? selectorArgs;

  UBedReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.tags,
    this.ids,
    this.creatorId,
    this.deposit,
    this.rent,
    this.parentId,
    this.selectorArgs,
  });

  factory UBedReadParams.fromJson(String str) => UBedReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UBedReadParams.fromMap(Map<String, dynamic> json) => UBedReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    creatorId: json["creatorId"],
    deposit: json["deposit"] == null ? null : (json["deposit"] as num).toDouble(),
    rent: json["rent"] == null ? null : (json["rent"] as num).toDouble(),
    parentId: json["parentId"],
    selectorArgs: json["selectorArgs"] == null ? null : BedSelectorArgs.fromMap(json["selectorArgs"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "creatorId": creatorId,
    "deposit": deposit,
    "rent": rent,
    "parentId": parentId,
    "selectorArgs": selectorArgs?.toMap(),
  };
}
