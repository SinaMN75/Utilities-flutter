part of "../data.dart";

class UResponse<T> {
  UResponse({
    required this.result,
    required this.status,
    required this.message,
    this.pageSize = 0,
    this.pageCount = 0,
    this.totalCount = 0,
  });

  factory UResponse.fromJson(String str, T Function(dynamic) fromMapT) {
    final Map<String, dynamic> jsonMap = json.decode(str);
    final dynamic rawResult = jsonMap["result"];
    T? parsedResult;

    if (rawResult == null) {
      parsedResult = null;
    } else {
      parsedResult = fromMapT(rawResult);
    }

    return UResponse<T>(
      result: parsedResult,
      status: jsonMap["status"],
      pageSize: jsonMap["pageSize"] ?? 0,
      pageCount: jsonMap["pageCount"] ?? 0,
      totalCount: jsonMap["totalCount"] ?? 0,
      message: jsonMap["message"] ?? '',
    );
  }

  final T? result;
  final int status;
  final int pageSize;
  final int pageCount;
  final int totalCount;
  final String message;
}

class VisitCount {

  VisitCount({
    required this.userId,
    this.count = 1,
  });

  factory VisitCount.fromJson(String str) => VisitCount.fromMap(json.decode(str));

  factory VisitCount.fromMap(Map<String, dynamic> json) => VisitCount(
    userId: json["userId"],
    count: json["count"] ?? 1,
  );
  final String userId;
  final int count;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userId": userId,
    "count": count,
  };
}
