part of "../data.dart";

class UTicketCreateParams {
  final String title;
  final String description;
  final List<int> tags;
  final String? instagram;
  final String? telegram;
  final String? whatsapp;
  final String? phone;

  UTicketCreateParams({
    required this.title,
    required this.description,
    required this.tags,
    this.instagram,
    this.telegram,
    this.whatsapp,
    this.phone,
  });

  factory UTicketCreateParams.fromJson(String str) => UTicketCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UTicketCreateParams.fromMap(Map<String, dynamic> json) => UTicketCreateParams(
    title: json["title"],
    description: json["description"],
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    instagram: json["instagram"],
    telegram: json["telegram"],
    whatsapp: json["whatsapp"],
    phone: json["phone"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "title": title,
    "description": description,
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "instagram": instagram,
    "telegram": telegram,
    "whatsapp": whatsapp,
    "phone": phone,
  };
}

class UTicketUpdateParams {
  final String id;
  final String? title;
  final String? description;
  final String? instagram;
  final String? telegram;
  final String? whatsapp;
  final String? phone;
  final List<int>? addTags;
  final List<int>? removeTags;

  UTicketUpdateParams({
    required this.id,
    this.title,
    this.description,
    this.instagram,
    this.telegram,
    this.whatsapp,
    this.phone,
    this.addTags,
    this.removeTags,
  });

  factory UTicketUpdateParams.fromJson(String str) => UTicketUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UTicketUpdateParams.fromMap(Map<String, dynamic> json) => UTicketUpdateParams(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    instagram: json["instagram"],
    telegram: json["telegram"],
    whatsapp: json["whatsapp"],
    phone: json["phone"],
    addTags: json["addTags"] == null ? null : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? null : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "title": title,
    "description": description,
    "instagram": instagram,
    "telegram": telegram,
    "whatsapp": whatsapp,
    "phone": phone,
    "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((int x) => x)),
  };
}

class UTicketReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final TicketSelectorArgs? selectorArgs;

  UTicketReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.ids,
    this.selectorArgs,
  });

  factory UTicketReadParams.fromJson(String str) => UTicketReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UTicketReadParams.fromMap(Map<String, dynamic> json) => UTicketReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    selectorArgs: json["selectorArgs"] == null ? null : TicketSelectorArgs.fromMap(json["selectorArgs"]),
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
    "selectorArgs": selectorArgs?.toMap(),
  };
}
