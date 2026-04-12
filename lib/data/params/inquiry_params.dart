part of "../data.dart";

class UPostalCodeToAddressDetailParams {
  UPostalCodeToAddressDetailParams({
    required this.zipCode,
  });

  factory UPostalCodeToAddressDetailParams.fromJson(String str) => UPostalCodeToAddressDetailParams.fromMap(json.decode(str));

  factory UPostalCodeToAddressDetailParams.fromMap(Map<String, dynamic> json) => UPostalCodeToAddressDetailParams(
    zipCode: json["zipCode"],
  );

  final String? zipCode;

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

  final String? nationalCode;
  final String? phoneNumber;
  final String? licencePlate;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
    "nationalCode": nationalCode,
    "phoneNumber": phoneNumber,
    "licencePlate": licencePlate,
  };
}
