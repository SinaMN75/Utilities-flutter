import 'package:utilities/utilities.dart';

class NotificationReadDto {
  NotificationReadDto({
    this.id,
    this.title,
    this.message,
    this.createdAt,
    this.visited,
    this.link,
    this.seenStatus,
    this.useCase,
    this.creatorUser,
    this.media,
  });

  final String? id;
  final String? title;
  final String? message;
  final String? createdAt;
  final bool? visited;
  final String? link;
  final String? useCase;
  final int? seenStatus;
  final UserReadDto? creatorUser;
  final List<MediaReadDto>? media;

  factory NotificationReadDto.fromJson(String str) => NotificationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationReadDto.fromMap(Map<String, dynamic> json) => NotificationReadDto(
        id: json["id"],
        title: json["title"],
        message: json["message"],
        createdAt: json["createdAt"],
        visited: json["visited"],
        link: json["link"],
        seenStatus: json["seenStatus"],
        useCase: json["useCase"],
        creatorUser: json["creatorUser"] == null ? null : UserReadDto.fromMap(json["creatorUser"]),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "message": message,
        "createdAt": createdAt,
        "visited": visited,
        "link": link,
        "seenStatus": seenStatus,
        "useCase": useCase,
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
    this.useCase,
    this.pageSize,
    this.pageNumber,
  });

  final String? title;
  final String? userId;
  final String? creatorUserId;
  final String? message;
  final String? useCase;
  final int? pageSize;
  final int? pageNumber;

  factory NotificationFilterReadDto.fromJson(String str) => NotificationFilterReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationFilterReadDto.fromMap(Map<String, dynamic> json) => NotificationFilterReadDto(
        title: json["title"],
        userId: json["userId"],
        creatorUserId: json["creatorUserId"],
        message: json["message"],
        useCase: json["useCase"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "userId": userId,
        "creatorUserId": creatorUserId,
        "message": message,
        "useCase": useCase,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
      };
}
