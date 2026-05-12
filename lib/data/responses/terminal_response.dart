part of "../data.dart";

class UTerminalResponse {
  final String serial;
  final List<int> tags;
  final String id;
  final String? simCardNumber;
  final String? simCardSerial;
  final String? imei;
  final String? terminalId;
  final UBaseJson jsonData;
  final DateTime createdAt;

  UTerminalResponse({
    required this.tags,
    required this.jsonData,
    required this.serial,
    required this.createdAt,
    required this.id,
    this.terminalId,
    this.simCardNumber,
    this.simCardSerial,
    this.imei,
  });

  factory UTerminalResponse.fromJson(String str) => UTerminalResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UTerminalResponse.fromMap(Map<String, dynamic> json) => UTerminalResponse(
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    terminalId: json["terminalId"],
    serial: json["serial"],
    jsonData: UBaseJson.fromMap(json["jsonData"]),
    simCardNumber: json["simCardNumber"],
    simCardSerial: json["simCardSerial"],
    imei: json["imei"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "terminalId": terminalId,
    "serial": serial,
    "simCardNumber": simCardNumber,
    "simCardSerial": simCardSerial,
    "imei": imei,
    "jsonData": jsonData.toMap(),
    "createdAt": createdAt.toIso8601String(),
  };
}
