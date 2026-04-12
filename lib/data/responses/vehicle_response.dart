part of "../data.dart";

class UVehicleResponse {
  final String licencePlate;
  final List<int> tags;
  final String id;
  final String? brand;
  final String? color;
  final UUserResponse? creator;
  final String? creatorId;
  final UGeneralJson jsonData;

  UVehicleResponse({
    required this.licencePlate,
    required this.tags,
    required this.id,
    required this.jsonData,
    this.brand,
    this.color,
    this.creator,
    this.creatorId,
  });

  factory UVehicleResponse.fromJson(String str) => UVehicleResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UVehicleResponse.fromMap(Map<String, dynamic> json) => UVehicleResponse(
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    jsonData: UGeneralJson.fromMap(json["jsonData"]),
    id: json["id"],
    licencePlate: json["licencePlate"],
    brand: json["brand"],
    color: json["color"],
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "licencePlate": licencePlate,
    "brand": brand,
    "color": color,
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "jsonData": jsonData.toMap(),
  };
}
