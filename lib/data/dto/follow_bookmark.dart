part of '../data.dart';

class BookmarkReadDto {
  BookmarkReadDto({
    this.product,
    this.folderName,
    this.media,
    this.id,
    this.user,
  });

  final ProductReadDto? product;
  final UserReadDto? user;
  final List<MediaReadDto>? media;
  final String? folderName;
  final String? id;

  factory BookmarkReadDto.fromJson(String str) => BookmarkReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory BookmarkReadDto.fromMap(dynamic json) => BookmarkReadDto(
        folderName: json["folderName"],
        id: json["id"],
        product: json["product"] == null ? null : ProductReadDto.fromMap(json["product"]),
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
      );

  dynamic toMap() => {
        "folderName": folderName,
        "id": id,
        "product": product?.toMap(),
        "user": user?.toMap(),
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
      };
}

class ToggleBookmark {
  ToggleBookmark({
    this.productId,
    this.categoryId,
    this.folderName,
  });

  final String? productId;
  final String? categoryId;
  final String? folderName;

  factory ToggleBookmark.fromJson(String str) => ToggleBookmark.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory ToggleBookmark.fromMap(dynamic json) => ToggleBookmark(
        productId: json["productId"],
        categoryId: json["categoryId"],
        folderName: json["folderName"],
      );

  dynamic toMap() => {
        "productId": productId,
        "categoryId": categoryId,
        "folderName": folderName,
      };
}

class ToggleFollow {
  ToggleFollow({
    this.userId,
  });

  final String? userId;

  factory ToggleFollow.fromJson(String str) => ToggleFollow.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory ToggleFollow.fromMap(dynamic json) => ToggleFollow(
        userId: json["userId"],
      );

  dynamic toMap() => {
        "userId": userId,
      };
}
