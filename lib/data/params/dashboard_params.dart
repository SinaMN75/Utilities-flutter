part of "../data.dart";

// Matches backend enum SinaMN75U.Data.Params.TagApiLogOrderBy - System.Text.Json serializes
// enums as their integer index by default (no JsonStringEnumConverter registered), so the
// declaration order here must stay in sync with the backend enum order.
enum UApiLogOrderBy { timestampDesc, timestampAsc, durationDesc, durationAsc }

// Search/paginate params for POST dashboard/Logs/Search.
class UApiLogSearchParams {
  UApiLogSearchParams({
    this.pageSize = 50,
    this.pageNumber = 1,
    this.fromDate,
    this.toDate,
    this.method,
    this.pathContains,
    this.statusCode,
    this.onlyErrors,
    this.userId,
    this.search,
    this.queryContains,
    this.userAgentContains,
    this.userContains,
    this.traceId,
    this.ipContains,
    this.headerContains,
    this.minDurationMs,
    this.maxDurationMs,
    this.hasException,
    this.orderBy = UApiLogOrderBy.timestampDesc,
  });

  final int pageSize;
  final int pageNumber;
  final DateTime? fromDate;
  final DateTime? toDate;
  final String? method;
  final String? pathContains;
  final int? statusCode;
  final bool? onlyErrors;
  final String? userId;
  final String? search;
  final String? queryContains;
  final String? userAgentContains;
  final String? userContains;
  final String? traceId;
  final String? ipContains;
  final String? headerContains;
  final int? minDurationMs;
  final int? maxDurationMs;
  final bool? hasException;
  final UApiLogOrderBy orderBy;

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromDate": fromDate?.toIso8601String(),
    "toDate": toDate?.toIso8601String(),
    "method": method,
    "pathContains": pathContains,
    "statusCode": statusCode,
    "onlyErrors": onlyErrors,
    "userId": userId,
    "search": search,
    "queryContains": queryContains,
    "userAgentContains": userAgentContains,
    "userContains": userContains,
    "traceId": traceId,
    "ipContains": ipContains,
    "headerContains": headerContains,
    "minDurationMs": minDurationMs,
    "maxDurationMs": maxDurationMs,
    "hasException": hasException,
    "orderBy": orderBy.index,
  };
}

// Aggregate params for POST dashboard/Logs/Stats.
class UApiLogStatsParams {
  UApiLogStatsParams({
    this.fromDate,
    this.toDate,
    this.bucket = "hour",
    this.topEndpointsCount = 5,
  });

  final DateTime? fromDate;
  final DateTime? toDate;
  final String bucket;
  final int topEndpointsCount;

  Map<String, dynamic> toMap() => <String, dynamic>{
    "fromDate": fromDate?.toIso8601String(),
    "toDate": toDate?.toIso8601String(),
    "bucket": bucket,
    "topEndpointsCount": topEndpointsCount,
  };
}
