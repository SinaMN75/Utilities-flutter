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

  String toJson() => json.encode(toMap());

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
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
    contactInformation: json["contactInformation"] == null ? null : List<ContactInformationReadDto>.from(json["contactInformation"].cast<dynamic>().map(ContactInformationReadDto.fromMap)).toList(),
    media: json["media"] == null ? null : List<MediaReadDto>.from(json["media"].cast<dynamic>().map(MediaReadDto.fromMap)).toList(),
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
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
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
    this.approvalStatus,
    this.dribble,
    this.tags,
    this.contactInformations,
  });

  final String? id;
  final String? title;
  final String? subTitle;
  final String? description;
  final String? dribble;
  final int? tagUseCase;
  final int? approvalStatus;
  final List<int>? tags;
  final List<ContactInformationReadDto>? contactInformations;

  factory ContentCreateUpdateDto.fromJson(String str) => ContentCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentCreateUpdateDto.fromMap(dynamic json) => ContentCreateUpdateDto(
    id: json["id"],
    title: json["title"],
    subTitle: json["subTitle"],
    description: json["description"],
    tagUseCase: json["tagUseCase"],
    dribble: json["dribble"],
    approvalStatus: json["approvalStatus"],
    tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((final dynamic x) => x)),
    contactInformations: json["contactInformations"] == null ? null : List<ContactInformationReadDto>.from(json["contactInformations"].cast<dynamic>().map(ContactInformationReadDto.fromMap)).toList(),
  );

  dynamic toMap() => {
    "id": id,
    "title": title,
    "subTitle": subTitle,
    "description": description,
    "tagUseCase": tagUseCase,
    "dribble": dribble,
    "approvalStatus": approvalStatus,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((final int x) => x)),
    "contactInformations": contactInformations == null ? null : List<dynamic>.from(contactInformations!.map((x) => x.toMap())),
  };
}

class ContentJsonDetail {
  String? dribble;

  ContentJsonDetail({
    this.dribble,
  });

  factory ContentJsonDetail.fromJson(String str) => ContentJsonDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentJsonDetail.fromMap(Map<String, dynamic> json) => ContentJsonDetail(
    dribble: json["dribble"],
  );

  Map<String, dynamic> toMap() => {
    "dribble": dribble,
  };
}
