part of "../data.dart";

class UPostalCodeToAddressDetailResponse {
  UPostalCodeToAddressDetailResponse({
    required this.buildingName,
    required this.description,
    required this.floor,
    required this.houseNumber,
    required this.localityName,
    required this.localityType,
    required this.zipCode,
    required this.province,
    required this.sideFloor,
    required this.street,
    required this.street2,
    required this.subLocality,
    required this.townShip,
    required this.traceId,
    required this.village,
    required this.localityCode,
  });

  factory UPostalCodeToAddressDetailResponse.fromJson(String str) => UPostalCodeToAddressDetailResponse.fromMap(json.decode(str));

  factory UPostalCodeToAddressDetailResponse.fromMap(Map<String, dynamic> json) => UPostalCodeToAddressDetailResponse(
    buildingName: json["buildingName"],
    description: json["description"],
    floor: json["floor"],
    houseNumber: json["houseNumber"],
    localityName: json["localityName"],
    localityType: json["localityType"],
    zipCode: json["zipCode"],
    province: json["province"],
    sideFloor: json["sideFloor"],
    street: json["street"],
    street2: json["street2"],
    subLocality: json["subLocality"],
    townShip: json["townShip"],
    traceId: json["traceId"],
    village: json["village"],
    localityCode: json["localityCode"],
  );
  final String? buildingName;
  final String? description;
  final String? floor;
  final String? houseNumber;
  final String? localityName;
  final String? localityType;
  final String? zipCode;
  final String? province;
  final String? sideFloor;
  final String? street;
  final String? street2;
  final String? subLocality;
  final String? townShip;
  final String? traceId;
  final String? village;
  final int? localityCode;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "buildingName": buildingName,
    "description": description,
    "floor": floor,
    "houseNumber": houseNumber,
    "localityName": localityName,
    "localityType": localityType,
    "zipCode": zipCode,
    "province": province,
    "sideFloor": sideFloor,
    "street": street,
    "street2": street2,
    "subLocality": subLocality,
    "townShip": townShip,
    "traceId": traceId,
    "village": village,
    "localityCode": localityCode,
  };
}

class UVehicleViolationDetailResponse {
  final String? plateDictation;
  final String? plateChar;
  final String? complaintStatus;
  final String? complaint;
  final String? dateTime;
  final String? priceStatus;
  final String? traceId;
  final String? paperId;
  final String? paymentId;
  final String? warningPrice;
  final String? inquirePrice;
  final String? ejrInquireNo;
  final String? warningId;
  final String? inquirePriceDictation;
  final List<UVehicleViolationDetailItem> items;

  UVehicleViolationDetailResponse({
    required this.items,
    this.plateDictation,
    this.plateChar,
    this.complaintStatus,
    this.complaint,
    this.dateTime,
    this.priceStatus,
    this.traceId,
    this.paperId,
    this.paymentId,
    this.warningPrice,
    this.inquirePrice,
    this.ejrInquireNo,
    this.warningId,
    this.inquirePriceDictation,
  });

  factory UVehicleViolationDetailResponse.fromJson(String str) => UVehicleViolationDetailResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UVehicleViolationDetailResponse.fromMap(Map<String, dynamic> json) => UVehicleViolationDetailResponse(
    plateDictation: json["plateDictation"],
    plateChar: json["plateChar"],
    complaintStatus: json["complaintStatus"],
    complaint: json["complaint"],
    dateTime: json["dateTime"],
    priceStatus: json["priceStatus"],
    traceId: json["traceId"],
    paperId: json["paperId"],
    paymentId: json["paymentId"],
    warningPrice: json["warningPrice"],
    inquirePrice: json["inquirePrice"],
    ejrInquireNo: json["ejrInquireNo"],
    warningId: json["warningId"],
    inquirePriceDictation: json["inquirePriceDictation"],
    items: json["items"] == null
        ? <UVehicleViolationDetailItem>[]
        : List<UVehicleViolationDetailItem>.from(
            json["items"]!.map(
              (dynamic x) => UVehicleViolationDetailItem.fromMap(x),
            ),
          ),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "plateDictation": plateDictation,
    "plateChar": plateChar,
    "complaintStatus": complaintStatus,
    "complaint": complaint,
    "dateTime": dateTime,
    "priceStatus": priceStatus,
    "traceId": traceId,
    "paperId": paperId,
    "paymentId": paymentId,
    "warningPrice": warningPrice,
    "inquirePrice": inquirePrice,
    "ejrInquireNo": ejrInquireNo,
    "warningId": warningId,
    "inquirePriceDictation": inquirePriceDictation,
    "items": List<dynamic>.from(items.map((UVehicleViolationDetailItem x) => x.toMap())),
  };
}

class UVehicleViolationDetailItem {
  final String? serialNo;
  final String? date;
  final String? type;
  final String? address;
  final String? violationType;
  final String? finalPrice;
  final String? paperId;
  final String? paymentId;
  final String? warningId;
  final String? investigationAbility;
  final bool? hasImage;

  UVehicleViolationDetailItem({
    this.serialNo,
    this.date,
    this.type,
    this.address,
    this.violationType,
    this.finalPrice,
    this.paperId,
    this.paymentId,
    this.warningId,
    this.investigationAbility,
    this.hasImage,
  });

  factory UVehicleViolationDetailItem.fromJson(String str) => UVehicleViolationDetailItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UVehicleViolationDetailItem.fromMap(Map<String, dynamic> json) => UVehicleViolationDetailItem(
    serialNo: json["serialNo"],
    date: json["date"],
    type: json["type"],
    address: json["address"],
    violationType: json["violationType"],
    finalPrice: json["finalPrice"],
    paperId: json["paperId"],
    paymentId: json["paymentId"],
    warningId: json["warningId"],
    investigationAbility: json["investigationAbility"],
    hasImage: json["hasImage"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "serialNo": serialNo,
    "date": date,
    "type": type,
    "address": address,
    "violationType": violationType,
    "finalPrice": finalPrice,
    "paperId": paperId,
    "paymentId": paymentId,
    "warningId": warningId,
    "investigationAbility": investigationAbility,
    "hasImage": hasImage,
  };
}
