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
  final AddressSelectorArgs? address;
  final TerminalSelectorArgs? terminal;
  final String? nationalCardFront;
  final bool? nationalCardBack;
  final bool? birthCertificateFirst;
  final bool? birthCertificateSecond;
  final bool? birthCertificateThird;
  final bool? birthCertificateForth;
  final bool? birthCertificateFifth;
  final bool? visualAuthentication;
  final bool? eSignature;

  const UserSelectorArgs({
    this.category,
    this.contract,
    this.media,
    this.invoice,
    this.address,
    this.terminal,
    this.nationalCardFront,
    this.nationalCardBack,
    this.birthCertificateFirst,
    this.birthCertificateSecond,
    this.birthCertificateThird,
    this.birthCertificateForth,
    this.birthCertificateFifth,
    this.visualAuthentication,
    this.eSignature,
  });

  factory UserSelectorArgs.fromJson(String str) => UserSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserSelectorArgs.fromMap(Map<String, dynamic> json) => UserSelectorArgs(
    category: json["category"] == null ? null : CategorySelectorArgs.fromMap(json["category"]),
    contract: json["contract"] == null ? null : ContractSelectorArgs.fromMap(json["contract"]),
    media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
    invoice: json["invoice"] == null ? null : InvoiceSelectorArgs.fromMap(json["invoice"]),
    address: json["address"] == null ? null : AddressSelectorArgs.fromMap(json["address"]),
    terminal: json["terminal"] == null ? null : TerminalSelectorArgs.fromMap(json["terminal"]),
    nationalCardFront: json["nationalCardFront"],
    nationalCardBack: json["nationalCardBack"],
    birthCertificateFirst: json["birthCertificateFirst"],
    birthCertificateSecond: json["birthCertificateSecond"],
    birthCertificateThird: json["birthCertificateThird"],
    birthCertificateForth: json["birthCertificateForth"],
    birthCertificateFifth: json["birthCertificateFifth"],
    visualAuthentication: json["visualAuthentication"],
    eSignature: json["eSignature"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "category": category?.toMap(),
    "contract": contract?.toMap(),
    "media": media?.toMap(),
    "invoice": invoice?.toMap(),
    "address": address?.toMap(),
    "terminal": terminal?.toMap(),
    "nationalCardFront": nationalCardFront,
    "nationalCardBack": nationalCardBack,
    "birthCertificateFirst": birthCertificateFirst,
    "birthCertificateSecond": birthCertificateSecond,
    "birthCertificateThird": birthCertificateThird,
    "birthCertificateForth": birthCertificateForth,
    "birthCertificateFifth": birthCertificateFifth,
    "visualAuthentication": visualAuthentication,
    "eSignature": eSignature,
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

class VehicleSelectorArgs {
  final UserSelectorArgs? creator;

  const VehicleSelectorArgs({
    this.creator,
  });

  factory VehicleSelectorArgs.fromJson(String str) => VehicleSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VehicleSelectorArgs.fromMap(Map<String, dynamic> json) => VehicleSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
  };
}

class BankAccountSelectorArgs {
  final UserSelectorArgs? creator;

  const BankAccountSelectorArgs({
    this.creator,
  });

  factory BankAccountSelectorArgs.fromJson(String str) => BankAccountSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BankAccountSelectorArgs.fromMap(Map<String, dynamic> json) => BankAccountSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
  };
}

class TerminalSelectorArgs {
  final UserSelectorArgs? creator;

  const TerminalSelectorArgs({
    this.creator,
  });

  factory TerminalSelectorArgs.fromJson(String str) => TerminalSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TerminalSelectorArgs.fromMap(Map<String, dynamic> json) => TerminalSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
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

class NotificationSelectorArgs {
  final UserSelectorArgs? user;
  final UserSelectorArgs? creator;

  const NotificationSelectorArgs({
    this.user,
    this.creator,
  });

  factory NotificationSelectorArgs.fromJson(String str) => NotificationSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationSelectorArgs.fromMap(Map<String, dynamic> json) => NotificationSelectorArgs(
    user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "user": user?.toMap(),
    "creator": creator?.toMap(),
  };
}

class AddressSelectorArgs {
  final UserSelectorArgs? creator;

  const AddressSelectorArgs({
    this.creator,
  });

  factory AddressSelectorArgs.fromJson(String str) => AddressSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddressSelectorArgs.fromMap(Map<String, dynamic> json) => AddressSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
  };
}

class WalletSelectorArgs {
  final UserSelectorArgs? user;

  const WalletSelectorArgs({
    this.user,
  });

  factory WalletSelectorArgs.fromJson(String str) => WalletSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WalletSelectorArgs.fromMap(Map<String, dynamic> json) => WalletSelectorArgs(
    user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "user": user?.toMap(),
  };
}

class WalletTxnSelectorArgs {
  final UserSelectorArgs? sender;
  final UserSelectorArgs? receiver;

  const WalletTxnSelectorArgs({
    this.sender,
    this.receiver,
  });

  factory WalletTxnSelectorArgs.fromJson(String str) => WalletTxnSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WalletTxnSelectorArgs.fromMap(Map<String, dynamic> json) => WalletTxnSelectorArgs(
    sender: json["sender"] == null ? null : UserSelectorArgs.fromMap(json["sender"]),
    receiver: json["receiver"] == null ? null : UserSelectorArgs.fromMap(json["receiver"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "sender": sender?.toMap(),
    "receiver": receiver?.toMap(),
  };
}
