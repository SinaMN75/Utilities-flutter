part of "../data.dart";

class UAgreementGenerateResponse {
  final String? id;
  final DateTime? createdAt;
  final UBaseJson? jsonData;
  final List<int>? tags;
  final UUserResponse? creator;
  final String? creatorId;
  final String? agreement;
  final UTerminalResponse? terminal;
  final String? terminalId;

  UAgreementGenerateResponse({
    this.id,
    this.createdAt,
    this.jsonData,
    this.tags,
    this.creator,
    this.creatorId,
    this.agreement,
    this.terminal,
    this.terminalId,
  });

  factory UAgreementGenerateResponse.fromJson(String str) => UAgreementGenerateResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UAgreementGenerateResponse.fromMap(Map<String, dynamic> json) => UAgreementGenerateResponse(
    id: json["id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    jsonData: json["jsonData"] == null ? null : UBaseJson.fromMap(json["jsonData"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    creatorId: json["creatorId"],
    agreement: json["agreement"],
    terminal: json["terminal"] == null ? null : UTerminalResponse.fromMap(json["terminal"]),
    terminalId: json["terminalId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt?.toIso8601String(),
    "jsonData": jsonData?.toMap(),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "creator": creator?.toMap(),
    "creatorId": creatorId,
    "agreement": agreement,
    "terminal": terminal?.toMap(),
    "terminalId": terminalId,
  };
}
