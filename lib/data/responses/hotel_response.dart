part of "../data.dart";

class UDormBedResponse {
  final String id;
  final DateTime createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String title;
  final bool isAvailable;
  final double deposit;
  final double monthlyRent;
  final String roomId;
  final UDormRoomResponse? room;
  final List<UMediaResponse>? media;

  UDormBedResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    required this.isAvailable,
    required this.deposit,
    required this.monthlyRent,
    required this.roomId,
    this.creator,
    this.creatorId,
    this.room,
    this.media,
  });

  factory UDormBedResponse.fromJson(String str) => UDormBedResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormBedResponse.fromMap(Map<String, dynamic> json) => UDormBedResponse(
    id: json["id"] as String,
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"] as String,
    isAvailable: json["isAvailable"] as bool,
    deposit: (json["deposit"] as num).toDouble(),
    monthlyRent: (json["monthlyRent"] as num).toDouble(),
    roomId: json["roomId"] as String,
    room: json["room"] == null ? null : UDormRoomResponse.fromMap(json["room"]),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<int>.from(tags.map((int x) => x)),
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
  final String id;
  final DateTime createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String title;
  final String city;
  final String country;
  final List<UDormRoomResponse>? rooms;
  final List<UMediaResponse>? media;

  UDormResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    required this.city,
    required this.country,
    this.creator,
    this.creatorId,
    this.rooms,
    this.media,
  });

  factory UDormResponse.fromJson(String str) => UDormResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormResponse.fromMap(Map<String, dynamic> json) => UDormResponse(
    id: json["id"] as String,
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"] as String,
    city: json["city"] as String,
    country: json["country"] as String,
    rooms: json["rooms"] == null ? <UDormRoomResponse>[] : List<UDormRoomResponse>.from(json["rooms"]!.map((dynamic x) => UDormRoomResponse.fromMap(x))),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<int>.from(tags.map((int x) => x)),
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
  final String id;
  final DateTime createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String title;
  final String city;
  final String country;
  final List<UHotelRoomResponse>? rooms;
  final List<UMediaResponse>? media;

  UHotelResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    required this.city,
    required this.country,
    this.creator,
    this.creatorId,
    this.rooms,
    this.media,
  });

  factory UHotelResponse.fromJson(String str) => UHotelResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UHotelResponse.fromMap(Map<String, dynamic> json) => UHotelResponse(
    id: json["id"] as String,
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"] as String,
    city: json["city"] as String,
    country: json["country"] as String,
    rooms: json["rooms"] == null ? <UHotelRoomResponse>[] : List<UHotelRoomResponse>.from(json["rooms"]!.map((dynamic x) => UHotelRoomResponse.fromMap(x))),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<int>.from(tags.map((int x) => x)),
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
  final String id;
  final DateTime createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String title;
  final int capacity;
  final double pricePerNight;
  final bool isAvailable;
  final String hotelId;
  final UHotelResponse? hotel;
  final List<UMediaResponse>? media;

  UHotelRoomResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    required this.capacity,
    required this.pricePerNight,
    required this.isAvailable,
    required this.hotelId,
    this.creator,
    this.creatorId,
    this.hotel,
    this.media,
  });

  factory UHotelRoomResponse.fromJson(String str) => UHotelRoomResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UHotelRoomResponse.fromMap(Map<String, dynamic> json) => UHotelRoomResponse(
    id: json["id"] as String,
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"] as String,
    capacity: json["capacity"] as int,
    pricePerNight: (json["pricePerNight"] as num).toDouble(),
    isAvailable: json["isAvailable"] as bool,
    hotelId: json["hotelId"] as String,
    hotel: json["hotel"] == null ? null : UHotelResponse.fromMap(json["hotel"]),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<int>.from(tags.map((int x) => x)),
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
  final String id;
  final DateTime createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String title;
  final String dormId;
  final UDormResponse? dorm;
  final List<UDormBedResponse>? beds;
  final List<UMediaResponse>? media;

  UDormRoomResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.title,
    required this.dormId,
    this.creator,
    this.creatorId,
    this.dorm,
    this.beds,
    this.media,
  });

  factory UDormRoomResponse.fromJson(String str) => UDormRoomResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDormRoomResponse.fromMap(Map<String, dynamic> json) => UDormRoomResponse(
    id: json["id"] as String,
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    title: json["title"] as String,
    dormId: json["dormId"] as String,
    dorm: json["dorm"] == null ? null : UDormResponse.fromMap(json["dorm"]),
    beds: json["beds"] == null ? <UDormBedResponse>[] : List<UDormBedResponse>.from(json["beds"]!.map((dynamic x) => UDormBedResponse.fromMap(x))),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<int>.from(tags.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "title": title,
    "dormId": dormId,
    "dorm": dorm?.toMap(),
    "beds": beds == null ? <UDormBedResponse>[] : List<UDormBedResponse>.from(beds!.map((UDormBedResponse x) => x.toMap())),
    "media": media == null ? <UMediaResponse>[] : List<UMediaResponse>.from(media!.map((UMediaResponse x) => x.toMap())),
  };
}
