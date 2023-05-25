class GenericResponse<T> {
  GenericResponse({
    this.result,
    this.resultList,
    this.status = 200,
    this.message = "",
    this.pageSize,
    this.pageCount,
    this.totalCount,
  });

  factory GenericResponse.fromJson(final Map<String, dynamic> json, {final Function? fromMap}) {
    if (fromMap == null) return GenericResponse<T>(status: json["status"], message: json["message"]);
    if (json["result"] is List)
      return GenericResponse<T>(
        resultList: List<T>.from(json['result'].cast<Map<String, dynamic>>().map(fromMap)),
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        totalCount: json["totalCount"],
        status: json["status"],
        message: json["message"] ?? '',
      );
    if (json["result"] is String)
      return GenericResponse<T>(
        result: json["result"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        totalCount: json["totalCount"],
        status: json["status"],
        message: json["message"] ?? '',
      );
    return GenericResponse<T>(
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
