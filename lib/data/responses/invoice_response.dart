part of "../data.dart";

extension InvoiceListExtension on Iterable<UInvoiceResponse> {
  List<UInvoiceResponse> whereByTag(int tag) => where((final UInvoiceResponse i) => i.tags.contains(tag)).toList();
}

extension NullableInvoiceListExtension on Iterable<UInvoiceResponse>? {
  List<UInvoiceResponse> whereByTag(int tag) => (this ?? <UInvoiceResponse>[]).where((final UInvoiceResponse i) => i.tags.contains(tag)).toList();
}

class UInvoiceResponse {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final UInvoiceJsonData jsonData;
  final List<int> tags;
  final double? debtAmount;
  final double? creditorAmount;
  final double? paidAmount;
  final double? penaltyAmount;
  final DateTime? paidDate;
  final DateTime dueDate;
  final DateTime? nextInvoiceIssueDate;
  final String? trackingNumber;
  final UUserResponse? user;
  final String? userId;
  final UContractResponse? contract;
  final String? contractId;

  UInvoiceResponse({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.jsonData,
    required this.tags,
    required this.dueDate,
    this.deletedAt,
    this.debtAmount,
    this.creditorAmount,
    this.paidAmount,
    this.penaltyAmount,
    this.paidDate,
    this.nextInvoiceIssueDate,
    this.trackingNumber,
    this.user,
    this.userId,
    this.contract,
    this.contractId,
  });

  factory UInvoiceResponse.fromJson(String str) => UInvoiceResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UInvoiceResponse.fromMap(Map<String, dynamic> json) => UInvoiceResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"] == null ? null : DateTime.parse(json["deletedAt"]),
    jsonData: UInvoiceJsonData.fromMap(json["jsonData"]),
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    debtAmount: json["debtAmount"].toString().toDouble(),
    creditorAmount: json["creditorAmount"].toString().toDouble(),
    paidAmount: json["paidAmount"].toString().toDouble(),
    penaltyAmount: json["penaltyAmount"].toString().toDouble(),
    paidDate: json["paidDate"] == null ? null : DateTime.parse(json["paidDate"]),
    dueDate: DateTime.parse(json["dueDate"]),
    nextInvoiceIssueDate: json["nextInvoiceIssueDate"] == null ? null : DateTime.parse(json["nextInvoiceIssueDate"]),
    trackingNumber: json["trackingNumber"],
    user: json["user"] == null ? null : UUserResponse.fromMap(json["user"]),
    userId: json["userId"],
    contract: json["contract"] == null ? null : UContractResponse.fromMap(json["contract"]),
    contractId: json["contractId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt?.toIso8601String(),
    "jsonData": jsonData.toMap(),
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "debtAmount": debtAmount,
    "creditorAmount": creditorAmount,
    "paidAmount": paidAmount,
    "penaltyAmount": penaltyAmount,
    "paidDate": paidDate?.toIso8601String(),
    "dueDate": dueDate.toIso8601String(),
    "nextInvoiceIssueDate": nextInvoiceIssueDate?.toIso8601String(),
    "trackingNumber": trackingNumber,
    "user": user?.toMap(),
    "userId": userId,
    "contract": contract?.toMap(),
    "contractId": contractId,
  };
}

class UInvoiceJsonData {
  final String? description;

  UInvoiceJsonData({
    this.description,
  });

  factory UInvoiceJsonData.fromJson(String str) => UInvoiceJsonData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UInvoiceJsonData.fromMap(Map<String, dynamic> json) => UInvoiceJsonData(
    description: json["description"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "description": description,
  };
}
