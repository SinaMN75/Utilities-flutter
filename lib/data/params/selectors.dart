part of "../data.dart";

class CategorySelectorArgs {
  final MediaSelectorArgs? media;
  final CategorySelectorArgs? children;
  final ProductSelectorArgs? product;
  final UserSelectorArgs? user;
  final int? childrenDebt;

  const CategorySelectorArgs({
    this.media,
    this.children,
    this.product,
    this.user,
    this.childrenDebt,
  });

  factory CategorySelectorArgs.fromJson(String str) => CategorySelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategorySelectorArgs.fromMap(Map<String, dynamic> json) => CategorySelectorArgs(
    media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
    children: json["children"] == null ? null : CategorySelectorArgs.fromMap(json["children"]),
    product: json["product"] == null ? null : ProductSelectorArgs.fromMap(json["product"]),
    user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
    childrenDebt: json["childrenDebt"],
  );

  Map<String, dynamic> toMap() =>
      <String, dynamic>{
        "media": media?.toMap(),
        "children": children?.toMap(),
        "product": product?.toMap(),
        "user": user?.toMap(),
        "childrenDebt": childrenDebt,
      };
}

class MediaSelectorArgs {
  final MediaSelectorArgs? children;

  const MediaSelectorArgs({
    this.children,
  });

  factory MediaSelectorArgs.fromJson(String str) => MediaSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MediaSelectorArgs.fromMap(Map<String, dynamic> json) =>
      MediaSelectorArgs(
        children: json["children"] == null ? null : MediaSelectorArgs.fromMap(json["children"]),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "children": children?.toMap(),
  };
}

class ContentSelectorArgs {
  final MediaSelectorArgs? media;

  const ContentSelectorArgs({
    this.media,
  });

  factory ContentSelectorArgs.fromJson(String str) => ContentSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentSelectorArgs.fromMap(Map<String, dynamic> json) =>
      ContentSelectorArgs(
        media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "media": media?.toMap(),
  };
}

class UserSelectorArgs {
  final CategorySelectorArgs? category;
  final ContractSelectorArgs? contract;
  final MediaSelectorArgs? media;
  final InvoiceSelectorArgs? invoice;

  const UserSelectorArgs({
    this.category,
    this.contract,
    this.media,
    this.invoice,
  });

  factory UserSelectorArgs.fromJson(String str) => UserSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserSelectorArgs.fromMap(Map<String, dynamic> json) =>
      UserSelectorArgs(
        category: json["category"] == null ? null : CategorySelectorArgs.fromMap(json["category"]),
        contract: json["contract"] == null ? null : ContractSelectorArgs.fromMap(json["contract"]),
        media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
        invoice: json["invoice"] == null ? null : InvoiceSelectorArgs.fromMap(json["invoice"]),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "category": category?.toMap(),
    "contract": contract?.toMap(),
    "media": media?.toMap(),
    "invoice": invoice?.toMap(),
  };
}

class ProductSelectorArgs {
  final String? userId;
  final ProductSelectorArgs? children;
  final CategorySelectorArgs? category;
  final UserSelectorArgs? user;
  final MediaSelectorArgs? media;
  final CommentSelectorArgs? comment;
  final bool? childrenCount;
  final bool? commentsCount;
  final bool? isFollowing;

  const ProductSelectorArgs({
    this.userId,
    this.children,
    this.category,
    this.user,
    this.media,
    this.comment,
    this.childrenCount,
    this.commentsCount,
    this.isFollowing,
  });

  factory ProductSelectorArgs.fromJson(String str) => ProductSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductSelectorArgs.fromMap(Map<String, dynamic> json) => ProductSelectorArgs(
    userId: json["userId"],
    children: json["children"] == null ? null : ProductSelectorArgs.fromMap(json["children"]),
    category: json["category"] == null ? null : CategorySelectorArgs.fromMap(json["category"]),
    user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
    media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
    comment: json["comment"] == null ? null : CommentSelectorArgs.fromMap(json["comment"]),
    childrenCount: json["childrenCount"] ?? false,
    commentsCount: json["commentsCount"] ?? false,
    isFollowing: json["isFollowing"] ?? false,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userId": userId,
    "children": children?.toMap(),
    "category": category?.toMap(),
    "user": user?.toMap(),
    "media": media?.toMap(),
    "comment": comment?.toMap(),
    "childrenCount": childrenCount,
    "commentsCount": commentsCount,
    "isFollowing": isFollowing,
  };
}

class ContractSelectorArgs {
  final UserSelectorArgs? user;
  final UserSelectorArgs? creator;
  final ProductSelectorArgs? product;
  final InvoiceSelectorArgs? invoice;

  const ContractSelectorArgs({
    this.user,
    this.creator,
    this.product,
    this.invoice,
  });

  factory ContractSelectorArgs.fromJson(String str) => ContractSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContractSelectorArgs.fromMap(Map<String, dynamic> json) =>
      ContractSelectorArgs(
        user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
        creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
        product: json["product"] == null ? null : ProductSelectorArgs.fromMap(json["product"]),
        invoice: json["invoice"] == null ? null : InvoiceSelectorArgs.fromMap(json["invoice"]),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "user": user?.toMap(),
    "creator": creator?.toMap(),
    "product": product?.toMap(),
    "invoice": invoice?.toMap(),
  };
}

class InvoiceSelectorArgs {
  final ContractSelectorArgs? contract;
  final UserSelectorArgs? user;

  const InvoiceSelectorArgs({
    this.contract,
    this.user,
  });

  factory InvoiceSelectorArgs.fromJson(String str) => InvoiceSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InvoiceSelectorArgs.fromMap(Map<String, dynamic> json) =>
      InvoiceSelectorArgs(
        contract: json["contract"] == null ? null : ContractSelectorArgs.fromMap(json["contract"]),
        user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "contract": contract?.toMap(),
    "user": user?.toMap(),
  };
}

class CommentSelectorArgs {
  final CommentSelectorArgs? children;
  final UserSelectorArgs? targetUser;
  final UserSelectorArgs? user;
  final ProductSelectorArgs? product;
  final MediaSelectorArgs? media;

  const CommentSelectorArgs({
    this.children,
    this.targetUser,
    this.user,
    this.product,
    this.media,
  });

  factory CommentSelectorArgs.fromJson(String str) => CommentSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentSelectorArgs.fromMap(Map<String, dynamic> json) =>
      CommentSelectorArgs(
        children: json["children"] == null ? null : CommentSelectorArgs.fromMap(json["children"]),
        targetUser: json["targetUser"] == null ? null : UserSelectorArgs.fromMap(json["targetUser"]),
        user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
        product: json["product"] == null ? null : ProductSelectorArgs.fromMap(json["product"]),
        media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "children": children?.toMap(),
    "targetUser": targetUser?.toMap(),
    "user": user?.toMap(),
    "product": product?.toMap(),
    "media": media?.toMap(),
  };
}
