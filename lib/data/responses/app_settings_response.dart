part of "../data.dart";

// Server-side prices used to show the amount on the payment page before each paid action.
class UAppSettingsResponse {
  UAppSettingsResponse({required this.apiCallCosts});

  factory UAppSettingsResponse.fromMap(Map<String, dynamic> json) => UAppSettingsResponse(
    apiCallCosts: UApiCallCosts.fromMap(json["apiCallCosts"] ?? <String, dynamic>{}),
  );

  final UApiCallCosts apiCallCosts;
}

// Price (in rial) of each vehicle / inquiry service, mirroring the backend ApiCallCosts.
class UApiCallCosts {
  UApiCallCosts({
    required this.mobileAndNationalCodeVerification,
    required this.zipCodeToAddressDetail,
    required this.vehicleViolationsDetail,
    required this.drivingLicenceStatus,
    required this.freewayToll,
    required this.licencePlateDetail,
    required this.drivingLicenceNegativePoint,
    required this.iBanToBankAccountDetail,
  });

  factory UApiCallCosts.fromMap(Map<String, dynamic> json) => UApiCallCosts(
    mobileAndNationalCodeVerification: (json["mobileAndNationalCodeVerification"] ?? 0).toString().toDouble(),
    zipCodeToAddressDetail: (json["zipCodeToAddressDetail"] ?? 0).toString().toDouble(),
    vehicleViolationsDetail: (json["vehicleViolationsDetail"] ?? 0).toString().toDouble(),
    drivingLicenceStatus: (json["drivingLicenceStatus"] ?? 0).toString().toDouble(),
    freewayToll: (json["freewayToll"] ?? 0).toString().toDouble(),
    licencePlateDetail: (json["licencePlateDetail"] ?? 0).toString().toDouble(),
    drivingLicenceNegativePoint: (json["drivingLicenceNegativePoint"] ?? 0).toString().toDouble(),
    iBanToBankAccountDetail: (json["iBanToBankAccountDetail"] ?? 0).toString().toDouble(),
  );

  final double mobileAndNationalCodeVerification;
  final double zipCodeToAddressDetail;
  final double vehicleViolationsDetail;
  final double drivingLicenceStatus;
  final double freewayToll;
  final double licencePlateDetail;
  final double drivingLicenceNegativePoint;
  final double iBanToBankAccountDetail;
}
