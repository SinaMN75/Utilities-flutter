import 'dart:convert';

class UResponse<T> {
  UResponse({
    required this.result,
    required this.status,
    required this.message,
    this.pageSize = 0,
    this.pageCount = 0,
    this.totalCount = 0,
  });

  factory UResponse.fromJson(final String str, final T Function(dynamic) fromMapT) => UResponse<T>.fromMap(json.decode(str), fromMapT);

  factory UResponse.fromMap(final Map<String, dynamic> json, final T Function(dynamic) fromMapT) {
    final dynamic rawResult = json["result"];

    T? parsedResult;
    if (rawResult == null) {
      parsedResult = null;
    } else if (rawResult is List) {
      parsedResult = rawResult.map((final e) => fromMapT(e)).toList() as T;
    } else {
      parsedResult = fromMapT(rawResult);
    }

    return UResponse<T>(
      result: parsedResult,
      status: json["status"],
      pageSize: json["pageSize"] ?? 0,
      pageCount: json["pageCount"] ?? 0,
      totalCount: json["totalCount"] ?? 0,
      message: json["message"] ?? '',
    );
  }

  final T? result;
  final int status;
  final int pageSize;
  final int pageCount;
  final int totalCount;
  final String message;

  String toJson(final Object Function(T value) toMapT) => json.encode(toMap(toMapT));

  Map<String, dynamic> toMap(final Object Function(T value) toMapT) => {
        "result": result == null
            ? null
            : result is List
                ? (result as List).map((final e) => toMapT(e)).toList()
                : toMapT(result as T),
        "status": status,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "totalCount": totalCount,
        "message": message,
      };
}
