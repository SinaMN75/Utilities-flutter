import 'dart:convert';

import 'package:utilities/data/dto/media.dart';

class CategoryReadDto {
  CategoryReadDto({
    this.title,
    this.titleTr1,
    this.titleTr2,
    this.color,
    this.useCase,
    this.type,
    this.price,
    this.stock,
    this.count,
    this.order,
    this.categoryJsonDetail,
    this.children,
    this.id,
    this.updatedAt,
    this.parent,
    this.parentId,
    this.media,
  });

  factory CategoryReadDto.fromJson(final String str) => CategoryReadDto.fromMap(json.decode(str));

  factory CategoryReadDto.fromMap(final dynamic json) => CategoryReadDto(
        title: json["title"],
        titleTr1: json["titleTr1"],
        titleTr2: json["titleTr2"],
        color: json["color"],
        useCase: json["useCase"],
        type: json["type"],
        count: json["count"],
        price: json["price"],
        stock: json["stock"],
        order: json["order"],
        categoryJsonDetail: json["jsonDetail"] == null ? null : CategoryJsonDetail.fromMap(json["jsonDetail"]),
        parent: json["parent"] == null ? null : CategoryReadDto.fromMap(json["parent"]),
        children: json["children"] == null ? [] : List<CategoryReadDto>.from(json["children"].cast<dynamic>().map(CategoryReadDto.fromMap)).toList(),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].cast<dynamic>().map(MediaReadDto.fromMap)).toList(),
        id: json["id"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        parentId: json["parentId"],
      );
  String? title;
  String? titleTr1;
  String? titleTr2;
  String? color;
  String? useCase;
  String? type;
  int? price;
  int? stock;
  int? count;
  int? order;
  CategoryJsonDetail? categoryJsonDetail;
  CategoryReadDto? parent;
  List<CategoryReadDto>? children;
  String? id;
  DateTime? updatedAt;
  String? parentId;
  final List<MediaReadDto>? media;

  String toJson() => json.encode(toMap());

  dynamic toMap() => <String, dynamic>{
        "title": title,
        "titleTr1": titleTr1,
        "titleTr2": titleTr2,
        "color": color,
        "useCase": useCase,
        "type": type,
        "price": price,
        "stock": stock,
        "count": count,
        "order": order,
        "categoryJsonDetail": categoryJsonDetail?.toMap(),
        "parent": parent?.toMap(),
        "children": children == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(children!.map((final CategoryReadDto x) => x.toMap())),
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
        "id": id,
        "updatedAt": updatedAt?.toIso8601String(),
        "parentId": parentId,
      };
}

class CategoryJsonDetail {
  CategoryJsonDetail({
    this.subtitle,
    this.link,
    this.latitude,
    this.longitude,
    this.discountedPrice,
    this.value,
    this.date1,
    this.date2,
  });

  factory CategoryJsonDetail.fromJson(final String str) => CategoryJsonDetail.fromMap(json.decode(str));

  factory CategoryJsonDetail.fromMap(final dynamic json) => CategoryJsonDetail(
        subtitle: json["subtitle"],
        link: json["link"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        discountedPrice: json["discountedPrice"],
        value: json["value"],
        date1: json["date1"] == null ? null : DateTime.parse(json["date1"]),
        date2: json["date2"] == null ? null : DateTime.parse(json["date2"]),
      );
  String? subtitle;
  String? link;
  double? latitude;
  double? longitude;
  int? value;
  int? discountedPrice;
  DateTime? date1;
  DateTime? date2;

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
        "subtitle": subtitle,
        "link": link,
        "latitude": latitude,
        "longitude": longitude,
        "value": value,
        "discountedPrice": discountedPrice,
        "date1": date1?.toIso8601String(),
        "date2": date2?.toIso8601String(),
      };
}

class CategoryCreateUpdateDto {
  CategoryCreateUpdateDto({
    this.id,
    this.title,
    this.titleTr1,
    this.titleTr2,
    this.subtitle,
    this.color,
    this.discountedPrice,
    this.link,
    this.useCase,
    this.type,
    this.latitude,
    this.longitude,
    this.price,
    this.value,
    this.stock,
    this.order,
    this.parentId,
    this.isUnique,
  });

  factory CategoryCreateUpdateDto.fromJson(final String str) => CategoryCreateUpdateDto.fromMap(json.decode(str));

  factory CategoryCreateUpdateDto.fromMap(final dynamic json) => CategoryCreateUpdateDto(
        id: json["id"],
        title: json["title"],
        titleTr1: json["titleTr1"],
        titleTr2: json["titleTr2"],
        subtitle: json["subtitle"],
        color: json["color"],
        link: json["link"],
        useCase: json["useCase"],
        discountedPrice: json["discountedPrice"],
        type: json["type"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        price: json["price"],
        value: json["value"],
        stock: json["stock"],
        order: json["order"],
        parentId: json["parentId"],
        isUnique: json["isUnique"],
      );
  String? id;
  String? title;
  String? titleTr1;
  String? titleTr2;
  String? subtitle;
  String? color;
  String? link;
  String? useCase;
  String? type;
  double? latitude;
  double? longitude;
  int? price;
  int? discountedPrice;
  int? value;
  int? stock;
  int? order;
  String? parentId;
  bool? isUnique;

  String toJson() => json.encode(toMap());

  dynamic toMap() => <String, dynamic>{
        "id": id,
        "title": title,
        "titleTr1": titleTr1,
        "titleTr2": titleTr2,
        "subtitle": subtitle,
        "color": color,
        "link": link,
        "useCase": useCase,
        "type": type,
        "latitude": latitude,
        "longitude": longitude,
        "price": price,
        "discountedPrice": discountedPrice,
        "value": value,
        "stock": stock,
        "order": order,
        "parentId": parentId,
        "isUnique": isUnique,
      };
}

class CategoryFilterDto {
  CategoryFilterDto({
    this.title,
    this.titleTr1,
    this.titleTr2,
    this.useCase,
    this.type,
    this.parentId,
    this.showMedia,
    this.orderByOrder,
    this.orderByOrderDescending,
    this.orderByCreatedAt,
    this.orderByCreatedAtDescending,
  });

  factory CategoryFilterDto.fromJson(final String str) => CategoryFilterDto.fromMap(json.decode(str));

  factory CategoryFilterDto.fromMap(final dynamic json) => CategoryFilterDto(
        title: json["title"],
        titleTr1: json["titleTr1"],
        titleTr2: json["titleTr2"],
        useCase: json["useCase"],
        type: json["type"],
        parentId: json["parentId"],
        showMedia: json["showMedia"],
        orderByOrder: json["orderByOrder"],
        orderByOrderDescending: json["orderByOrderDescending"],
        orderByCreatedAt: json["orderByCreatedAt"],
        orderByCreatedAtDescending: json["orderByCreatedAtDescending"],
      );
  String? title;
  String? titleTr1;
  String? titleTr2;
  String? useCase;
  String? type;
  String? parentId;
  bool? showMedia;
  bool? orderByOrder;
  bool? orderByOrderDescending;
  bool? orderByCreatedAt;
  bool? orderByCreatedAtDescending;

  String toJson() => json.encode(toMap());

  dynamic toMap() => {
        "title": title,
        "titleTr1": titleTr1,
        "titleTr2": titleTr2,
        "useCase": useCase,
        "type": type,
        "parentId": parentId,
        "showMedia": showMedia,
        "orderByOrder": orderByOrder,
        "orderByOrderDescending": orderByOrderDescending,
        "orderByCreatedAt": orderByCreatedAt,
        "orderByCreatedAtDescending": orderByCreatedAtDescending,
      };
}

extension CategoryReadDtoExtension on List<CategoryReadDto>? {
  List<CategoryReadDto> getByTypeUseCase({required final String type, required final String useCase}) =>
      this
          ?.where(
            (final CategoryReadDto e) => e.type == type && e.useCase == useCase,
          )
          .toList() ??
      <CategoryReadDto>[];

  List<CategoryReadDto> getByType({required final type}) =>
      this
          ?.where(
            (final CategoryReadDto e) => e.type == type,
          )
          .toList() ??
      <CategoryReadDto>[];

  List<CategoryReadDto> getByUseCase({required final useCase}) =>
      this
          ?.where(
            (final CategoryReadDto e) => e.useCase == useCase,
          )
          .toList() ??
      <CategoryReadDto>[];

  CategoryReadDto firstIfNull() => (this ?? <CategoryReadDto>[]).isNotEmpty ? this!.first : CategoryReadDto();
}
