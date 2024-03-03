part of '../data.dart';

extension ContentReadDtoExtension on List<ContentReadDto> {
  List<ContentReadDto> getByTags({required final List<TagContent> tags}) => where(
        (final ContentReadDto e) => e.tags.containsAll(tags.getNumbers()),
      ).toList();
}

class ContentReadDto {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? title;
  final String? subTitle;
  final String? description;
  final String? deletedAt;
  final List<int> tags;
  final ContentJsonDetail jsonDetail;
  final List<MediaReadDto>? media;

  ContentReadDto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.subTitle,
    this.description,
    this.deletedAt,
    required this.tags,
    required this.jsonDetail,
    this.media,
  });

  factory ContentReadDto.fromJson(String str) => ContentReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentReadDto.fromMap(Map<String, dynamic> json) => ContentReadDto(
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
        deletedAt: json["deletedAt"],
        tags: List<int>.from(json["tags"]!.map((x) => x)),
        jsonDetail: ContentJsonDetail.fromMap(json["jsonDetail"]),
        media: json["media"] == null ? [] : List<MediaReadDto>.from(json["media"]!.map((x) => MediaReadDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "deletedAt": deletedAt,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "jsonDetail": jsonDetail.toMap(),
        "media": media == null ? [] : List<dynamic>.from(media!.map((x) => x.toMap())),
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

  String toJson() => json.encode(toMap());

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

  Map<String, dynamic> toMap() => {
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

class ContentCreateUpdateDto {
  final String? id;
  final String? title;
  final String? subTitle;
  final String? description;
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
  final List<int>? tags;

  ContentCreateUpdateDto({
    this.id,
    this.title,
    this.subTitle,
    this.description,
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
    this.tags,
  });

  factory ContentCreateUpdateDto.fromJson(String str) => ContentCreateUpdateDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentCreateUpdateDto.fromMap(Map<String, dynamic> json) => ContentCreateUpdateDto(
        id: json["id"],
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
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
        tags: json["tags"] == null ? [] : List<int>.from(json["tags"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "subTitle": subTitle,
        "description": description,
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
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
      };
}
