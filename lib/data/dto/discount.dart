part of '../data.dart';

class DiscountReadDto {
  DiscountReadDto({
    this.id,
    this.title,
    this.discountPercent,
    this.numberUses,
    this.code,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? title;
  final int? discountPercent;
  final int? numberUses;
  final String? code;
  final String? startDate;
  final String? endDate;
  final String? createdAt;
  final String? updatedAt;

  factory DiscountReadDto.fromJson(String str) => DiscountReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory DiscountReadDto.fromMap(dynamic json) => DiscountReadDto(
        id: json["id"],
        title: json["title"],
        discountPercent: json["discountPercent"],
        numberUses: json["numberUses"],
        code: json["code"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
        "discountPercent": discountPercent,
        "numberUses": numberUses,
        "code": code,
        "startDate": startDate,
        "endDate": endDate,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}

class DiscountFilterDto {
  DiscountFilterDto({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title,
    this.discountPercent,
    this.numberUses,
    this.code,
    this.startDate,
    this.endDate,
  });

  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? title;
  final int? discountPercent;
  final int? numberUses;
  final String? code;
  final String? startDate;
  final String? endDate;

  factory DiscountFilterDto.fromJson(String str) => DiscountFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory DiscountFilterDto.fromMap(dynamic json) => DiscountFilterDto(
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        title: json["title"],
        discountPercent: json["discountPercent"],
        numberUses: json["numberUses"],
        code: json["code"],
        startDate: json["startDate"],
        endDate: json["endDate"],
      );

  dynamic toMap() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "title": title,
        "discountPercent": discountPercent,
        "numberUses": numberUses,
        "code": code,
        "startDate": startDate,
        "endDate": endDate,
      };
}
