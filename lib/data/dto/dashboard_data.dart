part of '../data.dart';

class DashboardDataReadDto {
  DashboardDataReadDto({
    this.categories,
    this.products,
    this.users,
    this.orders,
    this.media,
    this.transactions,
    this.address,
    this.reports,
    this.releasedProducts,
    this.inQueueProducts,
    this.notAcceptedProducts,
  });

  factory DashboardDataReadDto.fromJson(final String str) => DashboardDataReadDto.fromMap(json.decode(str));

  factory DashboardDataReadDto.fromMap(final Map<String, dynamic> json) => DashboardDataReadDto(
        categories: json["categories"],
        products: json["products"],
        users: json["users"],
        orders: json["orders"],
        media: json["media"],
        transactions: json["transactions"],
        address: json["address"],
        reports: json["reports"],
        releasedProducts: json["releasedProducts"],
        inQueueProducts: json["inQueueProducts"],
        notAcceptedProducts: json["notAcceptedProducts"],
      );
  final int? categories;
  final int? products;
  final int? users;
  final int? orders;
  final int? media;
  final int? transactions;
  final int? address;
  final int? reports;
  final int? releasedProducts;
  final int? inQueueProducts;
  final int? notAcceptedProducts;

  String toJson() => json.encode(removeNullEntries(toMap()));

  Map<String, dynamic> toMap() => {
        "categories": categories,
        "products": products,
        "users": users,
        "orders": orders,
        "media": media,
        "transactions": transactions,
        "address": address,
        "reports": reports,
        "releasedProducts": releasedProducts,
        "inQueueProducts": inQueueProducts,
        "notAcceptedProducts": notAcceptedProducts,
      };
}
