part of "../data.dart";

class CategorySelectorArgs {
  final MediaSelectorArgs? media;
  final CategorySelectorArgs? children;
  final ProductSelectorArgs? product;
  final UserSelectorArgs? creator;
  final int? childrenDebt;

  const CategorySelectorArgs({
    this.media,
    this.children,
    this.product,
    this.creator,
    this.childrenDebt,
  });

  factory CategorySelectorArgs.fromJson(String str) => CategorySelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategorySelectorArgs.fromMap(Map<String, dynamic> json) => CategorySelectorArgs(
    media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
    children: json["children"] == null ? null : CategorySelectorArgs.fromMap(json["children"]),
    product: json["product"] == null ? null : ProductSelectorArgs.fromMap(json["product"]),
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
    childrenDebt: json["childrenDebt"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "media": media?.toMap(),
    "children": children?.toMap(),
    "product": product?.toMap(),
    "creator": creator?.toMap(),
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

  factory MediaSelectorArgs.fromMap(Map<String, dynamic> json) => MediaSelectorArgs(
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

  factory ContentSelectorArgs.fromMap(Map<String, dynamic> json) => ContentSelectorArgs(
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

  factory UserSelectorArgs.fromMap(Map<String, dynamic> json) => UserSelectorArgs(
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
  final UserSelectorArgs? creator;
  final MediaSelectorArgs? media;
  final CommentSelectorArgs? comment;
  final ContractSelectorArgs? contract;
  final bool? childrenCount;
  final bool? commentsCount;
  final bool? isFollowing;

  const ProductSelectorArgs({
    this.userId,
    this.children,
    this.category,
    this.creator,
    this.media,
    this.comment,
    this.contract,
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
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
    media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
    comment: json["comment"] == null ? null : CommentSelectorArgs.fromMap(json["comment"]),
    contract: json["contract"] == null ? null : ContractSelectorArgs.fromMap(json["contract"]),
    childrenCount: json["childrenCount"] ?? false,
    commentsCount: json["commentsCount"] ?? false,
    isFollowing: json["isFollowing"] ?? false,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userId": userId,
    "children": children?.toMap(),
    "category": category?.toMap(),
    "creator": creator?.toMap(),
    "media": media?.toMap(),
    "comment": comment?.toMap(),
    "contract": contract?.toMap(),
    "childrenCount": childrenCount,
    "commentsCount": commentsCount,
    "isFollowing": isFollowing,
  };
}

class ContractSelectorArgs {
  final UserSelectorArgs? creator;
  final UserSelectorArgs? user;
  final ProductSelectorArgs? product;
  final InvoiceSelectorArgs? invoice;

  const ContractSelectorArgs({
    this.creator,
    this.user,
    this.product,
    this.invoice,
  });

  factory ContractSelectorArgs.fromJson(String str) => ContractSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContractSelectorArgs.fromMap(Map<String, dynamic> json) => ContractSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
    user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
    product: json["product"] == null ? null : ProductSelectorArgs.fromMap(json["product"]),
    invoice: json["invoice"] == null ? null : InvoiceSelectorArgs.fromMap(json["invoice"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
    "user": user?.toMap(),
    "product": product?.toMap(),
    "invoice": invoice?.toMap(),
  };
}

class InvoiceSelectorArgs {
  final ContractSelectorArgs? contract;
  final UserSelectorArgs? creator;

  const InvoiceSelectorArgs({
    this.contract,
    this.creator,
  });

  factory InvoiceSelectorArgs.fromJson(String str) => InvoiceSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InvoiceSelectorArgs.fromMap(Map<String, dynamic> json) => InvoiceSelectorArgs(
    contract: json["contract"] == null ? null : ContractSelectorArgs.fromMap(json["contract"]),
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "contract": contract?.toMap(),
    "creator": creator?.toMap(),
  };
}

class CommentSelectorArgs {
  final CommentSelectorArgs? children;
  final UserSelectorArgs? user;
  final UserSelectorArgs? creator;
  final ProductSelectorArgs? product;
  final MediaSelectorArgs? media;

  const CommentSelectorArgs({
    this.children,
    this.user,
    this.creator,
    this.product,
    this.media,
  });

  factory CommentSelectorArgs.fromJson(String str) => CommentSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentSelectorArgs.fromMap(Map<String, dynamic> json) => CommentSelectorArgs(
    children: json["children"] == null ? null : CommentSelectorArgs.fromMap(json["children"]),
    user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
    product: json["product"] == null ? null : ProductSelectorArgs.fromMap(json["product"]),
    media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "children": children?.toMap(),
    "user": user?.toMap(),
    "creator": creator?.toMap(),
    "product": product?.toMap(),
    "media": media?.toMap(),
  };
}
