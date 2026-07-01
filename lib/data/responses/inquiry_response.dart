part of "../data.dart";

class UBillInfoResponse {
  final String billId;
  final String paymentId;
  final String? caseCode;
  final String? companyCode;
  final String? serviceType;
  final String? checkDigit;
  final String? companyName;
  final String? serviceName;
  final int? billAmount;
  final int? yearDigit;
  final int? periodCode;
  final int? controlDigit1;
  final int? controlDigit2;
  final List<String> warnings;
  final bool isValid;

  UBillInfoResponse({
    required this.billId,
    required this.paymentId,
    required this.warnings,
    required this.isValid,
    this.caseCode,
    this.companyCode,
    this.serviceType,
    this.checkDigit,
    this.companyName,
    this.serviceName,
    this.billAmount,
    this.yearDigit,
    this.periodCode,
    this.controlDigit1,
    this.controlDigit2,
  });

  factory UBillInfoResponse.fromJson(String str) => UBillInfoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UBillInfoResponse.fromMap(Map<String, dynamic> json) =>
      UBillInfoResponse(
        billId: json["billId"],
        paymentId: json["paymentId"],
        caseCode: json["caseCode"],
        companyCode: json["companyCode"],
        serviceType: json["serviceType"],
        checkDigit: json["checkDigit"],
        companyName: json["companyName"],
        serviceName: json["serviceName"],
        billAmount: json["billAmount"],
        yearDigit: json["yearDigit"],
        periodCode: json["periodCode"],
        controlDigit1: json["controlDigit1"],
        controlDigit2: json["controlDigit2"],
        warnings: List<String>.from(json["warnings"]!.map((dynamic x) => x)),
        isValid: json["isValid"],
      );

  Map<String, dynamic> toMap() =>
      <String, dynamic>{
        "billId": billId,
        "paymentId": paymentId,
        "caseCode": caseCode,
        "companyCode": companyCode,
        "serviceType": serviceType,
        "checkDigit": checkDigit,
        "companyName": companyName,
        "serviceName": serviceName,
        "billAmount": billAmount,
        "yearDigit": yearDigit,
        "periodCode": periodCode,
        "controlDigit1": controlDigit1,
        "controlDigit2": controlDigit2,
        "warnings": warnings == null ? <dynamic>[] : List<dynamic>.from(warnings!.map((String x) => x)),
        "isValid": isValid,
      };
}

class UZipCodeToAddressDetailResponse {
  UZipCodeToAddressDetailResponse({
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

  factory UZipCodeToAddressDetailResponse.fromJson(String str) => UZipCodeToAddressDetailResponse.fromMap(json.decode(str));

  factory UZipCodeToAddressDetailResponse.fromMap(Map<String, dynamic> json) => UZipCodeToAddressDetailResponse(
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

class UDrivingLicenceNegativePointResponse {
  final String? point;
  final bool? allowable;
  final String? ruleId;

  UDrivingLicenceNegativePointResponse({
    this.point,
    this.allowable,
    this.ruleId,
  });

  factory UDrivingLicenceNegativePointResponse.fromJson(String str) => UDrivingLicenceNegativePointResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDrivingLicenceNegativePointResponse.fromMap(Map<String, dynamic> json) => UDrivingLicenceNegativePointResponse(
    point: json["point"],
    allowable: json["allowable"],
    ruleId: json["ruleId"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "point": point,
    "allowable": allowable,
    "ruleId": ruleId,
  };
}

class UDrivingLicenceDetailResponse {
  final String? nationalCode;
  final String? firstName;
  final String? lastName;
  final String? requestDate;
  final String? title;
  final String? confirmDate;
  final String? rahvarStatus;
  final String? packetNo;
  final String? barcode;
  final String? printNnumber;
  final String? printDate;
  final String? validYears;

  UDrivingLicenceDetailResponse({
    this.nationalCode,
    this.firstName,
    this.lastName,
    this.requestDate,
    this.title,
    this.confirmDate,
    this.rahvarStatus,
    this.packetNo,
    this.barcode,
    this.printNnumber,
    this.printDate,
    this.validYears,
  });

  factory UDrivingLicenceDetailResponse.fromJson(String str) => UDrivingLicenceDetailResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDrivingLicenceDetailResponse.fromMap(Map<String, dynamic> json) => UDrivingLicenceDetailResponse(
    nationalCode: json["nationalCode"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    requestDate: json["requestDate"],
    title: json["title"],
    confirmDate: json["confirmDate"],
    rahvarStatus: json["rahvarStatus"],
    packetNo: json["packetNo"],
    barcode: json["barcode"],
    printNnumber: json["printNnumber"],
    printDate: json["printDate"],
    validYears: json["validYears"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "nationalCode": nationalCode,
    "firstName": firstName,
    "lastName": lastName,
    "requestDate": requestDate,
    "title": title,
    "confirmDate": confirmDate,
    "rahvarStatus": rahvarStatus,
    "packetNo": packetNo,
    "barcode": barcode,
    "printNnumber": printNnumber,
    "printDate": printDate,
    "validYears": validYears,
  };
}

class UFreewayTollsResponse {
  final String? totalPrice;
  final List<UFreewayTollsItem>? items;

  UFreewayTollsResponse({
    this.totalPrice,
    this.items,
  });

  factory UFreewayTollsResponse.fromJson(String str) => UFreewayTollsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UFreewayTollsResponse.fromMap(Map<String, dynamic> json) => UFreewayTollsResponse(
    totalPrice: json["totalPrice"],
    items: json["items"] == null ? <UFreewayTollsItem>[] : List<UFreewayTollsItem>.from(json["items"]!.map((dynamic x) => UFreewayTollsItem.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "totalPrice": totalPrice,
    "items": items == null ? <dynamic>[] : List<dynamic>.from(items!.map((UFreewayTollsItem x) => x.toMap())),
  };
}

class UFreewayTollsItem {
  final String? id;
  final String? date;
  final String? price;
  final String? gateway;
  final String? freeway;

  UFreewayTollsItem({
    this.id,
    this.date,
    this.price,
    this.gateway,
    this.freeway,
  });

  factory UFreewayTollsItem.fromJson(String str) => UFreewayTollsItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UFreewayTollsItem.fromMap(Map<String, dynamic> json) => UFreewayTollsItem(
    id: json["id"],
    date: json["date"],
    price: json["price"],
    gateway: json["gateway"],
    freeway: json["freeway"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "id": id,
    "date": date,
    "price": price,
    "gateway": gateway,
    "freeway": freeway,
  };
}

class UIBanToBankAccountDetailResponse {
  final String? depositNumber;
  final String? iBanType;
  final String? bankCode;
  final String? bankName;
  final String? ownerName;

  UIBanToBankAccountDetailResponse({
    this.depositNumber,
    this.iBanType,
    this.bankCode,
    this.bankName,
    this.ownerName,
  });

  factory UIBanToBankAccountDetailResponse.fromJson(String str) => UIBanToBankAccountDetailResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UIBanToBankAccountDetailResponse.fromMap(Map<String, dynamic> json) => UIBanToBankAccountDetailResponse(
    depositNumber: json["depositNumber"],
    iBanType: json["iBanType"],
    bankCode: json["bankCode"],
    bankName: json["bankName"],
    ownerName: json["ownerName"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "depositNumber": depositNumber,
    "iBanType": iBanType,
    "bankCode": bankCode,
    "bankName": bankName,
    "ownerName": ownerName,
  };
}

class ULicencePlateDetailResponse {
  final String? status;
  final String? tracePlate;
  final List<ULicencePlateDetailItem>? items;

  ULicencePlateDetailResponse({
    this.status,
    this.tracePlate,
    this.items,
  });

  factory ULicencePlateDetailResponse.fromJson(String str) => ULicencePlateDetailResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ULicencePlateDetailResponse.fromMap(Map<String, dynamic> json) => ULicencePlateDetailResponse(
    status: json["status"],
    tracePlate: json["tracePlate"],
    items: json["items"] == null ? <ULicencePlateDetailItem>[] : List<ULicencePlateDetailItem>.from(json["items"]!.map((dynamic x) => ULicencePlateDetailItem.fromMap(x))),
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "status": status,
    "tracePlate": tracePlate,
    "items": items == null ? <dynamic>[] : List<dynamic>.from(items!.map((ULicencePlateDetailItem x) => x.toMap())),
  };
}

class ULicencePlateDetailItem {
  final String? system;
  final String? type;
  final String? installDate;
  final String? model;

  ULicencePlateDetailItem({
    this.system,
    this.type,
    this.installDate,
    this.model,
  });

  factory ULicencePlateDetailItem.fromJson(String str) => ULicencePlateDetailItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ULicencePlateDetailItem.fromMap(Map<String, dynamic> json) => ULicencePlateDetailItem(
    system: json["system"],
    type: json["type"],
    installDate: json["installDate"],
    model: json["model"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "system": system,
    "type": type,
    "installDate": installDate,
    "model": model,
  };
}