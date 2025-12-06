part of "../data.dart";

class CategorySelectorArgs {
  CategorySelectorArgs? childrenSelectorArgs;
  bool media;
  bool children;
  bool childrenMedia;

  CategorySelectorArgs({
    this.childrenSelectorArgs,
    this.media = false,
    this.children = false,
    this.childrenMedia = false,
  });

  factory CategorySelectorArgs.fromJson(String str) => CategorySelectorArgs.fromMap(json.decode(str));

  factory CategorySelectorArgs.fromMap(Map<String, dynamic> json) => CategorySelectorArgs(
    childrenSelectorArgs: json["childrenSelectorArgs"] == null ? null : CategorySelectorArgs.fromMap(json["childrenSelectorArgs"]),
    media: json["media"] ?? false,
    children: json["children"] ?? false,
    childrenMedia: json["childrenMedia"] ?? false,
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "childrenSelectorArgs": childrenSelectorArgs?.toMap(),
    "media": media,
    "children": children,
    "childrenMedia": childrenMedia,
  };
}

// ------------------------------------------------------
// ContentSelectorArgs
// ------------------------------------------------------
class ContentSelectorArgs {
  bool media;

  ContentSelectorArgs({this.media = false});

  factory ContentSelectorArgs.fromJson(String str) => ContentSelectorArgs.fromMap(json.decode(str));

  factory ContentSelectorArgs.fromMap(Map<String, dynamic> json) => ContentSelectorArgs(
    media: json["media"] ?? false,
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "media": media,
  };
}

// ------------------------------------------------------
// UserSelectorArgs
// ------------------------------------------------------
class UserSelectorArgs {
  CategorySelectorArgs categorySelectorArgs;
  bool categories;
  bool media;

  UserSelectorArgs({
    CategorySelectorArgs? categorySelectorArgs,
    this.categories = false,
    this.media = false,
  }) : categorySelectorArgs = categorySelectorArgs ?? CategorySelectorArgs();

  factory UserSelectorArgs.fromJson(String str) => UserSelectorArgs.fromMap(json.decode(str));

  factory UserSelectorArgs.fromMap(Map<String, dynamic> json) => UserSelectorArgs(
    categorySelectorArgs: CategorySelectorArgs.fromMap(json["categorySelectorArgs"]),
    categories: json["categories"] ?? false,
    media: json["media"] ?? false,
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "categorySelectorArgs": categorySelectorArgs.toMap(),
    "categories": categories,
    "media": media,
  };
}

// ------------------------------------------------------
// ProductSelectorArgs
// ------------------------------------------------------
class ProductSelectorArgs {
  String? userId;
  ProductSelectorArgs? childrenSelectorArgs;
  CategorySelectorArgs categorySelectorArgs;
  UserSelectorArgs userSelectorArgs;

  bool categories;
  bool media;
  bool user;
  bool children;
  bool childrenCount;
  bool commentsCount;
  bool isFollowing;

  ProductSelectorArgs({
    this.userId,
    this.childrenSelectorArgs,
    CategorySelectorArgs? categorySelectorArgs,
    UserSelectorArgs? userSelectorArgs,
    this.categories = false,
    this.media = false,
    this.user = false,
    this.children = false,
    this.childrenCount = false,
    this.commentsCount = false,
    this.isFollowing = false,
  }) : categorySelectorArgs = categorySelectorArgs ?? CategorySelectorArgs(),
       userSelectorArgs = userSelectorArgs ?? UserSelectorArgs();

  factory ProductSelectorArgs.fromJson(String str) => ProductSelectorArgs.fromMap(json.decode(str));

  factory ProductSelectorArgs.fromMap(Map<String, dynamic> json) => ProductSelectorArgs(
    userId: json["userId"],
    childrenSelectorArgs: json["childrenSelectorArgs"] == null ? null : ProductSelectorArgs.fromMap(json["childrenSelectorArgs"]),
    categorySelectorArgs: CategorySelectorArgs.fromMap(json["categorySelectorArgs"]),
    userSelectorArgs: UserSelectorArgs.fromMap(json["userSelectorArgs"]),
    categories: json["categories"] ?? false,
    media: json["media"] ?? false,
    user: json["user"] ?? false,
    children: json["children"] ?? false,
    childrenCount: json["childrenCount"] ?? false,
    commentsCount: json["commentsCount"] ?? false,
    isFollowing: json["isFollowing"] ?? false,
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userId": userId,
    "childrenSelectorArgs": childrenSelectorArgs?.toMap(),
    "categorySelectorArgs": categorySelectorArgs.toMap(),
    "userSelectorArgs": userSelectorArgs.toMap(),
    "categories": categories,
    "media": media,
    "user": user,
    "children": children,
    "childrenCount": childrenCount,
    "commentsCount": commentsCount,
    "isFollowing": isFollowing,
  };
}

// ------------------------------------------------------
// ContractSelectorArgs
// ------------------------------------------------------
class ContractSelectorArgs {
  bool invoices;
  bool product;
  bool user;
  bool creator;

  ContractSelectorArgs({
    this.invoices = false,
    this.product = false,
    this.user = false,
    this.creator = false,
  });

  factory ContractSelectorArgs.fromJson(String str) => ContractSelectorArgs.fromMap(json.decode(str));

  factory ContractSelectorArgs.fromMap(Map<String, dynamic> json) => ContractSelectorArgs(
    invoices: json["invoices"] ?? false,
    product: json["product"] ?? false,
    user: json["user"] ?? false,
    creator: json["creator"] ?? false,
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "invoices": invoices,
    "product": product,
    "user": user,
    "creator": creator,
  };
}

// ------------------------------------------------------
// InvoiceSelectorArgs
// ------------------------------------------------------
class InvoiceSelectorArgs {
  UserSelectorArgs userSelectorArgs;
  bool user;
  bool creator;
  bool contract;

  InvoiceSelectorArgs({
    UserSelectorArgs? userSelectorArgs,
    this.user = false,
    this.creator = false,
    this.contract = false,
  }) : userSelectorArgs = userSelectorArgs ?? UserSelectorArgs();

  factory InvoiceSelectorArgs.fromJson(String str) => InvoiceSelectorArgs.fromMap(json.decode(str));

  factory InvoiceSelectorArgs.fromMap(Map<String, dynamic> json) => InvoiceSelectorArgs(
    userSelectorArgs: UserSelectorArgs.fromMap(json["userSelectorArgs"]),
    user: json["user"] ?? false,
    creator: json["creator"] ?? false,
    contract: json["contract"] ?? false,
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userSelectorArgs": userSelectorArgs.toMap(),
    "user": user,
    "creator": creator,
    "contract": contract,
  };
}

// ------------------------------------------------------
// CommentSelectorArgs
// ------------------------------------------------------
class CommentSelectorArgs {
  CommentSelectorArgs? childrenSelectorArgs;

  bool media;
  bool user;
  bool targetUser;
  bool product;
  bool children;

  CommentSelectorArgs({
    this.childrenSelectorArgs,
    this.media = false,
    this.user = false,
    this.targetUser = false,
    this.product = false,
    this.children = false,
  });

  factory CommentSelectorArgs.fromJson(String str) => CommentSelectorArgs.fromMap(json.decode(str));

  factory CommentSelectorArgs.fromMap(Map<String, dynamic> json) => CommentSelectorArgs(
    childrenSelectorArgs: json["childrenSelectorArgs"] == null ? null : CommentSelectorArgs.fromMap(json["childrenSelectorArgs"]),
    media: json["media"] ?? false,
    user: json["user"] ?? false,
    targetUser: json["targetUser"] ?? false,
    product: json["product"] ?? false,
    children: json["children"] ?? false,
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
