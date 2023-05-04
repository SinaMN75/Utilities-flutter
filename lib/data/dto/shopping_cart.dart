import 'package:utilities/utilities.dart';

class ShoppingCartReadDto {
  ShoppingCartReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userId,
    this.shoppingCartItems,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? userId;
  final List<ShoppingCartItem>? shoppingCartItems;

  factory ShoppingCartReadDto.fromJson(String str) => ShoppingCartReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShoppingCartReadDto.fromMap(Map<String, dynamic> json) => ShoppingCartReadDto(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        userId: json["userId"],
        shoppingCartItems: json["shoppingCartItems"] == null ? null : List<ShoppingCartItem>.from(json["shoppingCartItems"].map((x) => ShoppingCartItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "userId": userId,
        "shoppingCartItems": shoppingCartItems == null ? null : List<dynamic>.from(shoppingCartItems!.map((x) => x.toMap())),
      };
}

class ShoppingCartItem {
  ShoppingCartItem({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.quantity,
    this.shoppingCartId,
    this.productId,
    this.projectId,
    this.dailyPriceId,
    this.tutorialId,
    this.eventId,
    this.adId,
    this.companyId,
    this.tenderId,
    this.serviceId,
    this.magazineId,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? quantity;
  final String? shoppingCartId;
  final String? productId;
  final String? projectId;
  final String? dailyPriceId;
  final String? tutorialId;
  final String? eventId;
  final String? adId;
  final String? companyId;
  final String? tenderId;
  final String? serviceId;
  final String? magazineId;

  factory ShoppingCartItem.fromJson(String str) => ShoppingCartItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShoppingCartItem.fromMap(Map<String, dynamic> json) => ShoppingCartItem(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        quantity: json["quantity"],
        shoppingCartId: json["shoppingCartId"],
        productId: json["productId"],
        projectId: json["projectId"],
        dailyPriceId: json["dailyPriceId"],
        tutorialId: json["tutorialId"],
        eventId: json["eventId"],
        adId: json["adId"],
        companyId: json["companyId"],
        tenderId: json["tenderId"],
        serviceId: json["serviceId"],
        magazineId: json["magazineId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "quantity": quantity,
        "shoppingCartId": shoppingCartId,
        "productId": productId,
        "projectId": projectId,
        "dailyPriceId": dailyPriceId,
        "tutorialId": tutorialId,
        "eventId": eventId,
        "adId": adId,
        "companyId": companyId,
        "tenderId": tenderId,
        "serviceId": serviceId,
        "magazineId": magazineId,
      };
}
