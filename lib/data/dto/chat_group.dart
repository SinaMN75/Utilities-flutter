import 'package:utilities/utilities.dart';

class ChatGroupReadDto {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? creatorUserId;
  int? type;
  GroupChatJsonDetail? groupChatJsonDetail;
  List<MediaReadDto>? media;
  List<UserReadDto>? users;
  List<ProductReadDto>? products;
  List<ChatGroupMessageReadDto>? groupChatMessage;
  List<CategoryReadDto>? categories;
  int? countOfUnreadMessages;

  ChatGroupReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.creatorUserId,
    this.type,
    this.groupChatJsonDetail,
    this.media,
    this.users,
    this.products,
    this.groupChatMessage,
    this.categories,
    this.countOfUnreadMessages,
  });

  factory ChatGroupReadDto.fromJson(String str) => ChatGroupReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatGroupReadDto.fromMap(Map<String, dynamic> json) => ChatGroupReadDto(
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        title: json["title"],
        creatorUserId: json["creatorUserId"],
        type: json["type"],
        groupChatJsonDetail: json["groupChatJsonDetail"] == null ? null : GroupChatJsonDetail.fromMap(json["groupChatJsonDetail"]),
        media: json["media"] == null ? <MediaReadDto>[] : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
        users: json["users"] == null ? <UserReadDto>[] : List<UserReadDto>.from(json["users"].cast<Map<String, dynamic>>().map(UserReadDto.fromMap)).toList(),
        products: json["products"] == null ? <ProductReadDto>[] : List<ProductReadDto>.from(json["products"].cast<Map<String, dynamic>>().map(ProductReadDto.fromMap)).toList(),
        groupChatMessage: json["groupChatMessage"] == null ? <ChatGroupMessageReadDto>[] : List<ChatGroupMessageReadDto>.from(json["groupChatMessage"].cast<Map<String, dynamic>>().map(ChatGroupMessageReadDto.fromMap)).toList(),
        categories: json["categories"] == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(json["categories"].cast<Map<String, dynamic>>().map(CategoryReadDto.fromMap)).toList(),
        countOfUnreadMessages: json["countOfUnreadMessages"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "title": title,
        "creatorUserId": creatorUserId,
        "type": type,
        "groupChatJsonDetail": groupChatJsonDetail?.toMap(),
        "media": media == null ? <MediaReadDto>[] : List<MediaReadDto>.from(media!.map((x) => x.toMap())),
        "users": users == null ? <UserReadDto>[] : List<UserReadDto>.from(users!.map((x) => x.toMap())),
        "products": products == null ? <ProductReadDto>[] : List<ProductReadDto>.from(products!.map((x) => x.toMap())),
        "groupChatMessage": groupChatMessage == null ? <ChatGroupMessageReadDto>[] : List<dynamic>.from(groupChatMessage!.map((x) => x.toMap())),
        "categories": categories == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(categories!.map((x) => x.toMap())),
        "countOfUnreadMessages": countOfUnreadMessages,
      };
}

class GroupChatJsonDetail {
  String? description;
  String? value;
  String? department;
  int? chatStatus;
  int? priority;
  DateTime? boosted;

  GroupChatJsonDetail({
    this.description,
    this.value,
    this.department,
    this.chatStatus,
    this.priority,
    this.boosted,
  });

  factory GroupChatJsonDetail.fromJson(String str) => GroupChatJsonDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GroupChatJsonDetail.fromMap(Map<String, dynamic> json) => GroupChatJsonDetail(
        description: json["description"],
        value: json["value"],
        department: json["department"],
        chatStatus: json["chatStatus"],
        priority: json["priority"],
        boosted: json["boosted"] == null ? null : DateTime.parse(json["boosted"]),
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "value": value,
        "department": department,
        "chatStatus": chatStatus,
        "priority": priority,
        "boosted": boosted?.toIso8601String(),
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
    this.categories,
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
  final List<String>? categories;
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
        categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
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
        "categories": categories == null ? [] : List<String>.from(categories!.map((x) => x)),
        "productIds": productIds == null ? [] : List<String>.from(productIds!.map((x) => x)),
      };
}

class ChatGroupFilterDto {
  final List<String>? usersIds;
  final List<String>? productsIds;
  final String? title;
  final String? description;
  final String? value;
  final String? department;
  final int? chatStatus;
  final int? type;
  final int? priority;
  final String? showUsers;
  final String? showProducts;
  final String? showCategories;
  final String? orderByAtoZ;
  final String? orderByZtoA;
  final String? orderByCreatedDate;
  final bool? orderByCreaedDateDecending;
  final int? pageSize;
  final int? pageNumber;

  ChatGroupFilterDto({
    this.usersIds,
    this.productsIds,
    this.title,
    this.description,
    this.value,
    this.department,
    this.chatStatus,
    this.type,
    this.priority,
    this.showUsers,
    this.showProducts,
    this.showCategories,
    this.orderByAtoZ,
    this.orderByZtoA,
    this.orderByCreatedDate,
    this.orderByCreaedDateDecending,
    this.pageSize,
    this.pageNumber,
  });

  factory ChatGroupFilterDto.fromJson(String str) => ChatGroupFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatGroupFilterDto.fromMap(Map<String, dynamic> json) => ChatGroupFilterDto(
        usersIds: json["usersIds"] == null ? [] : List<String>.from(json["usersIds"]!.map((x) => x)),
        productsIds: json["productsIds"] == null ? [] : List<String>.from(json["productsIds"]!.map((x) => x)),
        title: json["title"],
        description: json["description"],
        value: json["value"],
        department: json["department"],
        chatStatus: json["chatStatus"],
        type: json["type"],
        priority: json["priority"],
        showUsers: json["showUsers"],
        showProducts: json["showProducts"],
        showCategories: json["showCategories"],
        orderByAtoZ: json["orderByAtoZ"],
        orderByZtoA: json["orderByZtoA"],
        orderByCreatedDate: json["orderByCreatedDate"],
        orderByCreaedDateDecending: json["orderByCreaedDateDecending"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
      );

  Map<String, dynamic> toMap() => {
        "usersIds": usersIds == null ? [] : List<dynamic>.from(usersIds!.map((x) => x)),
        "productsIds": productsIds == null ? [] : List<dynamic>.from(productsIds!.map((x) => x)),
        "title": title,
        "description": description,
        "value": value,
        "department": department,
        "chatStatus": chatStatus,
        "type": type,
        "priority": priority,
        "showUsers": showUsers,
        "showProducts": showProducts,
        "showCategories": showCategories,
        "orderByAtoZ": orderByAtoZ,
        "orderByZtoA": orderByZtoA,
        "orderByCreatedDate": orderByCreatedDate,
        "orderByCreaedDateDecending": orderByCreaedDateDecending,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
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
        media: json["media"] == null ? [] : List<MediaReadDto>.from(json["media"]!.map((x) => MediaReadDto.fromMap)).toList(),
        userId: json["userId"],
        parentId: json["parentId"],
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        parent: json["parent"] == null ? null : ChatGroupMessageReadDto.fromMap(json["parent"]),
        products: json["products"] == null ? null : List<ProductReadDto>.from(json["products"].cast<Map<String, dynamic>>().map(ProductReadDto.fromMap)).toList(),
        messageSeenBy: json["messageSeenBy"] == null ? null : List<UserReadDto>.from(json["messageSeenBy"].cast<Map<String, dynamic>>().map(UserReadDto.fromMap)).toList(),
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
