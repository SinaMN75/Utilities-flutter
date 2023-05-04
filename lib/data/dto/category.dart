import 'package:utilities/utilities.dart';

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
}

class CategoryCreateUpdateDto {
  CategoryCreateUpdateDto({
    this.id,
    this.parentId,
    this.title,
    this.titleTr1,
    this.titleTr2,
    this.subtitle,
    this.link,
    this.color,
    this.useCase,
    this.type,
    this.isUnique,
  });

  final String? id;
  final String? parentId;
  final String? title;
  final String? titleTr1;
  final String? titleTr2;
  final String? subtitle;
  final String? link;
  final String? color;
  final String? useCase;
  final String? type;
  final bool? isUnique;

  factory CategoryCreateUpdateDto.fromJson(String str) => CategoryCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryCreateUpdateDto.fromMap(Map<String, dynamic> json) =>
      CategoryCreateUpdateDto(
        id: json["id"],
        parentId: json["parentId"],
        title: json["title"],
        titleTr1: json["titleTr1"],
        titleTr2: json["titleTr2"],
        subtitle: json["subtitle"],
        link: json["link"],
        color: json["color"],
        useCase: json["useCase"],
        type: json["type"],
        isUnique: json["isUnique"],
      );

  Map<String, dynamic> toMap() =>
      {
        "id": id,
        "parentId": parentId,
        "title": title,
        "titleTr1": titleTr1,
        "titleTr2": titleTr2,
        "subtitle": subtitle,
        "link": link,
        "color": color,
        "useCase": useCase,
        "type": type,
        "isUnique": isUnique,
      };
}

class CategoryReadDto {
  CategoryReadDto({
    this.id,
    this.title,
    this.titleTr1,
    this.titleTr2,
    this.subtitle,
    this.color,
    this.link,
    this.useCase,
    this.type,
    this.parent,
    this.children,
    this.parentId,
    this.media,
  });

  final String? id;
  final String? title;
  final String? titleTr1;
  final String? titleTr2;
  final String? subtitle;
  final String? color;
  final String? link;
  final String? useCase;
  final String? type;
  CategoryReadDto? parent;
  final List<CategoryReadDto>? children;
  final String? parentId;
  final List<MediaReadDto>? media;

  factory CategoryReadDto.fromJson(String str) => CategoryReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryReadDto.fromMap(Map<String, dynamic> json) {
    try {
      return CategoryReadDto(
        id: json["id"],
        title: json["title"],
        titleTr1: json["titleTr1"],
        titleTr2: json["titleTr2"],
        subtitle: json["subtitle"],
        color: json["color"],
        link: json["link"],
        useCase: json["useCase"],
        type: json["type"],
        parentId: json["parentId"],
        parent: json["parent"] == null ? null : CategoryReadDto.fromMap(json["parent"]),
        children: json["children"] == null ? null : List<CategoryReadDto>.from(json["children"].map((x) => CategoryReadDto.fromMap(x))),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
      );
    } catch (e) {
      print(e.toString());
      return CategoryReadDto();
    }
  }

  Map<String, dynamic> toMap() =>
      {
        "id": id,
        "title": title,
        "titleTr1": titleTr1,
        "titleTr2": titleTr2,
        "subtitle": subtitle,
        "color": color,
        "link": link,
        "useCase": useCase,
        "type": type,
        "parentId": parentId,
        "parent":parent==null?null: parent!.toMap(),
        "children":children==null?null: List<dynamic>.from(children!.map((x) => x.toMap())),
        "media":media==null?null: List<dynamic>.from(media!.map((x) => x.toMap())),
      };
}

class CategoryFilterDto {
  CategoryFilterDto({
    this.id,
    this.title,
    this.titleTr1,
    this.titleTr2,
    this.useCase,
    this.type,
    this.parentId,
    this.showMedia,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final String? id;
  final String? title;
  final String? titleTr1;
  final String? titleTr2;
  final String? useCase;
  final String? type;
  final String? parentId;
  final bool? showMedia;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  factory CategoryFilterDto.fromJson(String str) => CategoryFilterDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryFilterDto.fromMap(Map<String, dynamic> json) => CategoryFilterDto(
    id: json["id"],
    title: json["title"],
    titleTr1: json["titleTr1"],
    titleTr2: json["titleTr2"],
    useCase: json["useCase"],
    type: json["type"],
    parentId: json["parentId"],
    showMedia: json["showMedia"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "titleTr1": titleTr1,
    "titleTr2": titleTr2,
    "useCase": useCase,
    "type": type,
    "parentId": parentId,
    "showMedia": showMedia,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deletedAt": deletedAt?.toIso8601String(),
  };
}
