part of "../data.dart";

// Params for the accounting report. Set userId for a per-user report; leave null for system-wide.
class UAccountingReportParams {
  final String? userId;
  final DateTime? fromDate;
  final DateTime? toDate;

  UAccountingReportParams({
    this.userId,
    this.fromDate,
    this.toDate,
  });

  factory UAccountingReportParams.fromJson(String str) => UAccountingReportParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UAccountingReportParams.fromMap(Map<String, dynamic> json) => UAccountingReportParams(
    userId: json["userId"],
    fromDate: json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
    toDate: json["toDate"] == null ? null : DateTime.parse(json["toDate"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userId": userId,
    "fromDate": fromDate?.toIso8601String(),
    "toDate": toDate?.toIso8601String(),
  };
}
