part of "../data.dart";

class UZipCodeToAddressDetailParams {
  UZipCodeToAddressDetailParams({
    required this.zipCode,
  });

  factory UZipCodeToAddressDetailParams.fromJson(String str) => UZipCodeToAddressDetailParams.fromMap(json.decode(str));

  factory UZipCodeToAddressDetailParams.fromMap(Map<String, dynamic> json) => UZipCodeToAddressDetailParams(
    zipCode: json["zipCode"],
  );

  final String zipCode;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "zipCode": zipCode,
  };
}

class UVehicleViolationDetailParams {
  UVehicleViolationDetailParams({
    required this.nationalCode,
    required this.phoneNumber,
    required this.licencePlate,
  });

  factory UVehicleViolationDetailParams.fromJson(String str) => UVehicleViolationDetailParams.fromMap(json.decode(str));

  factory UVehicleViolationDetailParams.fromMap(Map<String, dynamic> json) => UVehicleViolationDetailParams(
    nationalCode: json["nationalCode"],
    phoneNumber: json["phoneNumber"],
    licencePlate: json["licencePlate"],
  );

  final String nationalCode;
  final String phoneNumber;
  final String licencePlate;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "nationalCode": nationalCode,
    "phoneNumber": phoneNumber,
    "licencePlate": licencePlate,
  };
}

class UDrivingLicenceNegativePointParams {
  final String nationalCode;
  final String phoneNumber;
  final String drivingLicenceNumber;

  UDrivingLicenceNegativePointParams({
    required this.nationalCode,
    required this.phoneNumber,
    required this.drivingLicenceNumber,
  });

  factory UDrivingLicenceNegativePointParams.fromJson(String str) => UDrivingLicenceNegativePointParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDrivingLicenceNegativePointParams.fromMap(Map<String, dynamic> json) => UDrivingLicenceNegativePointParams(
    nationalCode: json["nationalCode"],
    phoneNumber: json["phoneNumber"],
    drivingLicenceNumber: json["drivingLicenceNumber"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "nationalCode": nationalCode,
    "phoneNumber": phoneNumber,
    "drivingLicenceNumber": drivingLicenceNumber,
  };
}

class UDrivingLicenceDetailParams {
  final String nationalCode;
  final String phoneNumber;

  UDrivingLicenceDetailParams({
    required this.nationalCode,
    required this.phoneNumber,
  });

  factory UDrivingLicenceDetailParams.fromJson(String str) => UDrivingLicenceDetailParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UDrivingLicenceDetailParams.fromMap(Map<String, dynamic> json) => UDrivingLicenceDetailParams(
    nationalCode: json["nationalCode"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "nationalCode": nationalCode,
    "phoneNumber": phoneNumber,
  };
}

class UFreewayTollsParams {
  final String licencePlate;

  UFreewayTollsParams({
    required this.licencePlate,
  });

  factory UFreewayTollsParams.fromJson(String str) => UFreewayTollsParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UFreewayTollsParams.fromMap(Map<String, dynamic> json) => UFreewayTollsParams(
    licencePlate: json["licencePlate"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "licencePlate": licencePlate,
  };
}

class UIBanToBankAccountDetailParams {
  final String iBan;

  UIBanToBankAccountDetailParams({
    required this.iBan,
  });

  factory UIBanToBankAccountDetailParams.fromJson(String str) => UIBanToBankAccountDetailParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UIBanToBankAccountDetailParams.fromMap(Map<String, dynamic> json) => UIBanToBankAccountDetailParams(
    iBan: json["iBan"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "iBan": iBan,
  };
}

class ULicencePlateDetailParams {
  final String nationalCode;
  final String licencePlate;

  ULicencePlateDetailParams({
    required this.nationalCode,
    required this.licencePlate,
  });

  factory ULicencePlateDetailParams.fromJson(String str) => ULicencePlateDetailParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ULicencePlateDetailParams.fromMap(Map<String, dynamic> json) => ULicencePlateDetailParams(
    nationalCode: json["nationalCode"],
    licencePlate: json["licencePlate"],
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    "nationalCode": nationalCode,
    "licencePlate": licencePlate,
  };
}
