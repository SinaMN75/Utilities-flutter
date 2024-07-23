part of '../data.dart';

// class DiscountReadDto {
//   DiscountReadDto({
//     this.id,
//     this.title,
//     this.discountPrice,
//     this.numberUses,
//     this.code,
//     this.startDate,
//     this.endDate,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   final String? id;
//   final String? title;
//   final int? discountPrice;
//   final int? numberUses;
//   final String? code;
//   final String? startDate;
//   final String? endDate;
//   final String? createdAt;
//   final String? updatedAt;
//
//   factory DiscountReadDto.fromJson(String str) => DiscountReadDto.fromMap(json.decode(str));
//
//   String toJson() => json.encode(removeNullEntries(toMap()));
//
//   factory DiscountReadDto.fromMap(dynamic json) => DiscountReadDto(
//         id: json["id"],
//         title: json["title"],
//         discountPrice: json["discountPrice"],
//         numberUses: json["numberUses"],
//         code: json["code"],
//         startDate: json["startDate"],
//         endDate: json["endDate"],
//         createdAt: json["createdAt"],
//         updatedAt: json["updatedAt"],
//       );
//
//   dynamic toMap() => {
//         "id": id,
//         "title": title,
//         "discountPrice": discountPrice,
//         "numberUses": numberUses,
//         "code": code,
//         "startDate": startDate,
//         "endDate": endDate,
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//       };
// }


class DiscountReadDto {
  String? title;
  String? code;
  int? discountPrice;
  int? numberUses;
  DateTime? startDate;
  DateTime? endDate;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  DiscountReadDto({
    this.title,
    this.code,
    this.discountPrice,
    this.numberUses,
    this.startDate,
    this.endDate,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory DiscountReadDto.fromRawJson(String str) => DiscountReadDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DiscountReadDto.fromJson(Map<String, dynamic> json) => DiscountReadDto(
    title: json["title"],
    code: json["code"],
    discountPrice: json["discountPrice"],
    numberUses: json["numberUses"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "code": code,
    "discountPrice": discountPrice,
    "numberUses": numberUses,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}


class DiscountCreateDto {
  String? title;
  String? code;
  int? discountPrice;
  int? numberUses;
  DateTime? startDate;
  DateTime? endDate;
  String? userId;

  DiscountCreateDto({
    this.title,
    this.code,
    this.discountPrice,
    this.numberUses,
    this.startDate,
    this.endDate,
    this.userId,
  });

  factory DiscountCreateDto.fromRawJson(String str) => DiscountCreateDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DiscountCreateDto.fromJson(Map<String, dynamic> json) => DiscountCreateDto(
    title: json["title"],
    code: json["code"],
    discountPrice: json["discountPrice"],
    numberUses: json["numberUses"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "code": code,
    "discountPrice": discountPrice,
    "numberUses": numberUses,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "userId": userId,
  };
}

class DiscountFilterDto {
  int? pageSize;
  int? pageNumber;
  DateTime? fromDate;
  String? title;
  String? code;
  int? numberUses;
  DateTime? startDate;
  DateTime? endDate;

  DiscountFilterDto({
    this.pageSize,
    this.pageNumber,
    this.fromDate,
    this.title,
    this.code,
    this.numberUses,
    this.startDate,
    this.endDate,
  });

  factory DiscountFilterDto.fromRawJson(String str) => DiscountFilterDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DiscountFilterDto.fromJson(Map<String, dynamic> json) => DiscountFilterDto(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromDate: json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
    title: json["title"],
    code: json["code"],
    numberUses: json["numberUses"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
  );

  Map<String, dynamic> toJson() => {
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromDate": fromDate?.toIso8601String(),
    "title": title,
    "code": code,
    "numberUses": numberUses,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
  };
}


// class DiscountFilterDto {
//   DiscountFilterDto({
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.title,
//     this.discountPrice,
//     this.numberUses,
//     this.pageSize,
//     this.pageNumber,
//     this.code,
//     this.startDate,
//     this.endDate,
//   });
//
//   final String? createdAt;
//   final String? updatedAt;
//   final String? deletedAt;
//   final String? title;
//   final int? discountPrice;
//   final int? numberUses;
//   final int? pageSize;
//   final int? pageNumber;
//   final String? code;
//   final String? startDate;
//   final String? endDate;
//
//   factory DiscountFilterDto.fromJson(String str) => DiscountFilterDto.fromMap(json.decode(str));
//
//   String toJson() => json.encode(removeNullEntries(toMap()));
//
//   factory DiscountFilterDto.fromMap(dynamic json) => DiscountFilterDto(
//         createdAt: json["createdAt"],
//         updatedAt: json["updatedAt"],
//         deletedAt: json["deletedAt"],
//         title: json["title"],
//         discountPrice: json["discountPrice"],
//         numberUses: json["numberUses"],
//         code: json["code"],
//         startDate: json["startDate"],
//         endDate: json["endDate"],
//       );
//
//   dynamic toMap() => {
//         "createdAt": createdAt,
//         "updatedAt": updatedAt,
//         "deletedAt": deletedAt,
//         "title": title,
//         "discountPrice": discountPrice,
//         "numberUses": numberUses,
//         "code": code,
//         "startDate": startDate,
//         "endDate": endDate,
//       };
// }
