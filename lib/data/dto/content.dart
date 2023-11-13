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
  final String? instagram;
  final String? telegram;
  final String? whatsApp;
  final String? linkedIn;
  final String? dribble;
  final String? soundCloud;
  final String? pinterest;
  final String? website;
  final String? phoneNumber1;
  final String? phoneNumber2;
  final String? email1;
  final String? email2;
  final String? address1;
  final String? address2;
  final String? address3;

  ContentJsonDetail({
    this.instagram,
    this.telegram,
    this.whatsApp,
    this.linkedIn,
    this.dribble,
    this.soundCloud,
    this.pinterest,
    this.website,
    this.phoneNumber1,
    this.phoneNumber2,
    this.email1,
    this.email2,
    this.address1,
    this.address2,
    this.address3,
  });

  factory ContentJsonDetail.fromJson(String str) => ContentJsonDetail.fromMap(json.decode(str));

  String toJson() => json.encode(removeNullEntries(toMap()));

  factory ContentJsonDetail.fromMap(Map<String, dynamic> json) => ContentJsonDetail(
        instagram: json["instagram"],
        telegram: json["telegram"],
        whatsApp: json["whatsApp"],
        linkedIn: json["linkedIn"],
        dribble: json["dribble"],
        soundCloud: json["soundCloud"],
        pinterest: json["pinterest"],
        website: json["website"],
        phoneNumber1: json["phoneNumber1"],
        phoneNumber2: json["phoneNumber2"],
        email1: json["email1"],
        email2: json["email2"],
        address1: json["address1"],
        address2: json["address2"],
        address3: json["address3"],
      );

  Map<String, dynamic> toMap() =>
      {
        "instagram": instagram,
        "telegram": telegram,
        "whatsApp": whatsApp,
        "linkedIn": linkedIn,
        "dribble": dribble,
        "soundCloud": soundCloud,
        "pinterest": pinterest,
        "website": website,
        "phoneNumber1": phoneNumber1,
        "phoneNumber2": phoneNumber2,
        "email1": email1,
        "email2": email2,
        "address1": address1,
        "address2": address2,
        "address3": address3,
      };
}
