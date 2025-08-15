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

class LogContentResponse {
  LogContentResponse({
    required this.summary,
    required this.requestBody,
    required this.responseBody,
    this.exception,
  });

  factory LogContentResponse.fromJson(String str) => LogContentResponse.fromMap(json.decode(str));

  factory LogContentResponse.fromMap(Map<String, dynamic> json) => LogContentResponse(
        summary: json["summary"],
        requestBody: json["requestBody"],
        responseBody: json["responseBody"],
        exception: json["exception"] == null ? null : LogException.fromMap(json["exception"]),
      );
  final String summary;
  final String requestBody;
  final String responseBody;
  final LogException? exception;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "summary": summary,
        "requestBody": requestBody,
        "responseBody": responseBody,
        "exception": exception?.toMap(),
      };
}

class LogException {
  LogException({
    required this.type,
    required this.message,
    required this.stackTrace,
  });

  factory LogException.fromJson(String str) => LogException.fromMap(json.decode(str));

  factory LogException.fromMap(Map<String, dynamic> json) => LogException(
        type: json["type"],
        message: json["message"],
        stackTrace: json["stackTrace"],
      );
  final String type;
  final String message;
  final String stackTrace;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "type": type,
        "message": message,
        "stackTrace": stackTrace,
      };
}
