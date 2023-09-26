import 'dart:convert';

import 'package:utilities/utilities.dart';

class AddressReadDto {
  AddressReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.receiverFullName,
    this.receiverPhoneNumber,
    this.address,
    this.pelak,
    this.unit,
    this.postalCode,
    this.isDefault,
    this.isSelected,
  });

  factory AddressReadDto.fromJson(final String str) => AddressReadDto.fromMap(json.decode(str));

  factory AddressReadDto.fromMap(final dynamic json) => AddressReadDto(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        receiverFullName: json["receiverFullName"],
        receiverPhoneNumber: json["receiverPhoneNumber"],
        address: json["address"],
        pelak: json["pelak"],
        unit: json["unit"],
        postalCode: json["postalCode"],
        isDefault: json["isDefault"],
      );

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, dynamic>{
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "receiverFullName": receiverFullName,
        "receiverPhoneNumber": receiverPhoneNumber,
        "address": address,
        "pelak": pelak,
        "unit": unit,
        "postalCode": postalCode,
        "isDefault": isDefault,
      };

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? receiverFullName;
  final String? receiverPhoneNumber;
  final String? address;
  final String? pelak;
  final String? unit;
  final String? postalCode;
  final bool? isDefault;
  final bool? isSelected;
}

class AddressCreateUpdateDto {
  AddressCreateUpdateDto({
    this.id,
    this.receiverFullName,
    this.receiverPhoneNumber,
    this.address,
    this.pelak,
    this.unit,
    this.postalCode,
    this.isDefault,
  });

  factory AddressCreateUpdateDto.fromJson(final String str) => AddressCreateUpdateDto.fromMap(json.decode(str));

  factory AddressCreateUpdateDto.fromMap(final dynamic json) => AddressCreateUpdateDto(
        id: json["id"],
        receiverFullName: json["receiverFullName"],
        receiverPhoneNumber: json["receiverPhoneNumber"],
        address: json["address"],
        pelak: json["pelak"],
        unit: json["unit"],
        postalCode: json["postalCode"],
        isDefault: json["isDefault"],
      );

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, dynamic>{
        "id": id,
        "receiverFullName": receiverFullName,
        "receiverPhoneNumber": receiverPhoneNumber,
        "address": address,
        "pelak": pelak,
        "unit": unit,
        "postalCode": postalCode,
        "isDefault": isDefault,
      };

  final String? id;
  final String? receiverFullName;
  final String? receiverPhoneNumber;
  final String? address;
  final String? pelak;
  final String? unit;
  final String? postalCode;
  final bool? isDefault;
}

class AddressFilterDto {
  AddressFilterDto({
    this.userId,
    this.pageSize,
    this.pageNumber,
  });

  factory AddressFilterDto.fromJson(final String str) => AddressFilterDto.fromMap(json.decode(str));

  factory AddressFilterDto.fromMap(final dynamic json) => AddressFilterDto(
    userId: json["userId"],
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
  );

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, dynamic>{
    "userId": userId,
    "pageSize": pageSize,
    "pageNumber": pageNumber,
  };

  final String? userId;
  final String? pageSize;
  final String? pageNumber;
}
