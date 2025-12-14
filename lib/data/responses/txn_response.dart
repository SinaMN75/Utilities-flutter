part of "../data.dart";

class UTxnResponse {
  UTxnResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.amount,
    required this.invoiceId,
    this.invoice,
  });

  factory UTxnResponse.fromMap(Map<String, dynamic> json) => UTxnResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    jsonData: UTxnJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]),
    amount: json["amount"].toString().toDouble(),
    invoiceId: json["invoiceId"],
    invoice: json["invoice"] == null ? null : UInvoiceResponse.fromMap(json["invoice"]),
  );

  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UTxnJson jsonData;
  final List<int> tags;
  final double amount;
  final String invoiceId;
  final UInvoiceResponse? invoice;

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": tags,
    "amount": amount,
    "invoiceId": invoiceId,
    "invoice": invoice?.toMap(),
  };
}

class UTxnJson {
  UTxnJson({
    required this.status,
    this.referenceId,
    this.gateway,
    this.description,
  });

  factory UTxnJson.fromMap(Map<String, dynamic> json) => UTxnJson(
    status: json["status"],
    referenceId: json["referenceId"],
    gateway: json["gateway"],
    description: json["description"],
  );

  final String status;
  final String? referenceId;
  final String? gateway;
  final String? description;

  Map<String, dynamic> toMap() => <String, dynamic>{
    "status": status,
    "referenceId": referenceId,
    "gateway": gateway,
    "description": description,
  };
}
