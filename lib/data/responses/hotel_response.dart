part of "../data.dart";

class UDormBedResponse {
  final String? id;
  final DateTime? createdAt;
  final UBaseJson? jsonData;
  final List<int>? tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String? title;
  final bool? isAvailable;
  final double? deposit;
  final double? monthlyRent;
  final String? roomId;
  final UDormRoomResponse? room;
  final List<UMediaResponse>? media;

  UDormBedResponse({
    this.id,
    this.createdAt,
    this.jsonData,
    this.tags,
    this.creator,
    this.creatorId,
    this.title,
    this.isAvailable,
    this.deposit,
    this.monthlyRent,
    this.roomId,
    this.room,
    this.media,
  });

  factory UDormBedResponse.fromJson(String str) => UDormBedResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedResponse.fromMap(Map<String, dynamic> json) => UDormBedResponse(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    jsonData: json["jsonData"] == null ? null : UBaseJson.fromMap(json["jsonData"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"],
    isAvailable: json["isAvailable"],
    deposit: json["deposit"]?.toDouble(),
    monthlyRent: json["monthlyRent"]?.toDouble(),
    roomId: json["roomId"],
    room: json["room"] == null ? null : UDormRoomResponse.fromMap(json["room"]),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "jsonData": jsonData?.toMap(),
    "tags": tags == null ? <int>[] : List<int>.from(tags!.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "title": title,
    "isAvailable": isAvailable,
    "deposit": deposit,
    "monthlyRent": monthlyRent,
    "roomId": roomId,
    "room": room?.toMap(),
    "media": media == null ? <UMediaResponse>[] : List<UMediaResponse>.from(media!.map((UMediaResponse x) => x.toMap())),
  };
}

class UDormResponse {
  final String? id;
  final DateTime? createdAt;
  final UBaseJson? jsonData;
  final List<int>? tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String? title;
  final String? city;
  final String? country;
  final List<UDormRoomResponse>? rooms;
  final List<UMediaResponse>? media;

  UDormResponse({
    this.id,
    this.createdAt,
    this.jsonData,
    this.tags,
    this.creator,
    this.creatorId,
    this.title,
    this.city,
    this.country,
    this.rooms,
    this.media,
  });

  factory UDormResponse.fromJson(String str) => UDormResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormResponse.fromMap(Map<String, dynamic> json) => UDormResponse(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    jsonData: json["jsonData"] == null ? null : UBaseJson.fromMap(json["jsonData"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"],
    city: json["city"],
    country: json["country"],
    rooms: json["rooms"] == null ? <UDormRoomResponse>[] : List<UDormRoomResponse>.from(json["rooms"]!.map((dynamic x) => UDormRoomResponse.fromMap(x))),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "jsonData": jsonData?.toMap(),
    "tags": tags == null ? <int>[] : List<int>.from(tags!.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "title": title,
    "city": city,
    "country": country,
    "rooms": rooms == null ? <UDormRoomResponse>[] : List<UDormRoomResponse>.from(rooms!.map((UDormRoomResponse x) => x.toMap())),
    "media": media == null ? <UMediaResponse>[] : List<UMediaResponse>.from(media!.map((UMediaResponse x) => x.toMap())),
  };
}

class UHotelResponse {
  final String? id;
  final DateTime? createdAt;
  final UBaseJson? jsonData;
  final List<int>? tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String? title;
  final String? city;
  final String? country;
  final List<UHotelRoomResponse>? rooms;
  final List<UMediaResponse>? media;

  UHotelResponse({
    this.id,
    this.createdAt,
    this.jsonData,
    this.tags,
    this.creator,
    this.creatorId,
    this.title,
    this.city,
    this.country,
    this.rooms,
    this.media,
  });

  factory UHotelResponse.fromJson(String str) => UHotelResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UHotelResponse.fromMap(Map<String, dynamic> json) => UHotelResponse(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    jsonData: json["jsonData"] == null ? null : UBaseJson.fromMap(json["jsonData"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"],
    city: json["city"],
    country: json["country"],
    rooms: json["rooms"] == null ? <UHotelRoomResponse>[] : List<UHotelRoomResponse>.from(json["rooms"]!.map((dynamic x) => UHotelRoomResponse.fromMap(x))),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "jsonData": jsonData?.toMap(),
    "tags": tags == null ? <int>[] : List<int>.from(tags!.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "title": title,
    "city": city,
    "country": country,
    "rooms": rooms == null ? <UHotelRoomResponse>[] : List<UHotelRoomResponse>.from(rooms!.map((UHotelRoomResponse x) => x.toMap())),
    "media": media == null ? <UMediaResponse>[] : List<UMediaResponse>.from(media!.map((UMediaResponse x) => x.toMap())),
  };
}

class UHotelRoomResponse {
  final String? id;
  final DateTime? createdAt;
  final UBaseJson? jsonData;
  final List<int>? tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String? title;
  final int? capacity;
  final double? pricePerNight;
  final bool? isAvailable;
  final String? hotelId;
  final UHotelResponse? hotel;
  final List<UMediaResponse>? media;

  UHotelRoomResponse({
    this.id,
    this.createdAt,
    this.jsonData,
    this.tags,
    this.creator,
    this.creatorId,
    this.title,
    this.capacity,
    this.pricePerNight,
    this.isAvailable,
    this.hotelId,
    this.hotel,
    this.media,
  });

  factory UHotelRoomResponse.fromJson(String str) => UHotelRoomResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UHotelRoomResponse.fromMap(Map<String, dynamic> json) => UHotelRoomResponse(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    jsonData: json["jsonData"] == null ? null : UBaseJson.fromMap(json["jsonData"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"],
    capacity: json["capacity"],
    pricePerNight: json["pricePerNight"]?.toDouble(),
    isAvailable: json["isAvailable"],
    hotelId: json["hotelId"],
    hotel: json["hotel"] == null ? null : UHotelResponse.fromMap(json["hotel"]),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "jsonData": jsonData?.toMap(),
    "tags": tags == null ? <int>[] : List<int>.from(tags!.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "title": title,
    "capacity": capacity,
    "pricePerNight": pricePerNight,
    "isAvailable": isAvailable,
    "hotelId": hotelId,
    "hotel": hotel?.toMap(),
    "media": media == null ? <UMediaResponse>[] : List<UMediaResponse>.from(media!.map((UMediaResponse x) => x.toMap())),
  };
}

class UDormRoomResponse {
  final String? id;
  final DateTime? createdAt;
  final UBaseJson? jsonData;
  final List<int>? tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String? title;
  final String? dormId;
  final UDormResponse? dorm;
  final List<UDormBedResponse>? beds;
  final List<UMediaResponse>? media;

  UDormRoomResponse({
    this.id,
    this.createdAt,
    this.jsonData,
    this.tags,
    this.creator,
    this.creatorId,
    this.title,
    this.dormId,
    this.dorm,
    this.beds,
    this.media,
  });

  factory UDormRoomResponse.fromJson(String str) => UDormRoomResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormRoomResponse.fromMap(Map<String, dynamic> json) => UDormRoomResponse(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    jsonData: json["jsonData"] == null ? null : UBaseJson.fromMap(json["jsonData"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"],
    dormId: json["dormId"],
    dorm: json["dorm"] == null ? null : UDormResponse.fromMap(json["dorm"]),
    beds: json["beds"] == null ? <UDormBedResponse>[] : List<UDormBedResponse>.from(json["beds"]!.map((dynamic x) => UDormBedResponse.fromMap(x))),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "jsonData": jsonData?.toMap(),
    "tags": tags == null ? <int>[] : List<int>.from(tags!.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "title": title,
    "dormId": dormId,
    "dorm": dorm?.toMap(),
    "beds": beds == null ? <UDormBedResponse>[] : List<UDormBedResponse>.from(beds!.map((UDormBedResponse x) => x.toMap())),
    "media": media == null ? <UMediaResponse>[] : List<UMediaResponse>.from(media!.map((UMediaResponse x) => x.toMap())),
  };
}
