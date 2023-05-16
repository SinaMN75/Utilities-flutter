import 'dart:convert';

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
  });

  factory AddressReadDto.fromJson(final String str) => AddressReadDto.fromMap(json.decode(str));

  factory AddressReadDto.fromMap(final Map<String, dynamic> json) => AddressReadDto(
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

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
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
}
