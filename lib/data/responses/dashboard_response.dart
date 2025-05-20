part of "../data.dart";

class MetricsResponse {
  final double cpuUsage;
  final double memoryUsage;
  final double diskUsage;
  final double totalMemory;
  final double freeMemory;
  final double totalDisk;
  final double freeDisk;
  final String date;

  MetricsResponse({
    this.cpuUsage = 0,
    this.memoryUsage = 0,
    this.diskUsage = 0,
    this.totalMemory = 0,
    this.freeMemory = 0,
    this.totalDisk = 0,
    this.freeDisk = 0,
    this.date = "",
  });

  factory MetricsResponse.fromJson(String str) => MetricsResponse.fromMap(json.decode(str));

  factory MetricsResponse.fromMap(Map<String, dynamic> json) => MetricsResponse(
        cpuUsage: json["cpuUsage"].toString().toDouble(),
        memoryUsage: json["memoryUsage"].toString().toDouble(),
        diskUsage: json["diskUsage"].toString().toDouble(),
        totalMemory: json["totalMemory"].toString().toDouble(),
        freeMemory: json["freeMemory"].toString().toDouble(),
        totalDisk: json["totalDisk"].toString().toDouble(),
        freeDisk: json["freeDisk"].toString().toDouble(),
        date: json["date"],
      );
}

class DashboardResponse {
  final int categories;
  final int comments;
  final int contents;
  final int exams;
  final int media;
  final int products;
  final int users;
  final List<UserResponse> newUsers;
  final List<CategoryResponse> newCategories;
  final List<ExamResponse> newExams;
  final List<MediaResponse> newMedia;

  // final List<> newComments;
  // final List<> newContents;
  // final List<> newProducts;

  DashboardResponse({
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

  factory DashboardResponse.fromJson(String str) => DashboardResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DashboardResponse.fromMap(Map<String, dynamic> json) => DashboardResponse(
        categories: json["categories"],
        comments: json["comments"],
        contents: json["contents"],
        exams: json["exams"],
        media: json["media"],
        products: json["products"],
        users: json["users"],
        newUsers: List<UserResponse>.from(json["newUsers"].map((dynamic x) => UserResponse.fromMap(x))),
        newCategories: List<CategoryResponse>.from(json["newCategories"].map((dynamic x) => CategoryResponse.fromMap(x))),
        newExams: List<ExamResponse>.from(json["newExams"].map((dynamic x) => ExamResponse.fromMap(x))),
        newMedia: List<MediaResponse>.from(json["newMedia"].map((dynamic x) => MediaResponse.fromMap(x))),
        // newComments: List<NewComment>.from(json["newComments"].map((x) => NewComment.fromMap(x))),
        // newContents: List<NewContent>.from(json["newContents"].map((x) => NewContent.fromMap(x))),
        // newProducts: List<NewProduct>.from(json["newProducts"].map((x) => NewProduct.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "categories": categories,
        "comments": comments,
        "contents": contents,
        "exams": exams,
        "media": media,
        "products": products,
        "users": users,
        "newUsers": List<dynamic>.from(newUsers.map((UserResponse x) => x.toMap())),
        "newCategories": List<dynamic>.from(newCategories.map((CategoryResponse x) => x.toMap())),
        "newExams": List<dynamic>.from(newExams.map((ExamResponse x) => x.toMap())),
        "newMedia": List<dynamic>.from(newMedia.map((MediaResponse x) => x.toMap())),
        // "newContents": List<dynamic>.from(newContents.map((dynamic x) => x.toMap())),
        // "newComments": List<dynamic>.from(newComments.map((dynamic x) => x.toMap())),
        // "newProducts": List<dynamic>.from(newProducts.map((dynamic x) => x.toMap())),
      };
}
