part of "../data.dart";

extension CategoryListExtension on Iterable<UCategoryResponse> {
  UCategoryResponse? get speciality => firstWhereOrNull((final UCategoryResponse i) => i.tags.contains(TagCategory.speciality.number));

  List<UCategoryResponse> get specialities => where((final UCategoryResponse i) => i.tags.contains(TagCategory.speciality.number)).toList();
}

class UCategoryResponse {
  UCategoryResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    this.code,
    this.parentId,
    this.parent,
    this.order,
    this.children,
    this.media,
  });

  factory UCategoryResponse.fromJson(String str) => UCategoryResponse.fromMap(json.decode(str));

  factory UCategoryResponse.fromMap(Map<String, dynamic> json) => UCategoryResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        jsonData: UCategoryJson.fromMap(json["jsonData"]),
        tags: List<int>.from(json["tags"].map((dynamic x) => x)),
        title: json["title"],
        code: json["code"],
        parentId: json["parentId"],
        parent: json["parent"] == null ? null : UCategoryResponse.fromMap(json["parent"]),
        order: json["order"],
        children: json["children"] == null ? <UCategoryResponse>[] : List<UCategoryResponse>.from(json["children"].map((dynamic x) => UCategoryResponse.fromMap(x))),
        media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"].map((dynamic x) => UMediaResponse.fromMap(x))),
      );
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UCategoryJson jsonData;
  final List<int> tags;
  final String title;
  final String? code;
  final String? parentId;
  final UCategoryResponse? parent;
  final int? order;
  final List<UCategoryResponse>? children;
  final List<UMediaResponse>? media;

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
        "code": code,
        "children": children == null ? null : List<dynamic>.from(children!.map((UCategoryResponse x) => x.toMap())),
        "media": children == null ? null : List<dynamic>.from(media!.map((UMediaResponse x) => x.toMap())),
      };
}

class UCategoryJson {
  UCategoryJson({
    this.subtitle,
    this.link,
    this.location,
    this.type,
    this.address,
    this.phoneNumber,
    this.relatedProducts,
  });

  factory UCategoryJson.fromJson(String str) => UCategoryJson.fromMap(json.decode(str));

  factory UCategoryJson.fromMap(Map<String, dynamic> json) => UCategoryJson(
        subtitle: json["subtitle"],
        link: json["link"],
        location: json["location"],
        type: json["type"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        relatedProducts: json["relatedProducts"] == null ? <String>[] : List<String>.from(json["relatedProducts"].map((dynamic x) => x)),
      );
  final String? subtitle;
  final String? link;
  final String? location;
  final String? type;
  final String? address;
  final String? phoneNumber;
  final List<String>? relatedProducts;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "subtitle": subtitle,
        "link": link,
        "location": location,
        "type": type,
        "phoneNumber": phoneNumber,
        "address": address,
        "relatedProducts": relatedProducts == null ? null : List<dynamic>.from(relatedProducts!.map((String x) => x)),
      };
}
