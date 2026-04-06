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
