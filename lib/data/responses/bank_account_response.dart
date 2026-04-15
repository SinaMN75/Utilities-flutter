part of "../data.dart";

class UBankAccountResponse {
  final String? cardNumber;
  final List<int> tags;
  final String? id;
  final String? accountNumber;
  final String? iBanNumber;
  final String? bankName;
  final String? ownerName;
  final UGeneralJson jsonData;

  UBankAccountResponse({
    required this.tags,
    required this.jsonData,
    this.cardNumber,
    this.id,
    this.accountNumber,
    this.bankName,
    this.ownerName,
    this.iBanNumber,
  });

  factory UBankAccountResponse.fromJson(String str) => UBankAccountResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UBankAccountResponse.fromMap(Map<String, dynamic> json) => UBankAccountResponse(
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    id: json["id"],
    cardNumber: json["cardNumber"],
    accountNumber: json["accountNumber"],
    iBanNumber: json["iBanNumber"],
    bankName: json["bankName"],
    ownerName: json["ownerName"],
    jsonData: UGeneralJson.fromMap(json["jsonData"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "id": id,
    "cardNumber": cardNumber,
    "accountNumber": accountNumber,
    "iBanNumber": iBanNumber,
    "bankName": bankName,
    "ownerName": ownerName,
    "jsonData": jsonData.toMap(),
  };
}
