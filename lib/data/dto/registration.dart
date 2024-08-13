part of '../data.dart';

class RegistrationCreateDto {
  final String? title;
  final int? row;
  final int? column;
  final String? userId;
  final String? productId;

  RegistrationCreateDto({
    this.title,
    this.row,
    this.column,
    this.userId,
    this.productId,
  });

  factory RegistrationCreateDto.fromJson(String str) => RegistrationCreateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegistrationCreateDto.fromMap(Map<String, dynamic> json) => RegistrationCreateDto(
        title: json["title"],
        row: json["row"],
        column: json["column"],
        userId: json["userId"],
        productId: json["productId"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "row": row,
        "column": column,
        "userId": userId,
        "productId": productId,
      };
}

class RegistrationUpdateDto {
  final String? id;
  final String? title;
  final int? row;
  final int? column;

  RegistrationUpdateDto({
    this.id,
    this.title,
    this.row,
    this.column,
  });

  factory RegistrationUpdateDto.fromJson(String str) => RegistrationUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegistrationUpdateDto.fromMap(Map<String, dynamic> json) => RegistrationUpdateDto(
        id: json["id"],
        title: json["title"],
        row: json["row"],
        column: json["column"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "row": row,
        "column": column,
      };
}

class RegistrationReadDto {
  final String? title;
  final int? row;
  final int? column;
  final String? userId;
  final String? productId;
  UserReadDto? user;
  ProductReadDto? product;

  RegistrationReadDto({
    this.title,
    this.row,
    this.column,
    this.userId,
    this.productId,
    this.user,
    this.product,
  });

  factory RegistrationReadDto.fromJson(String str) => RegistrationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegistrationReadDto.fromMap(Map<String, dynamic> json) => RegistrationReadDto(
        title: json["title"],
        row: json["row"],
        column: json["column"],
        userId: json["userId"],
        productId: json["productId"],
        user: json["user"] == null ? null : UserReadDto.fromMap(json["user"]),
        product: json["product"] == null ? null : ProductReadDto.fromMap(json["product"]),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "row": row,
        "column": column,
        "userId": userId,
        "productId": productId,
        "user": user?.toMap(),
        "product": product?.toMap(),
      };
}

class RegistrationFilterDto {
  final int? pageSize;
  final int? pageNumber;
  final String? fromDate;
  final String? userId;
  final String? productId;

  RegistrationFilterDto({
    this.pageSize,
    this.pageNumber,
    this.fromDate,
    this.userId,
    this.productId,
  });

  factory RegistrationFilterDto.fromJson(String str) => RegistrationFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegistrationFilterDto.fromMap(Map<String, dynamic> json) => RegistrationFilterDto(
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        fromDate: json["fromDate"],
        userId: json["userId"],
        productId: json["productId"],
      );

  Map<String, dynamic> toMap() => {
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "fromDate": fromDate,
        "userId": userId,
        "productId": productId,
      };
}
