import 'package:utilities/utilities.dart';

class ChatGroupReadDto {
  ChatGroupReadDto({
    this.id,
    this.creatorUserId,
    this.title,
    this.description,
    this.users,
    this.media,
    this.chatStatus,
    this.priority,
    this.countOfUnreadMessages,
    this.typeChat,
    this.isPrivateChat,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.groupChatMessage,
  });

  final String? id;
  final String? creatorUserId;
  final String? title;
  final String? description;
  final int? chatStatus;
  final int? priority;
  final int? countOfUnreadMessages;
  final int? typeChat;
  final bool? isPrivateChat;
  final List<UserReadDto>? users;
  final List<MediaReadDto>? media;
  final List<ProductReadDto>? products;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ChatGroupMessageReadDto>? groupChatMessage;

  factory ChatGroupReadDto.fromJson(String str) => ChatGroupReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatGroupReadDto.fromMap(Map<String, dynamic> json) => ChatGroupReadDto(
        id: json["id"],
        creatorUserId: json["creatorUserId"],
        title: json["title"],
        chatStatus: json["chatStatus"],
        priority: json["priority"],
        typeChat: json["type"],
        description: json["description"],
        isPrivateChat: json["isPrivateChat"],
        countOfUnreadMessages: json["countOfUnreadMessages"],
        users: json["users"] == null ? [] : List<UserReadDto>.from(json["users"]!.map((x) => UserReadDto.fromMap(x))),
        groupChatMessage: json["groupChatMessage"] == null ? [] : List<ChatGroupMessageReadDto>.from(json["groupChatMessage"]!.map((x) => ChatGroupMessageReadDto.fromMap(x))),
        media: json["media"] == null ? [] : List<MediaReadDto>.from(json["media"]!.map((x) => MediaReadDto.fromMap(x))),
        products: json["products"] == null ? [] : List<ProductReadDto>.from(json["products"]!.map((x) => ProductReadDto.fromMap(x))),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "creatorUserId": creatorUserId,
        "title": title,
        "chatStatus": chatStatus,
        "priority": priority,
        "type": typeChat,
        "description": description,
        "isPrivateChat": isPrivateChat,
        "countOfUnreadMessages": countOfUnreadMessages,
        "groupChatMessage": groupChatMessage == null ? [] : List<ChatGroupMessageReadDto>.from(groupChatMessage!.map((x) => x.toMap())),
        "users": users == null ? [] : List<UserReadDto>.from(users!.map((x) => x.toMap())),
        "media": media == null ? [] : List<MediaReadDto>.from(media!.map((x) => x.toMap())),
        "products": products == null ? [] : List<ProductReadDto>.from(products!.map((x) => x.toMap())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class ChatGroupCreateUpdateDto {
  ChatGroupCreateUpdateDto({
    this.id,
    this.title,
    this.description,
    this.value,
    this.typeChat,
    this.department,
    this.readIfExist,
    this.isPrivateChat,
    this.chatStatus,
    this.priority,
    this.userIds,
    this.productIds,
  });

  final String? id;
  final String? title;
  final String? description;
  final String? value;
  final int? typeChat;
  final String? department;
  final bool? readIfExist;
  final bool? isPrivateChat;
  final int? chatStatus;
  final int? priority;
  final List<String>? userIds;
  final List<String>? productIds;

  factory ChatGroupCreateUpdateDto.fromJson(String str) => ChatGroupCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatGroupCreateUpdateDto.fromMap(Map<String, dynamic> json) => ChatGroupCreateUpdateDto(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        value: json["value"],
        typeChat: json["type"],
        department: json["department"],
        readIfExist: json["readIfExist"],
        isPrivateChat: json["IsPrivateChat"],
        chatStatus: json["chatStatus"],
        priority: json["priority"],
        userIds: json["userIds"] == null ? [] : List<String>.from(json["userIds"]!.map((x) => x)),
        productIds: json["productIds"] == null ? [] : List<String>.from(json["productIds"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "value": value,
        "type": typeChat,
        "department": department,
        "readIfExist": readIfExist,
        "IsPrivateChat": isPrivateChat,
        "chatStatus": chatStatus,
        "priority": priority,
        "userIds": userIds == null ? [] : List<String>.from(userIds!.map((x) => x)),
        "productIds": productIds == null ? [] : List<String>.from(productIds!.map((x) => x)),
      };
}

class ChatGroupMessageReadDto {
  ChatGroupMessageReadDto({
    this.message,
    this.groupChatId,
    this.user,
    this.userId,
    this.media,
    this.useCase,
    this.type,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.products,
    this.parentId,
    this.forwardedMessageId,
    this.forwardedMessage,
    this.parent,
    this.messageSeenBy,
  });

  final String? message;
  final String? groupChatId;
  final UserReadDto? user;
  final String? userId;
  final String? useCase;
  final String? type;
  final List<MediaReadDto>? media;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? parentId;
  final String? forwardedMessageId;
  final ChatGroupMessageReadDto? forwardedMessage;
  final ChatGroupMessageReadDto? parent;
  final List<ProductReadDto>? products;
  final List<UserReadDto>? messageSeenBy;

  factory ChatGroupMessageReadDto.fromJson(String str) => ChatGroupMessageReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatGroupMessageReadDto.fromMap(Map<String, dynamic> json) => ChatGroupMessageReadDto(
        message: json["message"],
        groupChatId: json["groupChatId"],
        useCase: json["useCase"],
        type: json["type"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        forwardedMessageId: json["forwardedMessageId"],
        forwardedMessage: json["forwardedMessage"] == null ? null : ChatGroupMessageReadDto.fromMap(json["forwardedMessage"]),
        media: json["media"] == null ? [] : List<MediaReadDto>.from(json["media"]!.map((x) => MediaReadDto.fromMap(x))),
        userId: json["userId"],
        parentId: json["parentId"],
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        parent: json["parent"] == null ? null : ChatGroupMessageReadDto.fromMap(json["parent"]),
        products: json["products"] == null ? null : List<ProductReadDto>.from(json["products"].map((x) => ProductReadDto.fromMap(x))),
        messageSeenBy: json["messageSeenBy"] == null ? null : List<UserReadDto>.from(json["messageSeenBy"].map((x) => UserReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "groupChatId": groupChatId,
        "useCase": useCase,
        "type": type,
        "user": user?.toMap(),
        "forwardedMessageId": forwardedMessageId,
        "forwardedMessage": forwardedMessage == null ? null : forwardedMessage!.toMap(),
        "userId": userId,
        "media": media == null ? [] : List<MediaReadDto>.from(media!.map((x) => x)),
        "id": id,
        "parentId": parentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "parent": parent == null ? null : parent!.toMap(),
        "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toMap())),
        "messageSeenBy": messageSeenBy == null ? null : List<dynamic>.from(messageSeenBy!.map((x) => x.toMap())),
      };
}

class CreateGroupMessage {
  CreateGroupMessage({
    this.id,
    this.message,
    this.products,
    this.type,
    this.parentId,
    this.forwardedMessageId,
    this.useCase,
    this.groupChatId,
  });

  final String? id;
  final String? message;
  final String? type;
  final String? useCase;
  final String? parentId;
  final String? groupChatId;
  final String? forwardedMessageId;
  final List<String>? products;

  factory CreateGroupMessage.fromJson(String str) => CreateGroupMessage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateGroupMessage.fromMap(Map<String, dynamic> json) => CreateGroupMessage(
        id: json["id"],
        message: json["message"],
        type: json["type"],
        useCase: json["useCase"],
        parentId: json["parentId"],
        products: json["products"],
        forwardedMessageId: json["forwardedMessageId"],
        groupChatId: json["groupChatId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "message": message,
        "type": type,
        "useCase": useCase,
        "parentId": parentId,
        "products": products,
        "forwardedMessageId": forwardedMessageId,
        "groupChatId": groupChatId,
      };
}

class GroupChat {
  GroupChat({
    this.title,
    this.description,
    this.media,
    this.users,
    this.products,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.useCase,
    this.creatorUserId,
    this.chatStatus,
    this.priority,
  });

  final String? title;
  final String? description;
  final List<MediaReadDto>? media;
  final List<UserReadDto>? users;
  final List<dynamic>? products;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? useCase;
  final String? creatorUserId;
  final int? chatStatus;
  final int? priority;

  factory GroupChat.fromJson(String str) => GroupChat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GroupChat.fromMap(Map<String, dynamic> json) => GroupChat(
        title: json["title"],
        description: json["description"],
        media: json["media"] == null ? [] : List<MediaReadDto>.from(json["media"]!.map((x) => MediaReadDto.fromMap(x))),
        users: json["users"] == null ? [] : List<UserReadDto>.from(json["users"]!.map((x) => UserReadDto.fromMap(x))),
        products: json["products"] == null ? [] : List<dynamic>.from(json["products"]!.map((x) => x)),
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        useCase: json["useCase"],
        creatorUserId: json["creatorUserId"],
        chatStatus: json["chatStatus"],
        priority: json["priority"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toMap())),
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toMap())),
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "useCase": useCase,
        "creatorUserId": creatorUserId,
        "chatStatus": chatStatus,
        "priority": priority,
      };
}
