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
