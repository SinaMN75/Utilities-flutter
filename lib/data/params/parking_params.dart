part of "../data.dart";

class UParkingCreateParams {
  final String title;
  final double entrancePrice;
  final double hourlyPrice;
  final double dailyPrice;
  final List<int> tags;

  UParkingCreateParams({
    required this.title,
    required this.entrancePrice,
    required this.hourlyPrice,
    required this.dailyPrice,
    required this.tags,
  });

  factory UParkingCreateParams.fromJson(String str) => UParkingCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UParkingCreateParams.fromMap(Map<String, dynamic> json) => UParkingCreateParams(
    title: json["title"],
    entrancePrice: json["entrancePrice"].toDouble(),
    hourlyPrice: json["hourlyPrice"].toDouble(),
    dailyPrice: json["dailyPrice"].toDouble(),
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "title": title,
    "entrancePrice": entrancePrice,
    "hourlyPrice": hourlyPrice,
    "dailyPrice": dailyPrice,
    "tags": List<dynamic>.from(tags.map((int x) => x)),
  };
}

class UParkingUpdateParams {
  final String id;
  final double? entrancePrice;
  final double? hourlyPrice;
  final double? dailyPrice;
  final List<int>? addTags;
  final List<int>? removeTags;

  UParkingUpdateParams({
    required this.id,
    this.entrancePrice,
    this.hourlyPrice,
    this.dailyPrice,
    this.addTags,
    this.removeTags,
  });

  factory UParkingUpdateParams.fromJson(String str) => UParkingUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UParkingUpdateParams.fromMap(Map<String, dynamic> json) => UParkingUpdateParams(
    id: json["id"],
    entrancePrice: json["entrancePrice"]?.toDouble(),
    hourlyPrice: json["hourlyPrice"]?.toDouble(),
    dailyPrice: json["dailyPrice"]?.toDouble(),
    addTags: json["addTags"] == null ? null : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? null : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "entrancePrice": entrancePrice,
    "hourlyPrice": hourlyPrice,
    "dailyPrice": dailyPrice,
    "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((int x) => x)),
  };
}

class UParkingReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final ParkingSelectorArgs? selectorArgs;

  UParkingReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.ids,
    this.selectorArgs,
  });

  factory UParkingReadParams.fromJson(String str) => UParkingReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UParkingReadParams.fromMap(Map<String, dynamic> json) => UParkingReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    selectorArgs: json["selectorArgs"] == null ? null : ParkingSelectorArgs.fromMap(json["selectorArgs"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "selectorArgs": selectorArgs?.toMap(),
  };
}

class UParkingReportCreateParams {
  final String parkingId;
  final DateTime startDate;
  final String numberPlate;
  final List<int> tags;
  final DateTime? endDate;
  final double? amount;

  UParkingReportCreateParams({
    required this.parkingId,
    required this.startDate,
    required this.numberPlate,
    required this.tags,
    this.endDate,
    this.amount,
  });

  factory UParkingReportCreateParams.fromJson(String str) => UParkingReportCreateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UParkingReportCreateParams.fromMap(Map<String, dynamic> json) => UParkingReportCreateParams(
    parkingId: json["parkingId"],
    startDate: DateTime.parse(json["startDate"]),
    numberPlate: json["numberPlate"],
    tags: List<int>.from(json["tags"]!.map((dynamic x) => x)),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    amount: json["amount"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "parkingId": parkingId,
    "startDate": startDate.toIso8601String(),
    "numberPlate": numberPlate,
    "tags": List<dynamic>.from(tags.map((int x) => x)),
    "endDate": endDate?.toIso8601String(),
    "amount": amount,
  };
}

class UParkingReportUpdateParams {
  final String id;
  final String? creatorId;
  final String? vehicleId;
  final String? parkingId;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? amount;
  final List<int>? addTags;
  final List<int>? removeTags;

  UParkingReportUpdateParams({
    required this.id,
    this.creatorId,
    this.vehicleId,
    this.parkingId,
    this.startDate,
    this.endDate,
    this.amount,
    this.addTags,
    this.removeTags,
  });

  factory UParkingReportUpdateParams.fromJson(String str) => UParkingReportUpdateParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UParkingReportUpdateParams.fromMap(Map<String, dynamic> json) => UParkingReportUpdateParams(
    id: json["id"],
    creatorId: json["creatorId"],
    vehicleId: json["vehicleId"],
    parkingId: json["parkingId"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    amount: json["amount"]?.toDouble(),
    addTags: json["addTags"] == null ? null : List<int>.from(json["addTags"]!.map((dynamic x) => x)),
    removeTags: json["removeTags"] == null ? null : List<int>.from(json["removeTags"]!.map((dynamic x) => x)),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "creatorId": creatorId,
    "vehicleId": vehicleId,
    "parkingId": parkingId,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "amount": amount,
    "addTags": addTags == null ? null : List<dynamic>.from(addTags!.map((int x) => x)),
    "removeTags": removeTags == null ? null : List<dynamic>.from(removeTags!.map((int x) => x)),
  };
}

class UParkingReportReadParams {
  final int? pageSize;
  final int? pageNumber;
  final DateTime? fromCreatedAt;
  final DateTime? toCreatedAt;
  final bool? orderByCreatedAt;
  final bool? orderByCreatedAtDesc;
  final List<int>? tags;
  final List<String>? ids;
  final String? vehicleId;
  final String? parkingId;
  final DateTime? startDate;
  final DateTime? endDate;
  final ParkingReportSelectorArgs? selectorArgs;

  UParkingReportReadParams({
    this.pageSize,
    this.pageNumber,
    this.fromCreatedAt,
    this.toCreatedAt,
    this.orderByCreatedAt,
    this.orderByCreatedAtDesc,
    this.tags,
    this.ids,
    this.vehicleId,
    this.parkingId,
    this.startDate,
    this.endDate,
    this.selectorArgs,
  });

  factory UParkingReportReadParams.fromJson(String str) => UParkingReportReadParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UParkingReportReadParams.fromMap(Map<String, dynamic> json) => UParkingReportReadParams(
    pageSize: json["pageSize"],
    pageNumber: json["pageNumber"],
    fromCreatedAt: json["fromCreatedAt"] == null ? null : DateTime.parse(json["fromCreatedAt"]),
    toCreatedAt: json["toCreatedAt"] == null ? null : DateTime.parse(json["toCreatedAt"]),
    orderByCreatedAt: json["orderByCreatedAt"],
    orderByCreatedAtDesc: json["orderByCreatedAtDesc"],
    tags: json["tags"] == null ? <int>[] : List<int>.from(json["tags"]!.map((dynamic x) => x)),
    ids: json["ids"] == null ? <String>[] : List<String>.from(json["ids"]!.map((dynamic x) => x)),
    vehicleId: json["vehicleId"],
    parkingId: json["parkingId"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    selectorArgs: json["selectorArgs"] == null ? null : ParkingReportSelectorArgs.fromMap(json["selectorArgs"]),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "pageSize": pageSize,
    "pageNumber": pageNumber,
    "fromCreatedAt": fromCreatedAt?.toIso8601String(),
    "toCreatedAt": toCreatedAt?.toIso8601String(),
    "orderByCreatedAt": orderByCreatedAt,
    "orderByCreatedAtDesc": orderByCreatedAtDesc,
    "tags": tags == null ? <dynamic>[] : List<dynamic>.from(tags!.map((int x) => x)),
    "ids": ids == null ? <dynamic>[] : List<dynamic>.from(ids!.map((String x) => x)),
    "vehicleId": vehicleId,
    "parkingId": parkingId,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
    "selectorArgs": selectorArgs?.toMap(),
  };
}
