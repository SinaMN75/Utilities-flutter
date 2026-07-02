part of "../data.dart";

class UApiLogResponse {
  UApiLogResponse({
    required this.id,
    required this.createdAt,
    required this.jsonData,
    required this.tags,
    required this.creatorId,
    required this.path,
    required this.statusCode,
    required this.durationMs,
    this.creator,
    this.userId,
    this.ipAddress,
    this.traceId,
  });

  factory UApiLogResponse.fromMap(Map<String, dynamic> json) => UApiLogResponse(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    jsonData: UApiLogJson.fromMap(json["jsonData"]),
    tags: List<int>.from(json["tags"]),
    creatorId: json["creatorId"],
    creator: json["creator"] == null ? null : UUserResponse.fromMap(json["creator"]),
    path: json["path"] ?? "",
    statusCode: json["statusCode"] ?? 0,
    durationMs: json["durationMs"] is int ? json["durationMs"] : int.tryParse(json["durationMs"].toString()) ?? 0,
    userId: json["userId"],
    ipAddress: json["ipAddress"],
    traceId: json["traceId"],
  );

  final String id;
  final DateTime createdAt;
  final UApiLogJson jsonData;
  final List<int> tags;
  final String creatorId;
  final UUserResponse? creator;
  final String path;
  final int statusCode;
  final int durationMs;
  final String? userId;
  final String? ipAddress;
  final String? traceId;
}

class UApiLogJson {
  UApiLogJson({
    required this.method,
    this.queryString,
    this.requestBody,
    this.responseBody,
    this.requestHeaders,
    this.responseHeaders,
    this.userAgent,
    this.host,
    this.userName,
    this.userEmail,
    this.userRoles,
    this.exceptionType,
    this.exceptionMessage,
    this.stackTrace,
    this.requestSizeBytes = 0,
    this.responseSizeBytes = 0,
  });

  factory UApiLogJson.fromMap(Map<String, dynamic> json) => UApiLogJson(
    method: json["method"] ?? "",
    queryString: json["queryString"],
    requestBody: json["requestBody"],
    responseBody: json["responseBody"],
    requestHeaders: json["requestHeaders"],
    responseHeaders: json["responseHeaders"],
    userAgent: json["userAgent"],
    host: json["host"],
    userName: json["userName"],
    userEmail: json["userEmail"],
    userRoles: json["userRoles"],
    exceptionType: json["exceptionType"],
    exceptionMessage: json["exceptionMessage"],
    stackTrace: json["stackTrace"],
    requestSizeBytes: json["requestSizeBytes"] ?? 0,
    responseSizeBytes: json["responseSizeBytes"] ?? 0,
  );

  final String method;
  final String? queryString;
  final String? requestBody;
  final String? responseBody;
  final String? requestHeaders;
  final String? responseHeaders;
  final String? userAgent;
  final String? host;
  final String? userName;
  final String? userEmail;
  final String? userRoles;
  final String? exceptionType;
  final String? exceptionMessage;
  final String? stackTrace;
  final int requestSizeBytes;
  final int responseSizeBytes;
}

class UApiLogBucketResponse {
  UApiLogBucketResponse({
    required this.time,
    required this.count,
    required this.errorCount,
    required this.averageDurationMs,
  });

  factory UApiLogBucketResponse.fromMap(Map<String, dynamic> json) => UApiLogBucketResponse(
    time: DateTime.parse(json["time"]),
    count: json["count"] ?? 0,
    errorCount: json["errorCount"] ?? 0,
    averageDurationMs: (json["averageDurationMs"] as num?)?.toDouble() ?? 0,
  );

  final DateTime time;
  final int count;
  final int errorCount;
  final double averageDurationMs;
}

class UApiLogEndpointResponse {
  UApiLogEndpointResponse({
    required this.path,
    required this.count,
    required this.averageDurationMs,
  });

  factory UApiLogEndpointResponse.fromMap(Map<String, dynamic> json) => UApiLogEndpointResponse(
    path: json["path"] ?? "",
    count: json["count"] ?? 0,
    averageDurationMs: (json["averageDurationMs"] as num?)?.toDouble() ?? 0,
  );

  final String path;
  final int count;
  final double averageDurationMs;
}

class UApiLogStatsResponse {
  UApiLogStatsResponse({
    required this.totalCount,
    required this.successCount,
    required this.errorCount,
    required this.averageDurationMs,
    required this.p50DurationMs,
    required this.p95DurationMs,
    required this.p99DurationMs,
    required this.timeline,
    required this.slowestEndpoints,
    required this.failingEndpoints,
    required this.slowestRequests,
  });

  factory UApiLogStatsResponse.fromMap(Map<String, dynamic> json) => UApiLogStatsResponse(
    totalCount: json["totalCount"] ?? 0,
    successCount: json["successCount"] ?? 0,
    errorCount: json["errorCount"] ?? 0,
    averageDurationMs: (json["averageDurationMs"] as num?)?.toDouble() ?? 0,
    p50DurationMs: (json["p50DurationMs"] as num?)?.toDouble() ?? 0,
    p95DurationMs: (json["p95DurationMs"] as num?)?.toDouble() ?? 0,
    p99DurationMs: (json["p99DurationMs"] as num?)?.toDouble() ?? 0,
    timeline: List<UApiLogBucketResponse>.from((json["timeline"] ?? <dynamic>[]).map((dynamic x) => UApiLogBucketResponse.fromMap(x))),
    slowestEndpoints: List<UApiLogEndpointResponse>.from((json["slowestEndpoints"] ?? <dynamic>[]).map((dynamic x) => UApiLogEndpointResponse.fromMap(x))),
    failingEndpoints: List<UApiLogEndpointResponse>.from((json["failingEndpoints"] ?? <dynamic>[]).map((dynamic x) => UApiLogEndpointResponse.fromMap(x))),
    slowestRequests: List<UApiLogResponse>.from((json["slowestRequests"] ?? <dynamic>[]).map((dynamic x) => UApiLogResponse.fromMap(x))),
  );

  final int totalCount;
  final int successCount;
  final int errorCount;
  final double averageDurationMs;
  final double p50DurationMs;
  final double p95DurationMs;
  final double p99DurationMs;
  final List<UApiLogBucketResponse> timeline;
  final List<UApiLogEndpointResponse> slowestEndpoints;
  final List<UApiLogEndpointResponse> failingEndpoints;
  final List<UApiLogResponse> slowestRequests;
}
