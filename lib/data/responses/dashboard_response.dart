part of "../data.dart";

class UMetricsResponse {
  UMetricsResponse({
    this.cpuUsage = 0,
    this.memoryUsage = 0,
    this.diskUsage = 0,
    this.totalMemory = 0,
    this.freeMemory = 0,
    this.totalDisk = 0,
    this.freeDisk = 0,
    this.date = "",
  });

  factory UMetricsResponse.fromJson(String str) => UMetricsResponse.fromMap(json.decode(str));

  factory UMetricsResponse.fromMap(Map<String, dynamic> json) => UMetricsResponse(
    cpuUsage: json["cpuUsage"].toString().toDouble(),
    memoryUsage: json["memoryUsage"].toString().toDouble(),
    diskUsage: json["diskUsage"].toString().toDouble(),
    totalMemory: json["totalMemory"].toString().toDouble(),
    freeMemory: json["freeMemory"].toString().toDouble(),
    totalDisk: json["totalDisk"].toString().toDouble(),
    freeDisk: json["freeDisk"].toString().toDouble(),
    date: json["date"],
  );
  final double cpuUsage;
  final double memoryUsage;
  final double diskUsage;
  final double totalMemory;
  final double freeMemory;
  final double totalDisk;
  final double freeDisk;
  final String date;
}

class UDashboardResponse {
  // final List<> newComments;
  // final List<> newContents;
  // final List<> newProducts;

  UDashboardResponse({
    required this.categories,
    required this.comments,
    required this.contents,
    required this.exams,
    required this.media,
    required this.products,
    required this.users,
    required this.newUsers,
    required this.newCategories,
    required this.newExams,
    required this.newMedia,
    // required this.newComments,
    // required this.newContents,
    // required this.newProducts,
  });

  factory UDashboardResponse.fromJson(String str) => UDashboardResponse.fromMap(json.decode(str));

  factory UDashboardResponse.fromMap(Map<String, dynamic> json) => UDashboardResponse(
    categories: json["categories"],
    comments: json["comments"],
    contents: json["contents"],
    exams: json["exams"],
    media: json["media"],
    products: json["products"],
    users: json["users"],
    newUsers: List<UUserResponse>.from(json["newUsers"].map((dynamic x) => UUserResponse.fromMap(x))),
    newCategories: List<UCategoryResponse>.from(json["newCategories"].map((dynamic x) => UCategoryResponse.fromMap(x))),
    newExams: List<UExamResponse>.from(json["newExams"].map((dynamic x) => UExamResponse.fromMap(x))),
    newMedia: List<UMediaResponse>.from(json["newMedia"].map((dynamic x) => UMediaResponse.fromMap(x))),
    // newComments: List<NewComment>.from(json["newComments"].map((dynamic x) => NewComment.fromMap(x))),
    // newContents: List<NewContent>.from(json["newContents"].map((dynamic x) => NewContent.fromMap(x))),
    // newProducts: List<NewProduct>.from(json["newProducts"].map((dynamic x) => NewProduct.fromMap(x))),
  );
  final int categories;
  final int comments;
  final int contents;
  final int exams;
  final int media;
  final int products;
  final int users;
  final List<UUserResponse> newUsers;
  final List<UCategoryResponse> newCategories;
  final List<UExamResponse> newExams;
  final List<UMediaResponse> newMedia;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "categories": categories,
    "comments": comments,
    "contents": contents,
    "exams": exams,
    "media": media,
    "products": products,
    "users": users,
    "newUsers": List<dynamic>.from(newUsers.map((UUserResponse x) => x.toMap())),
    "newCategories": List<dynamic>.from(newCategories.map((UCategoryResponse x) => x.toMap())),
    "newExams": List<dynamic>.from(newExams.map((UExamResponse x) => x.toMap())),
    "newMedia": List<dynamic>.from(newMedia.map((UMediaResponse x) => x.toMap())),
    // "newContents": List<dynamic>.from(newContents.map((dynamic x) => x.toMap())),
    // "newComments": List<dynamic>.from(newComments.map((dynamic x) => x.toMap())),
    // "newProducts": List<dynamic>.from(newProducts.map((dynamic x) => x.toMap())),
  };
}

class LogStructureResponse {
  LogStructureResponse({
    required this.logs,
  });

  factory LogStructureResponse.fromJson(String str) => LogStructureResponse.fromMap(json.decode(str));

  factory LogStructureResponse.fromMap(Map<String, dynamic> json) => LogStructureResponse(
    logs: List<YearLog>.from(json["logs"].map((dynamic x) => YearLog.fromMap(x))),
  );
  final List<YearLog> logs;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "logs": List<dynamic>.from(logs.map((YearLog x) => x.toMap())),
  };
}

class YearLog {
  YearLog({
    required this.year,
    required this.months,
  });

  factory YearLog.fromJson(String str) => YearLog.fromMap(json.decode(str));

  factory YearLog.fromMap(Map<String, dynamic> json) => YearLog(
    year: json["year"],
    months: List<MonthLog>.from(json["months"].map((dynamic x) => MonthLog.fromMap(x))),
  );
  final int year;
  final List<MonthLog> months;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "year": year,
    "months": List<dynamic>.from(months.map((MonthLog x) => x.toMap())),
  };
}

class MonthLog {
  MonthLog({
    required this.month,
    required this.days,
  });

  factory MonthLog.fromJson(String str) => MonthLog.fromMap(json.decode(str));

  factory MonthLog.fromMap(Map<String, dynamic> json) => MonthLog(
    month: json["month"],
    days: List<DayLog>.from(json["days"].map((dynamic x) => DayLog.fromMap(x))),
  );
  final int month;
  final List<DayLog> days;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "month": month,
    "days": List<dynamic>.from(days.map((DayLog x) => x.toMap())),
  };
}

class DayLog {
  DayLog({
    required this.day,
    this.success,
    this.failed,
  });

  factory DayLog.fromJson(String str) => DayLog.fromMap(json.decode(str));

  factory DayLog.fromMap(Map<String, dynamic> json) => DayLog(
    day: json["day"],
    success: json["success"],
    failed: json["failed"],
  );
  final int day;
  final String? success;
  final String? failed;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "day": day,
    "success": success,
    "failed": failed,
  };
}

// ── New DB-backed API request log models (ApiLogService: Logs/Search, Logs/Detail, Logs/Stats). ──
// Lightweight row for the searchable/paginated log table.
class UApiLogListItemResponse {
  UApiLogListItemResponse({
    required this.id,
    required this.timestamp,
    required this.method,
    required this.path,
    required this.statusCode,
    required this.isSuccess,
    required this.durationMs,
    this.queryString,
    this.userId,
    this.userName,
    this.ipAddress,
    this.userAgent,
    this.traceId,
    this.host,
    this.requestSizeBytes = 0,
    this.responseSizeBytes = 0,
    this.exceptionType,
  });

  factory UApiLogListItemResponse.fromJson(String str) => UApiLogListItemResponse.fromMap(json.decode(str));

  factory UApiLogListItemResponse.fromMap(Map<String, dynamic> json) => UApiLogListItemResponse(
    id: json["id"],
    timestamp: DateTime.parse(json["timestamp"]),
    method: json["method"] ?? "",
    path: json["path"] ?? "",
    queryString: json["queryString"],
    statusCode: json["statusCode"] ?? 0,
    isSuccess: json["isSuccess"] ?? false,
    durationMs: json["durationMs"] is int ? json["durationMs"] : int.tryParse(json["durationMs"].toString()) ?? 0,
    userId: json["userId"],
    userName: json["userName"],
    ipAddress: json["ipAddress"],
    userAgent: json["userAgent"],
    traceId: json["traceId"],
    host: json["host"],
    requestSizeBytes: json["requestSizeBytes"] ?? 0,
    responseSizeBytes: json["responseSizeBytes"] ?? 0,
    exceptionType: json["exceptionType"],
  );

  final String id;
  final DateTime timestamp;
  final String method;
  final String path;
  final String? queryString;
  final int statusCode;
  final bool isSuccess;
  final int durationMs;
  final String? userId;
  final String? userName;
  final String? ipAddress;
  final String? userAgent;
  final String? traceId;
  final String? host;
  final int requestSizeBytes;
  final int responseSizeBytes;
  final String? exceptionType;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "timestamp": timestamp.toIso8601String(),
    "method": method,
    "path": path,
    "queryString": queryString,
    "statusCode": statusCode,
    "isSuccess": isSuccess,
    "durationMs": durationMs,
    "userId": userId,
    "userName": userName,
    "ipAddress": ipAddress,
    "userAgent": userAgent,
    "traceId": traceId,
    "host": host,
    "requestSizeBytes": requestSizeBytes,
    "responseSizeBytes": responseSizeBytes,
    "exceptionType": exceptionType,
  };
}

// Full record for the "drill into one request" view - adds bodies, headers + exception detail.
class UApiLogDetailResponse {
  UApiLogDetailResponse({
    required this.id,
    required this.timestamp,
    required this.method,
    required this.path,
    required this.statusCode,
    required this.isSuccess,
    required this.durationMs,
    this.queryString,
    this.userId,
    this.userName,
    this.userEmail,
    this.userRoles,
    this.ipAddress,
    this.userAgent,
    this.traceId,
    this.host,
    this.requestSizeBytes = 0,
    this.responseSizeBytes = 0,
    this.requestBody,
    this.responseBody,
    this.requestHeaders,
    this.responseHeaders,
    this.exceptionType,
    this.exceptionMessage,
    this.stackTrace,
  });

  factory UApiLogDetailResponse.fromJson(String str) => UApiLogDetailResponse.fromMap(json.decode(str));

  factory UApiLogDetailResponse.fromMap(Map<String, dynamic> json) => UApiLogDetailResponse(
    id: json["id"],
    timestamp: DateTime.parse(json["timestamp"]),
    method: json["method"] ?? "",
    path: json["path"] ?? "",
    queryString: json["queryString"],
    statusCode: json["statusCode"] ?? 0,
    isSuccess: json["isSuccess"] ?? false,
    durationMs: json["durationMs"] is int ? json["durationMs"] : int.tryParse(json["durationMs"].toString()) ?? 0,
    userId: json["userId"],
    userName: json["userName"],
    userEmail: json["userEmail"],
    userRoles: json["userRoles"],
    ipAddress: json["ipAddress"],
    userAgent: json["userAgent"],
    traceId: json["traceId"],
    host: json["host"],
    requestSizeBytes: json["requestSizeBytes"] ?? 0,
    responseSizeBytes: json["responseSizeBytes"] ?? 0,
    requestBody: json["requestBody"],
    responseBody: json["responseBody"],
    requestHeaders: json["requestHeaders"],
    responseHeaders: json["responseHeaders"],
    exceptionType: json["exceptionType"],
    exceptionMessage: json["exceptionMessage"],
    stackTrace: json["stackTrace"],
  );

  final String id;
  final DateTime timestamp;
  final String method;
  final String path;
  final String? queryString;
  final int statusCode;
  final bool isSuccess;
  final int durationMs;
  final String? userId;
  final String? userName;
  final String? userEmail;
  final String? userRoles;
  final String? ipAddress;
  final String? userAgent;
  final String? traceId;
  final String? host;
  final int requestSizeBytes;
  final int responseSizeBytes;
  final String? requestBody;
  final String? responseBody;
  final String? requestHeaders;
  final String? responseHeaders;
  final String? exceptionType;
  final String? exceptionMessage;
  final String? stackTrace;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "timestamp": timestamp.toIso8601String(),
    "method": method,
    "path": path,
    "queryString": queryString,
    "statusCode": statusCode,
    "isSuccess": isSuccess,
    "durationMs": durationMs,
    "userId": userId,
    "userName": userName,
    "userEmail": userEmail,
    "userRoles": userRoles,
    "ipAddress": ipAddress,
    "userAgent": userAgent,
    "traceId": traceId,
    "host": host,
    "requestSizeBytes": requestSizeBytes,
    "responseSizeBytes": responseSizeBytes,
    "requestBody": requestBody,
    "responseBody": responseBody,
    "requestHeaders": requestHeaders,
    "responseHeaders": responseHeaders,
    "exceptionType": exceptionType,
    "exceptionMessage": exceptionMessage,
    "stackTrace": stackTrace,
  };
}

// Aggregates for the dashboard's charts.
class UApiLogStatsResponse {
  UApiLogStatsResponse({
    required this.totalRequests,
    required this.totalErrors,
    required this.errorRatePercent,
    required this.avgDurationMs,
    required this.maxDurationMs,
    required this.p50DurationMs,
    required this.p95DurationMs,
    required this.p99DurationMs,
    required this.timeSeries,
    required this.statusCodeDistribution,
    required this.topSlowEndpoints,
    required this.topFailingEndpoints,
    required this.slowestRequests,
  });

  factory UApiLogStatsResponse.fromJson(String str) => UApiLogStatsResponse.fromMap(json.decode(str));

  factory UApiLogStatsResponse.fromMap(Map<String, dynamic> json) => UApiLogStatsResponse(
    totalRequests: json["totalRequests"] ?? 0,
    totalErrors: json["totalErrors"] ?? 0,
    errorRatePercent: (json["errorRatePercent"] as num?)?.toDouble() ?? 0,
    avgDurationMs: (json["avgDurationMs"] as num?)?.toDouble() ?? 0,
    maxDurationMs: json["maxDurationMs"] is int ? json["maxDurationMs"] : int.tryParse(json["maxDurationMs"].toString()) ?? 0,
    p50DurationMs: (json["p50DurationMs"] as num?)?.toDouble() ?? 0,
    p95DurationMs: (json["p95DurationMs"] as num?)?.toDouble() ?? 0,
    p99DurationMs: (json["p99DurationMs"] as num?)?.toDouble() ?? 0,
    timeSeries: List<UApiLogTimeBucketResponse>.from((json["timeSeries"] ?? <dynamic>[]).map((dynamic x) => UApiLogTimeBucketResponse.fromMap(x))),
    statusCodeDistribution: List<UApiLogStatusCountResponse>.from((json["statusCodeDistribution"] ?? <dynamic>[]).map((dynamic x) => UApiLogStatusCountResponse.fromMap(x))),
    topSlowEndpoints: List<UApiLogEndpointStatResponse>.from((json["topSlowEndpoints"] ?? <dynamic>[]).map((dynamic x) => UApiLogEndpointStatResponse.fromMap(x))),
    topFailingEndpoints: List<UApiLogEndpointStatResponse>.from((json["topFailingEndpoints"] ?? <dynamic>[]).map((dynamic x) => UApiLogEndpointStatResponse.fromMap(x))),
    slowestRequests: List<UApiLogListItemResponse>.from((json["slowestRequests"] ?? <dynamic>[]).map((dynamic x) => UApiLogListItemResponse.fromMap(x))),
  );

  final int totalRequests;
  final int totalErrors;
  final double errorRatePercent;
  final double avgDurationMs;
  final int maxDurationMs;
  final double p50DurationMs;
  final double p95DurationMs;
  final double p99DurationMs;
  final List<UApiLogTimeBucketResponse> timeSeries;
  final List<UApiLogStatusCountResponse> statusCodeDistribution;
  final List<UApiLogEndpointStatResponse> topSlowEndpoints;
  final List<UApiLogEndpointStatResponse> topFailingEndpoints;
  final List<UApiLogListItemResponse> slowestRequests;
}

class UApiLogTimeBucketResponse {
  UApiLogTimeBucketResponse({
    required this.bucket,
    required this.total,
    required this.errors,
    required this.avgDurationMs,
  });

  factory UApiLogTimeBucketResponse.fromMap(Map<String, dynamic> json) => UApiLogTimeBucketResponse(
    bucket: DateTime.parse(json["bucket"]),
    total: json["total"] ?? 0,
    errors: json["errors"] ?? 0,
    avgDurationMs: (json["avgDurationMs"] as num?)?.toDouble() ?? 0,
  );

  final DateTime bucket;
  final int total;
  final int errors;
  final double avgDurationMs;
}

class UApiLogStatusCountResponse {
  UApiLogStatusCountResponse({required this.statusCode, required this.count});

  factory UApiLogStatusCountResponse.fromMap(Map<String, dynamic> json) => UApiLogStatusCountResponse(
    statusCode: json["statusCode"] ?? 0,
    count: json["count"] ?? 0,
  );

  final int statusCode;
  final int count;
}

class UApiLogEndpointStatResponse {
  UApiLogEndpointStatResponse({
    required this.path,
    required this.count,
    required this.errorCount,
    required this.avgDurationMs,
  });

  factory UApiLogEndpointStatResponse.fromMap(Map<String, dynamic> json) => UApiLogEndpointStatResponse(
    path: json["path"] ?? "",
    count: json["count"] ?? 0,
    errorCount: json["errorCount"] ?? 0,
    avgDurationMs: (json["avgDurationMs"] as num?)?.toDouble() ?? 0,
  );

  final String path;
  final int count;
  final int errorCount;
  final double avgDurationMs;
}
