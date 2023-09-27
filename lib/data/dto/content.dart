part of '../data.dart';

extension ContentReadDtoExtension on List<ContentReadDto> {
  List<ContentReadDto> getByTags({required final List<TagContent> tags}) => where(
        (final ContentReadDto e) => e.tags.containsAll(tags.getNumbers()),
      ).toList();
}

class ContentReadDto {
  ContentReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title,
    this.subTitle,
    this.description,
    this.tagUseCase,
    this.jsonDetail,
    this.contactInformation,
    this.media,
    this.tags,
  });

  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? title;
  final String? subTitle;
  final String? description;
  final int? tagUseCase;
  final ContentJsonDetail? jsonDetail;
  final List<ContactInformationReadDto>? contactInformation;
  final List<MediaReadDto>? media;
  final List<int>? tags;

  factory ContentReadDto.fromJson(String str) => ContentReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory ContentReadDto.fromMap(dynamic json) => ContentReadDto(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
        tagUseCase: json["tagUseCase"],
        jsonDetail: json["jsonDetail"] == null ? null : ContentJsonDetail.fromMap(json["jsonDetail"]),
        tags: json["tags"] == null ? null : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
        contactInformation: json["contactInformation"] == null ? null : List<ContactInformationReadDto>.from(json["contactInformation"].cast<Map<String, dynamic>>().map(ContactInformationReadDto.fromMap)).toList(),
        media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].cast<Map<String, dynamic>>().map(MediaReadDto.fromMap)).toList(),
      );

  dynamic toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "tagUseCase": tagUseCase,
        "jsonDetail": jsonDetail?.toMap(),
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((final int x) => x)),
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
    this.tagUseCase,
    this.website,
    this.approvalStatus,
    this.dribble,
    this.tags,
    this.contactInformations,
  });

  final String? id;
  final String? title;
  final String? subTitle;
  final String? description;
  final String? website;
  final String? dribble;
  final int? tagUseCase;
  final int? approvalStatus;
  final List<int>? tags;
  final List<ContactInformationReadDto>? contactInformations;

  factory ContentCreateUpdateDto.fromJson(String str) => ContentCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory ContentCreateUpdateDto.fromMap(dynamic json) => ContentCreateUpdateDto(
        id: json["id"],
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
        website: json["website"],
        tagUseCase: json["tagUseCase"],
        dribble: json["dribble"],
        approvalStatus: json["approvalStatus"],
        tags: json["tags"] == null ? null : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
        contactInformations: json["contactInformations"] == null ? null : List<ContactInformationReadDto>.from(json["contactInformations"].cast<Map<String, dynamic>>().map(ContactInformationReadDto.fromMap)).toList(),
      );

  dynamic toMap() => {
        "id": id,
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "website": website,
        "tagUseCase": tagUseCase,
        "dribble": dribble,
        "approvalStatus": approvalStatus,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((final int x) => x)),
        "contactInformations": contactInformations == null ? null : List<dynamic>.from(contactInformations!.map((x) => x.toMap())),
      };
}

class ContentJsonDetail {
  String? dribble;
  String? website;

  ContentJsonDetail({
    this.dribble,
    this.website,
  });

  factory ContentJsonDetail.fromJson(String str) => ContentJsonDetail.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory ContentJsonDetail.fromMap(Map<String, dynamic> json) => ContentJsonDetail(
        dribble: json["dribble"],
        website: json["website"],
      );

  Map<String, dynamic> toMap() => {
        "dribble": dribble,
        "website": website,
      };
}
