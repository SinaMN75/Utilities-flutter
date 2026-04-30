part of "../data.dart";

class UNotificationCreateParams {
  final List<int> tags;
  final String? id;
  final String? detail1;
  final String? detail2;
  final String? userId;

  UNotificationCreateParams({
    required this.tags,
    this.id,
    this.detail1,
    this.userId,
    this.detail2,
  });

  factory UNotificationCreateParams.fromJson(String str) => UNotificationCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UNotificationCreateParams.fromMap(Map<String, dynamic> json) => UNotificationCreateParams(
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    detail1: json["detail1"],
    detail2: json["detail2"],
    userId: json["userId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "detail1": detail1,
    "detail2": detail2,
    "userId": userId,
  };
}

class UNotificationUpdateParams {
  final String id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final String? detail1;
  final String? detail2;

  UNotificationUpdateParams({
    required this.id,
    this.addTags,
    this.removeTags,
    this.tags,
    this.detail1,
    this.detail2,
  });

  factory UNotificationUpdateParams.fromJson(String str) => UNotificationUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UNotificationUpdateParams.fromMap(Map<String, dynamic> json) => UNotificationUpdateParams(
    id: json["id"],
    addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    detail1: json["detail1"],
    detail2: json["detail2"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "detail1": detail1,
    "detail2": detail2,
  };
}

class UNotificationReadParams {
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
  final String? userId;
  final NotificationSelectorArgs? selectorArgs;

  UNotificationReadParams({
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
    this.userId,
  });

  factory UNotificationReadParams.fromJson(String str) => UNotificationReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UNotificationReadParams.fromMap(Map<String, dynamic> json) => UNotificationReadParams(
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
    userId: json["userId"],
    selectorArgs: json["selectorArgs"] == null ? null : NotificationSelectorArgs.fromMap(json["selectorArgs"]),
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
    "userId": userId,
    "selectorArgs": selectorArgs?.toMap(),
  };
}
