part of "../data.dart";

class UApiLogReadParams {
  UApiLogReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.tags,
    this.ids,
    this.orderBy,
    this.pathContains,
    this.statusCode,
    this.minDurationMs,
    this.maxDurationMs,
    this.userId,
    this.ipAddress,
    this.traceId,
    this.onlyErrors,
  });

  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final List<int>? tags;
  final List<String>? ids;
  final int? orderBy;
  final String? pathContains;
  final int? statusCode;
  final int? minDurationMs;
  final int? maxDurationMs;
  final String? userId;
  final String? ipAddress;
  final String? traceId;
  final bool? onlyErrors;

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "orderBy": orderBy,
    "pathContains": pathContains,
    "statusCode": statusCode,
    "minDurationMs": minDurationMs,
    "maxDurationMs": maxDurationMs,
    "userId": userId,
    "ipAddress": ipAddress,
    "traceId": traceId,
    "onlyErrors": onlyErrors,
  };
}

class UApiLogStatsParams {
  UApiLogStatsParams({
    this.fromCreatedAt,
    this.toCreatedAt,
    this.bucket = "hour",
  });

  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final String bucket;

  Map<String, dynamic> toMap() => <String, dynamic>{
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "bucket": bucket,
  };
}
