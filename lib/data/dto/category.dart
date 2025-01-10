part of '../data.dart';

extension CategoryReadDtoListExtension on Iterable<CategoryReadDto> {
  List<CategoryReadDto> whereByTag(final TagCategory tag) => where(
        (final CategoryReadDto i) => i.tags.contains(tag.number),
      ).toList();

  List<CategoryReadDto> whereByParentId(final String parentId) => where(
        (final CategoryReadDto i) => i.parentId == parentId,
      ).toList();
}

extension OptionalCategoryReadDtoListExtension on Iterable<CategoryReadDto>? {
  List<CategoryReadDto> whereByTag(final TagCategory tag) => (this ?? <CategoryReadDto>[])
      .where(
        (final CategoryReadDto i) => i.tags.contains(tag.number),
      )
      .toList();

  List<CategoryReadDto> whereByParentId(final String parentId) => (this ?? <CategoryReadDto>[])
      .where(
        (final CategoryReadDto i) => i.parentId == parentId,
      )
      .toList();
}

class CategoryReadDto {
  CategoryReadDto({
    required this.id,
    this.title,
    this.titleTr1,
    this.titleTr2,
    this.color,
    this.price,
    this.stock,
    this.count,
    this.order,
    required this.jsonDetail,
    this.updatedAt,
    this.children,
    this.parent,
    this.parentId,
    this.media,
    required this.tags,
  });

  factory CategoryReadDto.fromJson(final String str) => CategoryReadDto.fromMap(json.decode(str));

  factory CategoryReadDto.fromMap(final dynamic json) => CategoryReadDto(
        title: json["title"],
        titleTr1: json["titleTr1"],
        titleTr2: json["titleTr2"],
        color: json["color"],
        count: json["count"],
        price: json["price"],
        stock: json["stock"],
        order: json["order"],
        tags: List<int>.from(json["tags"]!.map((final dynamic x) => x)),
        jsonDetail: CategoryJsonDetail.fromMap(json["jsonDetail"]),
        parent: json["parent"] == null ? null : CategoryReadDto.fromMap(json["parent"]),
        parentId: json["parentId"],
        children: json["children"] == null ? <CategoryReadDto>[] : List<CategoryReadDto>.from(json["children"].cast<Map<String, dynamic>>().map(CategoryReadDto.fromMap)).toList(),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
        id: json["id"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );
  String? title;
  String? titleTr1;
  String? titleTr2;
  String? color;
  int? price;
  int? stock;
  int? count;
  int? order;
  CategoryJsonDetail jsonDetail;
  CategoryReadDto? parent;
  String? parentId;
  List<CategoryReadDto>? children;
  List<int> tags;
  String id;
  DateTime? updatedAt;
  final List<MediaReadDto>? media;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, dynamic>{
        "title": title,
        "titleTr1": titleTr1,
        "titleTr2": titleTr2,
        "color": color,
        "price": price,
        "stock": stock,
        "count": count,
        "order": order,
        "categoryJsonDetail": jsonDetail.toMap(),
        "parent": parent?.toMap(),
        "children": List<CategoryReadDto>.from(children!.map((final CategoryReadDto x) => x.toMap())),
        "parentId": parentId,
        "tags": List<dynamic>.from(tags.map((final int x) => x)),
        "media": media == null ? null : List<dynamic>.from(media!.map((final MediaReadDto x) => x.toMap())),
        "id": id,
        "updatedAt": updatedAt?.toIso8601String(),
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
  double? value;
  int? discountedPrice;
  DateTime? date1;
  DateTime? date2;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, Object?>{
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
    this.latitude,
    this.longitude,
    this.price,
    this.value,
    this.stock,
    this.order,
    this.tags,
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
        discountedPrice: json["discountedPrice"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        price: json["price"],
        value: json["value"],
        stock: json["stock"],
        order: json["order"],
        parentId: json["parentId"],
        tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
        isUnique: json["isUnique"],
      );
  String? id;
  String? title;
  String? titleTr1;
  String? titleTr2;
  String? subtitle;
  String? color;
  String? link;
  double? latitude;
  double? longitude;
  int? price;
  int? discountedPrice;
  double? value;
  int? stock;
  int? order;
  List<int>? tags;
  String? parentId;
  bool? isUnique;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, dynamic>{
        "id": id,
        "title": title,
        "titleTr1": titleTr1,
        "titleTr2": titleTr2,
        "subtitle": subtitle,
        "color": color,
        "link": link,
        "latitude": latitude,
        "longitude": longitude,
        "price": price,
        "discountedPrice": discountedPrice,
        "value": value,
        "stock": stock,
        "order": order,
        "parentId": parentId,
        "isUnique": isUnique,
        "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((final int x) => x)),
      };
}

class CategoryFilterDto {
  CategoryFilterDto({
    this.title,
    this.titleTr1,
    this.titleTr2,
    this.parentId,
    this.showMedia,
    this.showByChildren,
    this.orderByOrder,
    this.orderByOrderDescending,
    this.orderByCreatedAt,
    this.tags,
    this.orderByCreatedAtDescending,
    this.pageSize,
    this.pageNumber,
  });

  factory CategoryFilterDto.fromJson(final String str) => CategoryFilterDto.fromMap(json.decode(str));

  factory CategoryFilterDto.fromMap(final dynamic json) => CategoryFilterDto(
        title: json["title"],
        titleTr1: json["titleTr1"],
        titleTr2: json["titleTr2"],
        parentId: json["parentId"],
        showMedia: json["showMedia"],
        showByChildren: json["showByChildren"],
        orderByOrder: json["orderByOrder"],
        orderByOrderDescending: json["orderByOrderDescending"],
        orderByCreatedAt: json["orderByCreatedAt"],
        tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
        orderByCreatedAtDescending: json["orderByCreatedAtDescending"],
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
      );
  String? title;
  String? titleTr1;
  String? titleTr2;
  String? parentId;
  bool? showMedia;
  bool? showByChildren;
  bool? orderByOrder;
  bool? orderByOrderDescending;
  bool? orderByCreatedAt;
  List<int>? tags;
  bool? orderByCreatedAtDescending;
  int? pageSize;
  int? pageNumber;

  String toJson() => json.encode(removeNullEntries(toMap()));

  dynamic toMap() => <String, Object?>{
        "title": title,
        "titleTr1": titleTr1,
        "titleTr2": titleTr2,
        "parentId": parentId,
        "showMedia": showMedia,
        "showByChildren": showByChildren,
        "orderByOrder": orderByOrder,
        "orderByOrderDescending": orderByOrderDescending,
        "orderByCreatedAt": orderByCreatedAt,
        "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((final int x) => x)),
        "orderByCreatedAtDescending": orderByCreatedAtDescending,
        "pageSize": pageSize,
        "pageNumber": pageNumber,
      };
}

extension CategoryReadDtoExtension on List<CategoryReadDto>? {
  List<CategoryReadDto> getByTagTypeUseCase({required final int type, required final int tagUseCase}) => this?.where((final CategoryReadDto e) => e.tags.contains(type) && e.tags.contains(tagUseCase)).toList() ?? <CategoryReadDto>[];

  List<CategoryReadDto> getByTagType({required final int type}) =>
      this
          ?.where(
            (final CategoryReadDto e) => e.tags.contains(type),
          )
          .toList() ??
      <CategoryReadDto>[];

  List<CategoryReadDto> getByTagUseCase({required final int tagUseCase}) =>
      this
          ?.where(
            (final CategoryReadDto e) => e.tags.contains(tagUseCase),
          )
          .toList() ??
      <CategoryReadDto>[];
}
