import 'package:utilities/utilities.dart';

class ContactInformationReadDto {
  ContactInformationReadDto({
    this.id,
    this.secondaryId,
    this.title,
    this.titleTr1,
    this.subtitle,
    this.color,
    this.link,
    this.useCase,
    this.parent,
    this.parentId,
    this.media,
  });

  final String? id;
  final int? secondaryId;
  final String? title;
  final String? titleTr1;
  final String? subtitle;
  final String? color;
  final String? link;
  final String? useCase;
  final String? parentId;
  final ContactInformationReadDto? parent;
  final List<MediaReadDto>? media;

  factory ContactInformationReadDto.fromJson(String str) => ContactInformationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContactInformationReadDto.fromMap(Map<String, dynamic> json) => ContactInformationReadDto(
        id: json["id"],
        secondaryId: json["secondaryId"],
        title: json["title"],
        titleTr1: json["titleTr1"],
        subtitle: json["subtitle"],
        color: json["color"],
        link: json["link"],
        useCase: json["useCase"],
        parentId: json["parentId"],
        parent: json["parent"] == null ? null : ContactInformationReadDto.fromMap(json["parent"]),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "secondaryId": secondaryId,
        "title": title,
        "titleTr1": titleTr1,
        "subtitle": subtitle,
        "color": color,
        "link": link,
        "useCase": useCase,
        "parentId": parentId,
        "parent": parent == null ? null : parent!.toMap(),
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
      };
}
