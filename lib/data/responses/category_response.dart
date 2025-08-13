part of "../data.dart";

extension CategoryListExtension on Iterable<CategoryResponse> {
  CategoryResponse? get speciality => firstWhereOrNull((final CategoryResponse i) => i.tags.contains(TagCategory.speciality.number));
  List<CategoryResponse> get specialities => where((final CategoryResponse i) => i.tags.contains(TagCategory.speciality.number)).toList();
}


class CategoryResponse {

  CategoryResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    this.parentId,
    this.parent,
    this.order,
    this.children,
    this.media,
  });

  factory CategoryResponse.fromJson(String str) => CategoryResponse.fromMap(json.decode(str));

  factory CategoryResponse.fromMap(Map<String, dynamic> json) => CategoryResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        jsonData: CategoryJson.fromMap(json["jsonData"]),
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        title: json["title"],
        parentId: json["parentId"],
        parent: json["parent"] == null ? null : CategoryResponse.fromMap(json["parent"]),
        order: json["order"],
        children: json["children"] == null ? <CategoryResponse>[] : List<CategoryResponse>.from(json["children"].map((dynamic x) => CategoryResponse.fromMap(x))),
        media: json["media"] == null ? <MediaResponse>[] : List<MediaResponse>.from(json["media"].map((dynamic x) => MediaResponse.fromMap(x))),
      );
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CategoryJson jsonData;
  final List<int> tags;
  final String title;
  final String? parentId;
  final CategoryResponse? parent;
  final int? order;
  final List<CategoryResponse>? children;
  final List<MediaResponse>? media;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "jsonData": jsonData.toMap(),
        "tags": List<dynamic>.from(tags.map((int x) => x)),
        "title": title,
        "parentId": parentId,
        "parent": parent?.toMap(),
        "order": order,
        "children": children == null ? null : List<dynamic>.from(children!.map((CategoryResponse x) => x.toMap())),
        "media": children == null ? null : List<dynamic>.from(media!.map((MediaResponse x) => x.toMap())),
      };
}

class CategoryJson {

  CategoryJson({
    this.subtitle,
    this.link,
    this.location,
    this.type,
    this.relatedProducts,
  });

  factory CategoryJson.fromJson(String str) => CategoryJson.fromMap(json.decode(str));

  factory CategoryJson.fromMap(Map<String, dynamic> json) => CategoryJson(
        subtitle: json["subtitle"],
        link: json["link"],
        location: json["location"],
        type: json["type"],
        relatedProducts: json["relatedProducts"] == null ? <String>[] : List<String>.from(json["relatedProducts"].map((dynamic x) => x)),
      );
  final String? subtitle;
  final String? link;
  final String? location;
  final String? type;
  final List<String>? relatedProducts;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "subtitle": subtitle,
        "link": link,
        "location": location,
        "type": type,
        "relatedProducts": relatedProducts == null ? null : List<dynamic>.from(relatedProducts!.map((String x) => x)),
      };
}
