import 'package:utilities/utilities.dart';

class ContentReadDto {
  ContentReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title,
    this.subTitle,
    this.description,
    this.useCase,
    this.contactInformation,
    this.media,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? title;
  final String? subTitle;
  final String? description;
  final String? useCase;
  final List<ContactInformationReadDto>? contactInformation;
  final List<MediaReadDto>? media;

  factory ContentReadDto.fromJson(String str) => ContentReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentReadDto.fromMap(Map<String, dynamic> json) => ContentReadDto(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
        useCase: json["useCase"],
        contactInformation: json["contactInformation"] == null ? null : List<ContactInformationReadDto>.from(json["contactInformation"].map((x) => ContactInformationReadDto.fromMap(x))),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].map((x) => MediaReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "useCase": useCase,
        "contactInformation": contactInformation == null ? null : List<dynamic>.from(contactInformation!.map((x) => x.toMap())),
        "media": media == null ? null : List<dynamic>.from(media!.map((x) => x.toMap())),
      };
}

class ContentCreateUpdateDto {
  ContentCreateUpdateDto({
    this.id,
    this.title,
    this.subTitle,
    this.description,
    this.useCase,
    this.approvalStatus,
    this.contactInformations,
  });

  final String? id;
  final String? title;
  final String? subTitle;
  final String? description;
  final String? useCase;
  final int? approvalStatus;
  final List<ContactInformationReadDto>? contactInformations;

  factory ContentCreateUpdateDto.fromJson(String str) => ContentCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentCreateUpdateDto.fromMap(Map<String, dynamic> json) => ContentCreateUpdateDto(
        id: json["id"],
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
        useCase: json["useCase"],
        approvalStatus: json["approvalStatus"],
        contactInformations: json["contactInformations"] == null ? null : List<ContactInformationReadDto>.from(json["contactInformations"].map((x) => ContactInformationReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "useCase": useCase,
        "approvalStatus": approvalStatus,
        "contactInformations": contactInformations == null ? null : List<dynamic>.from(contactInformations!.map((x) => x.toMap())),
      };
}
