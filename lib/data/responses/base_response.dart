class BaseResponse<T> {
  // Can be null, object, or list

  BaseResponse({
    required this.status,
    required this.pageSize,
    required this.pageCount,
    required this.totalCount,
    required this.message,
    this.result,
  });

  factory BaseResponse.fromJson(
    final Map<String, dynamic> json,
    final T Function(dynamic) fromJsonT, // Handles parsing of result
  ) {
    return BaseResponse<T>(
      status: json['status'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      pageCount: json['pageCount'] ?? 0,
      totalCount: json['totalCount'] ?? 0,
      message: json['message'] ?? '',
      result: _parseResult(json['result'], fromJsonT),
    );
  }

  final int status;
  final int pageSize;
  final int pageCount;
  final int totalCount;
  final String message;
  final T? result;

  static T? _parseResult<T>(final dynamic resultJson, final T Function(dynamic) fromJsonT) {
    if (resultJson == null) return null;

    // Handle list case
    if (resultJson is List) {
      return resultJson.map((final item) => fromJsonT(item)).toList() as T;
    }
    // Handle object case
    return fromJsonT(resultJson);
  }

  Map<String, dynamic> toJson(final dynamic Function(T) toJsonT) {
    return {
      'status': status,
      'pageSize': pageSize,
      'pageCount': pageCount,
      'totalCount': totalCount,
      'message': message,
      'result': _serializeResult(result, toJsonT),
    };
  }

  static dynamic _serializeResult<T>(final T? result, final dynamic Function(T) toJsonT) {
    if (result == null) return null;

    // Handle list case
    if (result is List) {
      return result.map((final item) => toJsonT(item)).toList();
    }
    // Handle object case
    return toJsonT(result);
  }

  bool get hasResult => result != null;

  bool get isResultList => result is List;

  bool get isResultObject => hasResult && !isResultList;

  @override
  String toString() {
    return 'BaseResponse(status: $status, message: $message, result: $result)';
  }
}
