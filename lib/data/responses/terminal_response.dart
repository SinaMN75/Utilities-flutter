part of "../data.dart";

class UTerminalResponse {
  final List<int> tags;
  final String? id;
  final String? simCardNumber;
  final String? simCardSerial;
  final String? imei;
  final String serial;
  final UGeneralJson jsonData;
  final DateTime createdAt;
  final DateTime updatedAt;

  UTerminalResponse({
    required this.tags,
    required this.jsonData,
    required this.serial,
    required this.createdAt,
    required this.updatedAt,
    this.id,
    this.simCardNumber,
    this.simCardSerial,
    this.imei,
  });

  factory UTerminalResponse.fromJson(String str) => UTerminalResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UTerminalResponse.fromMap(Map<String, dynamic> json) => UTerminalResponse(
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    serial: json["serial"],
    jsonData: UGeneralJson.fromMap(json["jsonData"]),
    simCardNumber: json["simCardNumber"],
    simCardSerial: json["simCardSerial"],
    imei: json["imei"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "serial": serial,
    "simCardNumber": simCardNumber,
    "simCardSerial": simCardSerial,
    "imei": imei,
    "jsonData": jsonData.toMap(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
