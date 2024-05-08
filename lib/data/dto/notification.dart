part of '../data.dart';

class NotificationReadDto {
  NotificationReadDto({
    this.id,
    this.title,
    this.message,
    this.createdAt,
    this.visited,
    this.link,
    this.seenStatus,
    this.tagUseCase,
    this.creatorUser,
    this.product,
    this.tags,
    this.media,
  });

  final String? id;
  final String? title;
  final String? message;
  final String? createdAt;
  final bool? visited;
  final String? link;
  final int? tagUseCase;
  final int? seenStatus;
  List<int>? tags;
  final UserReadDto? creatorUser;
  final ProductReadDto? product;
  final List<MediaReadDto>? media;

  factory NotificationReadDto.fromJson(String str) => NotificationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory NotificationReadDto.fromMap(dynamic json) => NotificationReadDto(
    id: json["id"],
    title: json["title"],
    message: json["message"],
    createdAt: json["createdAt"],
    visited: json["visited"],
    link: json["link"],
    seenStatus: json["seenStatus"],
    tagUseCase: json["tagUseCase"],
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
    product: json["product"] == null ? null : ProductReadDto.fromMap(json["product"]),
    creatorUser: json["creatorUser"] == null ? null : UserReadDto.fromMap(json["creatorUser"]),
    media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
  );

  dynamic toMap() => {
    "id": id,
    "title": title,
    "message": message,
    "createdAt": createdAt,
    "visited": visited,
    "link": link,
    "seenStatus": seenStatus,
    "tagUseCase": tagUseCase,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
    "product": product == null ? null : product!.toMap(),
    "creatorUser": creatorUser == null ? null : creatorUser!.toMap(),
    "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
  };
}

class NotificationFilterReadDto {
  NotificationFilterReadDto({
    this.title,
    this.userId,
    this.creatorUserId,
    this.message,
    this.tagUseCase,
    this.pageSize,
    this.tags,
    this.pageNumber,
    this.showMedia,
    this.showProduct,
    this.showComment,
    this.showCreator,
    this.showUser,
    this.showChatMessage,
    this.showGroupChat,
  });

  final bool? showMedia;
  final bool? showProduct;
  final bool? showComment;
  final bool? showCreator;
  final bool? showUser;
  final bool? showChatMessage;
  final bool? showGroupChat;
  final String? title;
  final String? userId;
  final String? creatorUserId;
  final String? message;
  final int? tagUseCase;
  final int? pageSize;
  List<int>? tags;
  final int? pageNumber;

  factory NotificationFilterReadDto.fromJson(String str) => NotificationFilterReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory NotificationFilterReadDto.fromMap(dynamic json) => NotificationFilterReadDto(
    title: json["title"],
    userId: json["userId"],
    creatorUserId: json["creatorUserId"],
    message: json["message"],
    tagUseCase: json["tagUseCase"],
    pageSize: json["pageSize"],
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
    pageNumber: json["pageNumber"],
    showMedia: json["showMedia"],
    showProduct: json["showProduct"],
    showComment: json["showComment"],
    showCreator: json["showCreator"],
    showUser: json["showUser"],
    showChatMessage: json["showChatMessage"],
    showGroupChat: json["showGroupChat"],
  );

  dynamic toMap() => {
    "title": title,
    "userId": userId,
    "creatorUserId": creatorUserId,
    "message": message,
    "tagUseCase": tagUseCase,
    "pageSize": pageSize,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
    "pageNumber": pageNumber,
    "showMedia": showMedia,
    "showProduct": showProduct,
    "showCreator": showCreator,
    "showUser": showUser,
    "showChatMessage": showChatMessage,
    "showGroupChat": showGroupChat,
  };
}
