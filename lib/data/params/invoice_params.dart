part of "../data.dart";

class UInvoiceCreateParams {
  final List<int>? tags;
  final String? id;
  final double? debtAmount;
  final double? creditorAmount;
  final double? paidAmount;
  final double? penaltyAmount;
  final String? userId;
  final String? contractId;
  final DateTime? paidDate;
  final DateTime? dueDate;
  final String? description;

  UInvoiceCreateParams({
    this.tags,
    this.id,
    this.debtAmount,
    this.creditorAmount,
    this.paidAmount,
    this.penaltyAmount,
    this.userId,
    this.contractId,
    this.paidDate,
    this.dueDate,
    this.description,
  });

  factory UInvoiceCreateParams.fromJson(String str) => UInvoiceCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UInvoiceCreateParams.fromMap(Map<String, dynamic> json) => UInvoiceCreateParams(
        tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
        id: json["id"],
        debtAmount: json["debtAmount"].toString().toDouble(),
        creditorAmount: json["creditorAmount"].toString().toDouble(),
        paidAmount: json["paidAmount"].toString().toDouble(),
        penaltyAmount: json["penaltyAmount"].toString().toDouble(),
        userId: json["userId"],
        contractId: json["contractId"],
        paidDate: json["paidDate"] == null ? null : DateTime.parse(json["paidDate"]),
        dueDate: json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
        description: json["description"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
        "id": id,
        "debtAmount": debtAmount,
        "creditorAmount": creditorAmount,
        "paidAmount": paidAmount,
        "penaltyAmount": penaltyAmount,
        "userId": userId,
        "contractId": contractId,
        "paidDate": paidDate?.toIso8601String(),
        "dueDate": dueDate?.toIso8601String(),
        "description": description,
      };
}

class UInvoiceReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final bool? orderByUpdatedAt;
  final bool? orderByUpdatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? userId;

  UInvoiceReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.orderByUpdatedAt,
    this.orderByUpdatedAtDesc,
    this.tags,
    this.ids,
    this.userId,
  });

  factory UInvoiceReadParams.fromJson(String str) => UInvoiceReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UInvoiceReadParams.fromMap(Map<String, dynamic> json) => UInvoiceReadParams(
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
        toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
        orderByCreatedAt: json["orderByCreatedAt"],
        orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
        orderByUpdatedAt: json["orderByUpdatedAt"],
        orderByUpdatedAtDesc: json["orderByUpdatedAtDesc"],
        tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
        ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "fromCreatedAt": fromCreatedAt?.toIso8601String(),
        "toCreatedAt": toCreatedAt?.toIso8601String(),
        "orderByCreatedAt": orderByCreatedAt,
        "orderByCreatedAtDesc": orderByCreatedAtDesc,
        "orderByUpdatedAt": orderByUpdatedAt,
        "orderByUpdatedAtDesc": orderByUpdatedAtDesc,
        "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
        "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
        "userId": userId,
      };
}

class UInvoiceUpdateParams {
  final String? id;
  final List<int>? addTags;
  final List<int>? removeTags;
  final List<int>? tags;
  final double? debtAmount;
  final double? creditorAmount;
  final double? paidAmount;
  final double? penaltyAmount;

  UInvoiceUpdateParams({
    this.id,
    this.addTags,
    this.removeTags,
    this.tags,
    this.debtAmount,
    this.creditorAmount,
    this.paidAmount,
    this.penaltyAmount,
  });

  factory UInvoiceUpdateParams.fromJson(String str) => UInvoiceUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UInvoiceUpdateParams.fromMap(Map<String, dynamic> json) => UInvoiceUpdateParams(
        id: json["id"],
        addTags: json["addTags"] == null ? <int>[] : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
        removeTags: json["removeTags"] == null ? <int>[] : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
        tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
        debtAmount: json["debtAmount"].toString().toDouble(),
        creditorAmount: json["creditorAmount"].toString().toDouble(),
        paidAmount: json["paidAmount"].toString().toDouble(),
        penaltyAmount: json["penaltyAmount"].toString().toDouble(),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "addTags": addTags == null ? <dynamic>[] : List<dynamic>.from(addTags!.map((int x) => x)),
        "removeTags": removeTags == null ? <dynamic>[] : List<dynamic>.from(removeTags!.map((int x) => x)),
        "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
        "debtAmount": debtAmount,
        "creditorAmount": creditorAmount,
        "paidAmount": paidAmount,
        "penaltyAmount": penaltyAmount,
      };
}
