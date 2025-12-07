part of "../data.dart";

class CategorySelectorArgs {
  final bool? media;
  final bool? children;
  final bool? childrenMedia;

  const CategorySelectorArgs({
    this.media,
    this.children,
    this.childrenMedia,
  });

  factory CategorySelectorArgs.fromJson(String str) => CategorySelectorArgs.fromMap(json.decode(str));

  factory CategorySelectorArgs.fromMap(Map<String, dynamic> json) => CategorySelectorArgs(
    media: json["media"],
    children: json["children"],
    childrenMedia: json["childrenMedia"],
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "media": media,
    "children": children,
    "childrenMedia": childrenMedia,
  };
}

class ContentSelectorArgs {
  final bool? media;

  ContentSelectorArgs({this.media});

  factory ContentSelectorArgs.fromJson(String str) => ContentSelectorArgs.fromMap(json.decode(str));

  factory ContentSelectorArgs.fromMap(Map<String, dynamic> json) => ContentSelectorArgs(
    media: json["media"],
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "media": media,
  };
}

class UserSelectorArgs {
  final CategorySelectorArgs? categorySelectorArgs;
  final bool? categories;
  final bool? media;

  const UserSelectorArgs({
    this.categorySelectorArgs,
    this.categories,
    this.media,
  });

  factory UserSelectorArgs.fromJson(String str) => UserSelectorArgs.fromMap(json.decode(str));

  factory UserSelectorArgs.fromMap(Map<String, dynamic> json) => UserSelectorArgs(
    categorySelectorArgs: CategorySelectorArgs.fromMap(json["categorySelectorArgs"]),
    categories: json["categories"],
    media: json["media"],
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "categorySelectorArgs": categorySelectorArgs?.toMap(),
    "categories": categories,
    "media": media,
  };
}

class ProductSelectorArgs {
  final String? userId;
  final ProductSelectorArgs? childrenSelectorArgs;
  final CategorySelectorArgs? categorySelectorArgs;
  final UserSelectorArgs? userSelectorArgs;
  final bool? categories;
  final bool? media;
  final bool? user;
  final bool? children;
  final bool? childrenCount;
  final bool? commentsCount;
  final bool? isFollowing;

  ProductSelectorArgs({
    this.userId,
    this.childrenSelectorArgs,
    this.categorySelectorArgs,
    this.userSelectorArgs,
    this.categories,
    this.media,
    this.user,
    this.children,
    this.childrenCount,
    this.commentsCount,
    this.isFollowing,
  });

  factory ProductSelectorArgs.fromJson(String str) => ProductSelectorArgs.fromMap(json.decode(str));

  factory ProductSelectorArgs.fromMap(Map<String, dynamic> json) => ProductSelectorArgs(
    userId: json["userId"],
    childrenSelectorArgs: json["childrenSelectorArgs"] == null ? null : ProductSelectorArgs.fromMap(json["childrenSelectorArgs"]),
    categorySelectorArgs: CategorySelectorArgs.fromMap(json["categorySelectorArgs"]),
    userSelectorArgs: UserSelectorArgs.fromMap(json["userSelectorArgs"]),
    categories: json["categories"],
    media: json["media"],
    user: json["user"],
    children: json["children"],
    childrenCount: json["childrenCount"],
    commentsCount: json["commentsCount"],
    isFollowing: json["isFollowing"],
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userId": userId,
    "childrenSelectorArgs": childrenSelectorArgs?.toMap(),
    "categorySelectorArgs": categorySelectorArgs?.toMap(),
    "userSelectorArgs": userSelectorArgs?.toMap(),
    "categories": categories,
    "media": media,
    "user": user,
    "children": children,
    "childrenCount": childrenCount,
    "commentsCount": commentsCount,
    "isFollowing": isFollowing,
  };
}

class ContractSelectorArgs {
  final bool? invoices;
  final bool? product;
  final bool? user;
  final bool? creator;

  ContractSelectorArgs({
    this.invoices,
    this.product,
    this.user,
    this.creator,
  });

  factory ContractSelectorArgs.fromJson(String str) => ContractSelectorArgs.fromMap(json.decode(str));

  factory ContractSelectorArgs.fromMap(Map<String, dynamic> json) => ContractSelectorArgs(
    invoices: json["invoices"],
    product: json["product"],
    user: json["user"],
    creator: json["creator"],
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "invoices": invoices,
    "product": product,
    "user": user,
    "creator": creator,
  };
}

class InvoiceSelectorArgs {
  final UserSelectorArgs? userSelectorArgs;
  final bool? user;
  final bool? creator;
  final bool? contract;

  InvoiceSelectorArgs({
    this.userSelectorArgs,
    this.user,
    this.creator,
    this.contract,
  });

  factory InvoiceSelectorArgs.fromJson(String str) => InvoiceSelectorArgs.fromMap(json.decode(str));

  factory InvoiceSelectorArgs.fromMap(Map<String, dynamic> json) => InvoiceSelectorArgs(
    userSelectorArgs: UserSelectorArgs.fromMap(json["userSelectorArgs"]),
    user: json["user"],
    creator: json["creator"],
    contract: json["contract"],
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userSelectorArgs": userSelectorArgs?.toMap(),
    "user": user,
    "creator": creator,
    "contract": contract,
  };
}

class CommentSelectorArgs {
  final CommentSelectorArgs? childrenSelectorArgs;
  final bool? media;
  final bool? user;
  final bool? targetUser;
  final bool? product;
  final bool? children;

  CommentSelectorArgs({
    this.childrenSelectorArgs,
    this.media,
    this.user,
    this.targetUser,
    this.product,
    this.children,
  });

  factory CommentSelectorArgs.fromJson(String str) => CommentSelectorArgs.fromMap(json.decode(str));

  factory CommentSelectorArgs.fromMap(Map<String, dynamic> json) => CommentSelectorArgs(
    childrenSelectorArgs: json["childrenSelectorArgs"] == null ? null : CommentSelectorArgs.fromMap(json["childrenSelectorArgs"]),
    media: json["media"],
    user: json["user"],
    targetUser: json["targetUser"],
    product: json["product"],
    children: json["children"],
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "childrenSelectorArgs": childrenSelectorArgs?.toMap(),
    "media": media,
    "user": user,
    "targetUser": targetUser,
    "product": product,
    "children": children,
  };
}
