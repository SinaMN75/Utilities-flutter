import 'dart:convert';

class UResponse<T> {
  final int status;
  final String message;
  final T? result;

  UResponse({
    required this.status,
    required this.message,
    this.result,
  });

  factory UResponse.fromJson(String str) => UResponse.fromMap(json.decode(str));

  factory UResponse.fromMap(Map<String, dynamic> json) {
    return UResponse<T>(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      result: json['result'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'result': result,
    };
  }

  bool get hasResult => result != null;

  bool get isResultList => result is List;

  bool get isResultObject => hasResult && !isResultList;

  @override
  String toString() {
    return 'BaseResponse(status: $status, message: $message, result: $result)';
  }
}
