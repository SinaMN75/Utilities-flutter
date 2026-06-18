part of "../data.dart";

class UserSelectorArgs {
  final CategorySelectorArgs? category;
  final MediaSelectorArgs? media;
  final TxnSelectorArgs? txns;
  final AddressSelectorArgs? address;
  final WalletSelectorArgs? wallet;
  final MerchantSelectorArgs? merchant;
  final BankAccountSelectorArgs? bankAccount;
  final SimSelectorArgs? simCard;
  final bool? nationalCardFront;
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
    this.media,
    this.txns,
    this.address,
    this.wallet,
    this.merchant,
    this.bankAccount,
    this.simCard,
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
    media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
    txns: json["txns"] == null ? null : TxnSelectorArgs.fromMap(json["txns"]),
    address: json["address"] == null ? null : AddressSelectorArgs.fromMap(json["address"]),
    wallet: json["wallet"] == null ? null : WalletSelectorArgs.fromMap(json["wallet"]),
    merchant: json["merchant"] == null ? null : MerchantSelectorArgs.fromMap(json["merchant"]),
    bankAccount: json["bankAccount"] == null ? null : BankAccountSelectorArgs.fromMap(json["bankAccount"]),
    simCard: json["simCard"] == null ? null : SimSelectorArgs.fromMap(json["simCard"]),
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
    "media": media?.toMap(),
    "txns": txns?.toMap(),
    "address": address?.toMap(),
    "wallet": wallet?.toMap(),
    "merchant": merchant?.toMap(),
    "bankAccount": bankAccount?.toMap(),
    "simCard": simCard?.toMap(),
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

class ParkingReportSelectorArgs {
  final UserSelectorArgs? creator;
  final VehicleSelectorArgs? vehicle;
  final ParkingSelectorArgs? parking;

  const ParkingReportSelectorArgs({this.creator, this.vehicle, this.parking});

  factory ParkingReportSelectorArgs.fromJson(String str) => ParkingReportSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ParkingReportSelectorArgs.fromMap(Map<String, dynamic> json) =>
      ParkingReportSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
        vehicle: json["vehicle"] == null ? null : VehicleSelectorArgs.fromMap(json["vehicle"]),
        parking: json["parking"] == null ? null : ParkingSelectorArgs.fromMap(json["parking"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
    "vehicle": vehicle?.toMap(),
    "parking": parking?.toMap(),
  };
}

class VasSelectorArgs {
  final UserSelectorArgs? creator;
  final WalletTxnSelectorArgs? walletTxn;
  final TxnSelectorArgs? txn;

  const VasSelectorArgs({this.creator, this.walletTxn, this.txn});

  factory VasSelectorArgs.fromJson(String str) => VasSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VasSelectorArgs.fromMap(Map<String, dynamic> json) =>
      VasSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
        walletTxn: json["walletTxn"] == null ? null : WalletTxnSelectorArgs.fromMap(json["walletTxn"]),
        txn: json["txn"] == null ? null : TxnSelectorArgs.fromMap(json["txn"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
    "walletTxn": walletTxn?.toMap(),
    "txn": txn?.toMap(),
  };
}

class CategorySelectorArgs {
  final UserSelectorArgs? creator;
  final MediaSelectorArgs? media;
  final CategorySelectorArgs? children;
  final int? childrenDebt;

  const CategorySelectorArgs({this.creator, this.media, this.children, this.childrenDebt});

  factory CategorySelectorArgs.fromJson(String str) => CategorySelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategorySelectorArgs.fromMap(Map<String, dynamic> json) =>
      CategorySelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
        media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
        children: json["children"] == null ? null : CategorySelectorArgs.fromMap(json["children"]),
        childrenDebt: json["childrenDebt"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
    "media": media?.toMap(),
    "children": children?.toMap(),
    "childrenDebt": childrenDebt,
  };
}

class ContentSelectorArgs {
  final UserSelectorArgs? creator;
  final MediaSelectorArgs? media;

  const ContentSelectorArgs({this.creator, this.media});

  factory ContentSelectorArgs.fromJson(String str) => ContentSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentSelectorArgs.fromMap(Map<String, dynamic> json) =>
      ContentSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
        media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
    "media": media?.toMap(),
  };
}

class TerminalSelectorArgs {
  final UserSelectorArgs? creator;
  final MerchantSelectorArgs? merchant;
  final bool? agreement;

  const TerminalSelectorArgs({this.creator, this.merchant, this.agreement});

  factory TerminalSelectorArgs.fromJson(String str) => TerminalSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TerminalSelectorArgs.fromMap(Map<String, dynamic> json) => TerminalSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
    merchant: json["merchant"] == null ? null : MerchantSelectorArgs.fromMap(json["merchant"]),
    agreement: json["agreement"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
    "merchant": merchant?.toMap(),
    "agreement": agreement,
  };
}

class MerchantSelectorArgs {
  final UserSelectorArgs? creator;
  final UserSelectorArgs? user;
  final TerminalSelectorArgs? terminal;

  const MerchantSelectorArgs({this.creator, this.user, this.terminal});

  factory MerchantSelectorArgs.fromJson(String str) => MerchantSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MerchantSelectorArgs.fromMap(Map<String, dynamic> json) =>
      MerchantSelectorArgs(
        creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
        user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
        terminal: json["terminal"] == null ? null : TerminalSelectorArgs.fromMap(json["terminal"]),
      );

  Map<String, dynamic> toMap() =>
      <String, dynamic>{
        "creator": creator?.toMap(),
        "user": user?.toMap(),
        "terminal": terminal?.toMap(),
      };
}

class WalletTxnSelectorArgs {
  final UserSelectorArgs? creator;
  final UserSelectorArgs? sender;
  final UserSelectorArgs? receiver;

  const WalletTxnSelectorArgs({this.creator, this.sender, this.receiver});

  factory WalletTxnSelectorArgs.fromJson(String str) => WalletTxnSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WalletTxnSelectorArgs.fromMap(Map<String, dynamic> json) =>
      WalletTxnSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
        sender: json["sender"] == null ? null : UserSelectorArgs.fromMap(json["sender"]),
        receiver: json["receiver"] == null ? null : UserSelectorArgs.fromMap(json["receiver"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
    "sender": sender?.toMap(),
    "receiver": receiver?.toMap(),
  };
}

class NotificationSelectorArgs {
  final UserSelectorArgs? creator;
  final UserSelectorArgs? user;

  const NotificationSelectorArgs({this.creator, this.user});

  factory NotificationSelectorArgs.fromJson(String str) => NotificationSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationSelectorArgs.fromMap(Map<String, dynamic> json) => NotificationSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
    user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() =>
      <String, dynamic>{
        "creator": creator?.toMap(),
        "user": user?.toMap(),
      };
}

class TicketSelectorArgs {
  final UserSelectorArgs? creator;
  final MediaSelectorArgs? media;

  const TicketSelectorArgs({this.creator, this.media});

  factory TicketSelectorArgs.fromJson(String str) => TicketSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TicketSelectorArgs.fromMap(Map<String, dynamic> json) =>
      TicketSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
        media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
    "media": media?.toMap(),
  };
}

class ProductSelectorArgs {
  final UserSelectorArgs? creator;
  final String? userId; // Guid in C# maps to String
  final ProductSelectorArgs? children;
  final CategorySelectorArgs? category;
  final MediaSelectorArgs? media;
  final bool? childrenCount;
  final bool? commentsCount;
  final bool? isFollowing;
  final int? childrenDebt;

  const ProductSelectorArgs({
    this.creator,
    this.userId,
    this.children,
    this.category,
    this.media,
    this.childrenCount,
    this.commentsCount,
    this.isFollowing,
    this.childrenDebt,
  });

  factory ProductSelectorArgs.fromJson(String str) => ProductSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductSelectorArgs.fromMap(Map<String, dynamic> json) =>
      ProductSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
        userId: json["userId"],
        children: json["children"] == null ? null : ProductSelectorArgs.fromMap(json["children"]),
        category: json["category"] == null ? null : CategorySelectorArgs.fromMap(json["category"]),
        media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
        childrenCount: json["childrenCount"],
        commentsCount: json["commentsCount"],
        isFollowing: json["isFollowing"],
        childrenDebt: json["childrenDebt"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
    "userId": userId,
    "children": children?.toMap(),
    "category": category?.toMap(),
    "media": media?.toMap(),
    "childrenCount": childrenCount,
    "commentsCount": commentsCount,
    "isFollowing": isFollowing,
    "childrenDebt": childrenDebt,
  };
}

class CommentSelectorArgs {
  final UserSelectorArgs? creator;
  final CommentSelectorArgs? children;
  final UserSelectorArgs? user;
  final MediaSelectorArgs? media;

  const CommentSelectorArgs({this.creator, this.children, this.user, this.media});

  factory CommentSelectorArgs.fromJson(String str) => CommentSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentSelectorArgs.fromMap(Map<String, dynamic> json) =>
      CommentSelectorArgs(
        creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
        children: json["children"] == null ? null : CommentSelectorArgs.fromMap(json["children"]),
    user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
        media: json["media"] == null ? null : MediaSelectorArgs.fromMap(json["media"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
    "children": children?.toMap(),
    "user": user?.toMap(),
    "media": media?.toMap(),
  };
}

class TxnSelectorArgs {
  final UserSelectorArgs? creator;
  final UserSelectorArgs? user;

  const TxnSelectorArgs({this.creator, this.user});

  factory TxnSelectorArgs.fromJson(String str) => TxnSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TxnSelectorArgs.fromMap(Map<String, dynamic> json) =>
      TxnSelectorArgs(
        creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
        user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
    "user": user?.toMap(),
  };
}

class MediaSelectorArgs {
  final UserSelectorArgs? creator;

  const MediaSelectorArgs({this.creator});

  factory MediaSelectorArgs.fromMap(Map<String, dynamic> json) => MediaSelectorArgs(creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]));

  Map<String, dynamic> toMap() => <String, dynamic>{"creator": creator?.toMap()};
}

class ParkingSelectorArgs {
  final UserSelectorArgs? creator;

  const ParkingSelectorArgs({this.creator});

  factory ParkingSelectorArgs.fromMap(Map<String, dynamic> json) => ParkingSelectorArgs(creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]));

  Map<String, dynamic> toMap() => <String, dynamic>{"creator": creator?.toMap()};
}

class VehicleSelectorArgs {
  final UserSelectorArgs? creator;

  const VehicleSelectorArgs({this.creator});

  factory VehicleSelectorArgs.fromMap(Map<String, dynamic> json) => VehicleSelectorArgs(creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]));

  Map<String, dynamic> toMap() => <String, dynamic>{"creator": creator?.toMap()};
}

class BankAccountSelectorArgs {
  final UserSelectorArgs? creator;

  const BankAccountSelectorArgs({this.creator});

  factory BankAccountSelectorArgs.fromMap(Map<String, dynamic> json) => BankAccountSelectorArgs(creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]));

  Map<String, dynamic> toMap() => <String, dynamic>{"creator": creator?.toMap()};
}

class AddressSelectorArgs {
  final UserSelectorArgs? creator;

  const AddressSelectorArgs({this.creator});

  factory AddressSelectorArgs.fromMap(Map<String, dynamic> json) => AddressSelectorArgs(creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]));

  Map<String, dynamic> toMap() => <String, dynamic>{"creator": creator?.toMap()};
}

class WalletSelectorArgs {
  final UserSelectorArgs? creator;

  const WalletSelectorArgs({this.creator});

  factory WalletSelectorArgs.fromMap(Map<String, dynamic> json) => WalletSelectorArgs(creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]));

  Map<String, dynamic> toMap() => <String, dynamic>{"creator": creator?.toMap()};
}

class SimSelectorArgs {
  final UserSelectorArgs? creator;
  final UserSelectorArgs? user;

  const SimSelectorArgs({this.creator, this.user});

  factory SimSelectorArgs.fromJson(String str) => SimSelectorArgs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SimSelectorArgs.fromMap(Map<String, dynamic> json) => SimSelectorArgs(
    creator: json["creator"] == null ? null : UserSelectorArgs.fromMap(json["creator"]),
    user: json["user"] == null ? null : UserSelectorArgs.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "creator": creator?.toMap(),
    "user": user?.toMap(),
  };
}