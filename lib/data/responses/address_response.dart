part of "../data.dart";

class UAddressResponse {
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final UAddressResponseJsonData? jsonData;
  final List<int>? tags;
  final String? title;
  final String? zipCode;
  final UUserResponse? creator;
  final String? creatorId;

  UAddressResponse({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.jsonData,
    this.tags,
    this.title,
    this.zipCode,
    this.creator,
    this.creatorId,
  });

  factory UAddressResponse.fromJson(String str) => UAddressResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UAddressResponse.fromMap(Map<String, dynamic> json) => UAddressResponse(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
    jsonData: json["jsonData"] == null ? null : UAddressResponseJsonData.fromMap(json["jsonData"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    title: json["title"],
    zipCode: json["zipCode"],
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deletedAt": deletedAt?.toIso8601String(),
    "jsonData": jsonData?.toMap(),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "title": title,
    "zipCode": zipCode,
    "creator": creator?.toMap(),
    "creatorId": creatorId,
  };
}

class UAddressResponseJsonData {
  final String? province;
  final String? township;
  final String? street;
  final String? street2;
  final String? localityName;
  final String? houseNumber;
  final String? floor;
  final String? description;

  UAddressResponseJsonData({
    this.province,
    this.township,
    this.street,
    this.street2,
    this.localityName,
    this.houseNumber,
    this.floor,
    this.description,
  });

  factory UAddressResponseJsonData.fromJson(String str) => UAddressResponseJsonData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UAddressResponseJsonData.fromMap(Map<String, dynamic> json) => UAddressResponseJsonData(
    province: json["province"],
    township: json["township"],
    street: json["street"],
    street2: json["street2"],
    localityName: json["localityName"],
    houseNumber: json["houseNumber"],
    floor: json["floor"],
    description: json["description"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "province": province,
    "township": township,
    "street": street,
    "street2": street2,
    "localityName": localityName,
    "houseNumber": houseNumber,
    "floor": floor,
    "description": description,
  };
}
