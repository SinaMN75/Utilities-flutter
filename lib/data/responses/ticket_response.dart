part of "../data.dart";

class UTicketResponse {
  UTicketResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.creatorId,
    this.creator,
    this.media,
  });

  factory UTicketResponse.fromMap(Map<String, dynamic> json) => UTicketResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    jsonData: UTicketJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]),
    creatorId: json["creatorId"],
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    media: json["media"] == null ? <UMediaResponse>[] : List<UMediaResponse>.from(json["media"].map((dynamic x) => UMediaResponse.fromMap(x))),
  );

  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UTicketJson jsonData;
  final List<int> tags;
  final String creatorId;
  final UUserResponse? creator;
  final List<UMediaResponse>? media;

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": tags,
    "creatorId": creatorId,
    "creator": creator?.toMap(),
    "media": media?.map((UMediaResponse e) => e.toMap()).toList(),
  };
}

class UTicketJson {
  UTicketJson({
    required this.title,
    required this.description,
    this.answer,
  });

  factory UTicketJson.fromMap(Map<String, dynamic> json) => UTicketJson(
    title: json["title"],
    description: json["description"],
    answer: json["answer"],
  );

  final String title;
  final String description;
  final String? answer;

  Map<String, dynamic> toMap() => <String, dynamic>{
    "title": title,
    "description": description,
    "answer": answer,
  };
}
