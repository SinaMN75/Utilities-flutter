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

  factory ChatGroupReadDto.fromJson(final String str) => ChatGroupReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatGroupReadDto.fromMap(final dynamic json) => ChatGroupReadDto(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    title: json["title"],
    creatorUserId: json["creatorUserId"],
    type: json["type"],
    groupChatJsonDetail: json["jsonDetail"] == null ? null : GroupChatJsonDetail.fromMap(json["jsonDetail"]),
    media: json["media"] == null ? <MediaReadDto>[] : List<MediaReadDto>.from(json["media"].cast<dynamic>().map(MediaReadDto.fromMap)).toList(),
    users: json["users"] == null ? <UserReadDto>[] : List<UserReadDto>.from(json["users"].cast<dynamic>().map(UserReadDto.fromMap)).toList(),
    products: json["products"] == null ? <ProductReadDto>[] : List<ProductReadDto>.from(json["products"].cast<dynamic>().map(ProductReadDto.fromMap)).toList(),
    groupChatMessage: json["groupChatMessage"] == null ? <ChatGroupMessageReadDto>[] : List<ChatGroupMessageReadDto>.from(json["groupChatMessage"].cast<dynamic>().map(ChatGroupMessageReadDto.fromMap)).toList(),
    categories: json["categories"] == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(json["categories"].cast<dynamic>().map(CategoryReadDto.fromMap)).toList(),
    countOfUnreadMessages: json["countOfUnreadMessages"],
  );

  dynamic toMap() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "title": title,
    "creatorUserId": creatorUserId,
    "type": type,
    "groupChatJsonDetail": groupChatJsonDetail?.toMap(),
    "media": media == null ? <MediaReadDto>[] : List<MediaReadDto>.from(media!.map((final x) => x.toMap())),
    "users": users == null ? <UserReadDto>[] : List<UserReadDto>.from(users!.map((final x) => x.toMap())),
    "products": products == null ? <ProductReadDto>[] : List<ProductReadDto>.from(products!.map((final x) => x.toMap())),
    "groupChatMessage": groupChatMessage == null ? <ChatGroupMessageReadDto>[] : List<dynamic>.from(groupChatMessage!.map((final x) => x.toMap())),
    "categories": categories == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(categories!.map((final x) => x.toMap())),
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

  factory GroupChatJsonDetail.fromJson(final String str) => GroupChatJsonDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GroupChatJsonDetail.fromMap(final dynamic json) => GroupChatJsonDetail(
    description: json["description"],
    value: json["value"],
    department: json["department"],
    chatStatus: json["chatStatus"],
    priority: json["priority"],
    boosted: json["boosted"] == null ? null : DateTime.parse(json["boosted"]),
  );

  dynamic toMap() => {
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
    this.tags,
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
  final List<int>? tags;
  final List<String>? categories;
  final List<String>? productIds;

  factory ChatGroupCreateUpdateDto.fromJson(final String str) => ChatGroupCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatGroupCreateUpdateDto.fromMap(final dynamic json) => ChatGroupCreateUpdateDto(
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
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final x) => x)),
    userIds: json["userIds"] == null ? [] : List<String>.from(json["userIds"]!.map((final x) => x)),
    categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((final x) => x)),
    productIds: json["productIds"] == null ? [] : List<String>.from(json["productIds"]!.map((final x) => x)),
  );

  dynamic toMap() => {
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
    "tags": tags == null ? [] : List<int>.from(tags!.map((final x) => x)),
    "userIds": userIds == null ? [] : List<String>.from(userIds!.map((final x) => x)),
    "categories": categories == null ? [] : List<String>.from(categories!.map((final x) => x)),
    "productIds": productIds == null ? [] : List<String>.from(productIds!.map((final x) => x)),
  };
}

class ChatGroupFilterDto {
  final List<String>? usersIds;
  final List<String>? productsIds;
  final List<int>? tags;
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
    this.tags,
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

  factory ChatGroupFilterDto.fromJson(final String str) => ChatGroupFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatGroupFilterDto.fromMap(final dynamic json) => ChatGroupFilterDto(
    usersIds: json["usersIds"] == null ? [] : List<String>.from(json["usersIds"]!.map((final x) => x)),
    productsIds: json["productsIds"] == null ? [] : List<String>.from(json["productsIds"]!.map((final x) => x)),
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final x) => x)),
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

  dynamic toMap() => {
    "usersIds": usersIds == null ? [] : List<dynamic>.from(usersIds!.map((final x) => x)),
    "productsIds": productsIds == null ? [] : List<dynamic>.from(productsIds!.map((final x) => x)),
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final x) => x)),
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
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? message;
  String? type;
  String? useCase;
  ChatGroupReadDto? groupChat;
  String? groupChatId;
  UserReadDto? user;
  String? userId;
  ChatGroupMessageReadDto? forwardedMessage;
  String? forwardedMessageId;
  ChatGroupMessageReadDto? parent;
  String? parentId;
  SeenUsers? seenUsers;
  String? seenUsersId;
  List<MediaReadDto>? media;
  List<int>? tags;
  List<ProductReadDto>? products;
  List<UserReadDto>? messageSeenBy;

  ChatGroupMessageReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.message,
    this.type,
    this.useCase,
    this.groupChat,
    this.groupChatId,
    this.user,
    this.userId,
    this.forwardedMessage,
    this.forwardedMessageId,
    this.parent,
    this.parentId,
    this.seenUsers,
    this.seenUsersId,
    this.media,
    this.tags,
    this.products,
    this.messageSeenBy,
  });

  factory ChatGroupMessageReadDto.fromJson(final String str) => ChatGroupMessageReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatGroupMessageReadDto.fromMap(final dynamic json) => ChatGroupMessageReadDto(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    message: json["message"],
    type: json["type"],
    useCase: json["useCase"],
    groupChat: json["groupChat"] == null ? null : ChatGroupReadDto.fromMap(json["groupChat"]),
    groupChatId: json["groupChatId"],
    user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
    userId: json["userId"],
    forwardedMessage: json["forwardedMessage"] == null ? null : ChatGroupMessageReadDto.fromMap(json["forwardedMessage"]),
    forwardedMessageId: json["forwardedMessageId"],
    parentId: json["parentId"],
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final x) => x)),
    seenUsers: json["seenUsers"] == null ? null : SeenUsers.fromMap(json["seenUsers"]),
    parent: json["parent"] == null ? null : ChatGroupMessageReadDto.fromMap(json["parent"]),
    seenUsersId: json["seenUsersId"],
    media: json["media"] == null ? <MediaReadDto>[] : List<MediaReadDto>.from(json["media"].cast<dynamic>().map(MediaReadDto.fromMap)).toList(),
    products: json["products"] == null ? <ProductReadDto>[] : List<ProductReadDto>.from(json["products"].cast<dynamic>().map(ProductReadDto.fromMap)).toList(),
    messageSeenBy: json["messageSeenBy"] == null ? <UserReadDto>[] : List<UserReadDto>.from(json["messageSeenBy"].cast<dynamic>().map(UserReadDto.fromMap)).toList(),
  );

  dynamic toMap() => {
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "message": message,
    "type": type,
    "useCase": useCase,
    "groupChat": groupChat?.toMap(),
    "groupChatId": groupChatId,
    "user": user?.toMap(),
    "userId": userId,
    "forwardedMessage": forwardedMessage,
    "forwardedMessageId": forwardedMessageId,
    "parent": parent,
    "parentId": parentId,
    "seenUsers": seenUsers?.toMap(),
    "seenUsersId": seenUsersId,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final x) => x)),
    "media": media == null ? [] : List<MediaReadDto>.from(media!.map((final x) => x.toMap())),
    "products": products == null ? <ProductReadDto>[] : List<ProductReadDto>.from(products!.map((final x) => x.toMap())),
    "messageSeenBy": messageSeenBy == null ? <UserReadDto>[] : List<UserReadDto>.from(messageSeenBy!.map((final x) => x.toMap())),
  };
}

class GroupChatMessageJsonDetail {
  String? description;
  String? value;
  String? department;
  int? chatStatus;
  int? priority;
  DateTime? boosted;

  GroupChatMessageJsonDetail({
    this.description,
    this.value,
    this.department,
    this.chatStatus,
    this.priority,
    this.boosted,
  });

  factory GroupChatMessageJsonDetail.fromJson(final String str) => GroupChatMessageJsonDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GroupChatMessageJsonDetail.fromMap(final dynamic json) => GroupChatMessageJsonDetail(
    description: json["description"],
    value: json["value"],
    department: json["department"],
    chatStatus: json["chatStatus"],
    priority: json["priority"],
    boosted: json["boosted"] == null ? null : DateTime.parse(json["boosted"]),
  );

  dynamic toMap() => <String, dynamic>{
    "description": description,
    "value": value,
    "department": department,
    "chatStatus": chatStatus,
    "priority": priority,
    "boosted": boosted?.toIso8601String(),
  };
}

class SeenUsers {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fkGroupChat;
  String? fkUserId;
  String? fkGroupChatMessage;

  SeenUsers({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.fkGroupChat,
    this.fkUserId,
    this.fkGroupChatMessage,
  });

  factory SeenUsers.fromJson(final String str) => SeenUsers.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SeenUsers.fromMap(final dynamic json) => SeenUsers(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    fkGroupChat: json["fk_GroupChat"],
    fkUserId: json["fk_UserId"],
    fkGroupChatMessage: json["fk_GroupChatMessage"],
  );

  dynamic toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "fk_GroupChat": fkGroupChat,
    "fk_UserId": fkUserId,
    "fk_GroupChatMessage": fkGroupChatMessage,
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
    this.tags,
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
  final List<int>? tags;

  factory CreateGroupMessage.fromJson(final String str) => CreateGroupMessage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateGroupMessage.fromMap(final dynamic json) => CreateGroupMessage(
    id: json["id"],
    message: json["message"],
    type: json["type"],
    useCase: json["useCase"],
    parentId: json["parentId"],
    products: json["products"],
    forwardedMessageId: json["forwardedMessageId"],
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final x) => x)),
    groupChatId: json["groupChatId"],
  );

  dynamic toMap() => {
    "id": id,
    "message": message,
    "type": type,
    "useCase": useCase,
    "parentId": parentId,
    "products": products,
    "forwardedMessageId": forwardedMessageId,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final x) => x)),
    "groupChatId": groupChatId,
  };
}

