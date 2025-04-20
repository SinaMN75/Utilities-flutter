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

  final T? result;
  final int status;
  final int pageSize;
  final int pageCount;
  final int totalCount;
  final String message;

  factory UResponse.fromJson(String str, T Function(dynamic) fromMapT) {
    final Map<String, dynamic> jsonMap = json.decode(str);
    final rawResult = jsonMap["result"];
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
}
