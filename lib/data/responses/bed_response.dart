part of "../data.dart";

class UBedResponse {
  final String id;
  final DateTime createdAt;
  final UBaseJson jsonData;
  final List<int> tags;
  final UUserResponse? creator;
  final String? creatorId;
  final double deposit;
  final double rent;
  final String? parentId;
  final UBedResponse? parent;
  final List<UBedResponse> children;
  final List<UContractResponse> contracts;
  final List<UMediaResponse> media;

  UBedResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.deposit,
    required this.rent,
    this.creator,
    this.creatorId,
    this.parentId,
    this.parent,
    this.children = const <UBedResponse>[],
    this.contracts = const <UContractResponse>[],
    this.media = const <UMediaResponse>[],
  });

  factory UBedResponse.fromJson(String str) => UBedResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UBedResponse.fromMap(Map<String, dynamic> json) => UBedResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    deposit: (json["deposit"] as num).toDouble(),
    rent: (json["rent"] as num).toDouble(),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    parentId: json["parentId"],
    parent: json["parent"] == null ? null : UBedResponse.fromMap(json["parent"]),
    children: json["children"] == null ? <UBedResponse>[] : List<UBedResponse>.from(json["children"]!.map((dynamic x) => UBedResponse.fromMap(x))),
    contracts: json["contracts"] == null ? <UContractResponse>[] : List<UContractResponse>.from(json["contracts"]!.map((dynamic x) => UContractResponse.fromMap(x))),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"]!.map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "deposit": deposit,
    "rent": rent,
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "parentId": parentId,
    "parent": parent?.toMap(),
    "children": List<dynamic>.from(children.map((UBedResponse x) => x.toMap())),
    "contracts": List<dynamic>.from(contracts.map((UContractResponse x) => x.toMap())),
    "media": List<dynamic>.from(media.map((UMediaResponse x) => x.toMap())),
  };
}
