part of "../data.dart";

class UAgreementGenerateParams {
  final String? detail1;
  final String? detail2;
  final List<int>? tags;
  final String? id;
  final String? creatorId;
  final String? terminalId;

  const UAgreementGenerateParams({
    this.detail1,
    this.detail2,
    this.tags,
    this.id,
    this.creatorId,
    this.terminalId,
  });

  factory UAgreementGenerateParams.fromJson(String str) => UAgreementGenerateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UAgreementGenerateParams.fromMap(Map<String, dynamic> json) => UAgreementGenerateParams(
    detail1: json["detail1"],
    detail2: json["detail2"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    creatorId: json["creatorId"],
    terminalId: json["terminalId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "detail1": detail1,
    "detail2": detail2,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "id": id,
    "creatorId": creatorId,
    "terminalId": terminalId,
  };
}
