// To parse this JSON data, do
//
//     final createGroupMessage = createGroupMessageFromMap(jsonString);

// import 'dart:convert';
//
// import 'package:utilities/data/dto/product.dart';
//
//
// class Result {
//   Result({
//     this.creatorUserId,
//     this.productId,
//     this.product,
//     this.reportType,
//     this.id,
//     this.title,
//     this.description,
//     this.commentId,
//   });
//
//   final String? creatorUserId;
//   final String? productId;
//   final ProductReadDto? product;
//   final int? reportType;
//   final String? id;
//   final String? title;
//   final String? description;
//   final String? commentId;
//
//   factory Result.fromJson(String str) => Result.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory Result.fromMap(Map<String, dynamic> json) => Result(
//     creatorUserId: json["creatorUserId"],
//     productId: json["productId"],
//     product: json["product"] == null ? null : ProductReadDto.fromMap(json["product"]),
//     reportType: json["reportType"],
//     id: json["id"],
//     title: resultTitleValues.map[json["title"]]!,
//     description: json["description"],
//     commentId: json["commentId"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "creatorUserId": creatorUserId,
//     "productId": productId,
//     "product": product?.toMap(),
//     "reportType": reportType,
//     "id": id,
//     "title": resultTitleValues.reverse[title],
//     "description": description,
//     "commentId": commentId,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
