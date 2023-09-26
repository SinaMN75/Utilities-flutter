import 'package:utilities/utilities.dart';

class BlockCreateUpdateDto {
  BlockCreateUpdateDto({
    this.userId,
  });

  final String? userId;

  factory BlockCreateUpdateDto.fromJson(String str) => BlockCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory BlockCreateUpdateDto.fromMap(dynamic json) => BlockCreateUpdateDto(
        userId: json["userId"] == null ? null : json["userId"],
      );

  dynamic toMap() => {
        "userId": userId == null ? null : userId,
      };
}
