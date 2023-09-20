import 'package:utilities/utilities.dart';

class DashboardDataReadDto {
  DashboardDataReadDto({
    this.status,
    this.pageSize,
    this.pageCount,
    this.totalCount,
    this.result,
  });

  factory DashboardDataReadDto.fromJson(final String str) => DashboardDataReadDto.fromMap(json.decode(str));

  factory DashboardDataReadDto.fromMap(final Map<String, dynamic> json) => DashboardDataReadDto(
        status: json["status"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        totalCount: json["totalCount"],
        result: json["result"] == null ? null : Result.fromMap(json["result"]),
      );
  final int? status;
  final int? pageSize;
  final int? pageCount;
  final int? totalCount;
  final Result? result;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "status": status,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "totalCount": totalCount,
        "result": result?.toMap(),
      };
}

class Result {
  Result({
    this.categories,
    this.products,
    this.users,
    this.orders,
    this.media,
    this.transactions,
  });

  factory Result.fromJson(final String str) => Result.fromMap(json.decode(str));

  factory Result.fromMap(final Map<String, dynamic> json) => Result(
        categories: json["categories"],
        products: json["products"],
        users: json["users"],
        orders: json["orders"],
        media: json["media"],
        transactions: json["transactions"],
      );
  final int? categories;
  final int? products;
  final int? users;
  final int? orders;
  final int? media;
  final int? transactions;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "categories": categories,
        "products": products,
        "users": users,
        "orders": orders,
        "media": media,
        "transactions": transactions,
      };
}
