part of "../data.dart";

class InquiryService {
  Future<UHttpClientResponse> postalCodeToAddressDetail({
    required final UPostalCodeToAddressDetailParams p,
    final Function(UResponse<UPostalCodeToAddressDetailResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/inquiry/PostalCodeToAddressDetail",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UPostalCodeToAddressDetailResponse>.fromJson(r.body, (final dynamic i) => UPostalCodeToAddressDetailResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> vehicleViolationDetail({
    required final UVehicleViolationDetailParams p,
    final Function(UResponse<UVehicleViolationDetailResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/inquiry/VehicleViolationDetail",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UVehicleViolationDetailResponse>.fromJson(r.body, (final dynamic i) => UVehicleViolationDetailResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );
}
