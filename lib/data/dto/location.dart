import 'package:utilities/utilities.dart';

class IranLocationReadDto {
  IranLocationReadDto({
    this.id,
    this.name,
    this.slug,
    this.provinceId,
  });

  factory IranLocationReadDto.fromJson(final String str) => IranLocationReadDto.fromMap(json.decode(str));

  factory IranLocationReadDto.fromMap(final dynamic json) => IranLocationReadDto(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        provinceId: json["province_id"],
      );

  final int? id;
  final String? name;
  final String? slug;
  final int? provinceId;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "province_id": provinceId,
      };
}
