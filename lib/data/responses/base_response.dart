class BaseResponse<T> {
  BaseResponse({
    this.result,
    this.resultList,
    this.status = 200,
    this.message = "",
    this.pageSize,
    this.pageCount,
    this.totalCount,
  });

  factory BaseResponse.fromJson(final dynamic json, {final Function? fromMap}) {
    if (fromMap == null) return BaseResponse<T>(status: json["status"], message: json["message"] ?? '');
    if (json["result"] is List) {
      return BaseResponse<T>(
        resultList: List<T>.from(json['result'].cast<Map<String, dynamic>>().map(fromMap)),
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        totalCount: json["totalCount"],
        status: json["status"],
        message: json["message"] ?? '',
      );
    }
    if (json["result"] is String) {
      return BaseResponse<T>(
        result: json["result"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        totalCount: json["totalCount"],
        status: json["status"],
        message: json["message"] ?? '',
      );
    }
    return BaseResponse<T>(
      result: json["result"] != null ? fromMap(json["result"]) : '',
      pageSize: json["pageSize"],
      pageCount: json["pageCount"],
      totalCount: json["totalCount"],
      status: json["status"],
      message: json["message"] ?? '',
    );
  }

  final int status;
  final String message;
  final T? result;
  final List<T>? resultList;
  final int? pageSize;
  final int? pageCount;
  final int? totalCount;
}
