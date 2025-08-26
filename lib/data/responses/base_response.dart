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
      message: jsonMap["message"] ?? "",
    );
  }

  final T? result;
  final int status;
  final int pageSize;
  final int pageCount;
  final int totalCount;
  final String message;
}

class UVisitCount {
  UVisitCount({
    required this.userId,
    required this.count,
  });

  factory UVisitCount.fromJson(String str) => UVisitCount.fromMap(json.decode(str));

  factory UVisitCount.fromMap(Map<String, dynamic> json) => UVisitCount(
    userId: json["userId"],
    count: json["count"],
  );

  final String userId;
  final int count;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "userId": userId,
    "count": count,
  };
}

class UPointCount {
  UPointCount({
    required this.userId,
    required this.point,
  });

  factory UPointCount.fromJson(String str) => UPointCount.fromMap(json.decode(str));

  factory UPointCount.fromMap(Map<String, dynamic> json) =>
      UPointCount(
        userId: json["userId"],
        point: json["point"],
      );

  final String userId;
  final int point;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() =>
      <String, dynamic>{
        "userId": userId,
        "point": point,
      };
}
