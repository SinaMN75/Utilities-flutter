import 'package:utilities/utilities.dart';

class ChatReadDto {
  ChatReadDto({
    this.id,
    this.userId,
    this.messageText,
    this.fullName,
    this.dateTime,
    this.profileImage,
    this.send,
    this.media,
    this.user,
    this.parent,
    this.phoneNumber,
    this.unReadMessages,
    this.products,
  });

  final String? id;
  final String? userId;
  final String? messageText;
  final String? fullName;
  final String? dateTime;
  final String? profileImage;
  final String? phoneNumber;
  int? unReadMessages;
  final bool? send;
  final UserReadDto? user;
  final ChatReadDto? parent;
  final List<MediaReadDto>? media;
  final List<ProductReadDto>? products;

  factory ChatReadDto.fromJson(String str) => ChatReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatReadDto.fromMap(Map<String, dynamic> json) => ChatReadDto(
        id: json["id"],
        userId: json["userId"],
        messageText: json["messageText"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        unReadMessages: json["unReadMessages"],
        dateTime: json["dateTime"],
        profileImage: json["profileImage"],
        send: json["send"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        parent: json["parent"] == null ? null : ChatReadDto.fromMap(json["parent"]),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
        products: json["products"] == null ? null : List<ProductReadDto>.from(json["products"].map((x) => ProductReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "messageText": messageText,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "unReadMessages": unReadMessages,
        "dateTime": dateTime,
        "send": send,
        "user": user == null ? null : user!.toMap(),
        "parent": parent == null ? null : parent!.toMap(),
        "profileImage": profileImage == null ? null : profileImage,
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
        "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toMap())),
      };
}

class ChatCreateDto {
  ChatCreateDto({
    this.id,
    this.userId,
    this.messageText,
    this.products,
    this.parentId,
    this.users,
  });

  final String? id;
  final String? userId;
  final String? messageText;
  final String? parentId;
  final List<String>? products;
  final List<String>? users;

  factory ChatCreateDto.fromJson(String str) => ChatCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatCreateDto.fromMap(Map<String, dynamic> json) => ChatCreateDto(
        id: json["id"],
        userId: json["userId"],
        messageText: json["messageText"],
        parentId: json["parentId"],
        products: json["products"],
        users: json["users"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "messageText": messageText,
        "parentId": parentId,
        "products": products,
        "users": users,
      };
}
