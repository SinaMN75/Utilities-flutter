part of "../data.dart";

class InquiryService {
  Future<UHttpClientResponse> zipCodeToAddressDetail({
    required final UZipCodeToAddressDetailParams p,
    final Function(UResponse<UZipCodeToAddressDetailResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/inquiry/ZipCodeToAddressDetail",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UZipCodeToAddressDetailResponse>.fromJson(r.body, (final dynamic i) => UZipCodeToAddressDetailResponse.fromMap(i))),
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

  Future<UHttpClientResponse> drivingLicenceDetail({
    required final UDrivingLicenceDetailParams p,
    final Function(UResponse<UDrivingLicenceDetailResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/inquiry/DrivingLicenceDetail",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UDrivingLicenceDetailResponse>.fromJson(r.body, (final dynamic i) => UDrivingLicenceDetailResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> licencePlateDetail({
    required final ULicencePlateDetailParams p,
    final Function(UResponse<ULicencePlateDetailResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/inquiry/LicencePlateDetail",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<ULicencePlateDetailResponse>.fromJson(r.body, (final dynamic i) => ULicencePlateDetailResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> drivingLicenceNegativePoint({
    required final UDrivingLicenceNegativePointParams p,
    final Function(UResponse<UDrivingLicenceNegativePointResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/inquiry/DrivingLicenceNegativePoint",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UDrivingLicenceNegativePointResponse>.fromJson(r.body, (final dynamic i) => UDrivingLicenceNegativePointResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> freewayTolls({
    required final UFreewayTollsParams p,
    final Function(UResponse<UFreewayTollsResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/inquiry/FreewayTolls",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UFreewayTollsResponse>.fromJson(r.body, (final dynamic i) => UFreewayTollsResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> iBanToBankAccountDetail({
    required final UIBanToBankAccountDetailParams p,
    final Function(UResponse<UIBanToBankAccountDetailResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/inquiry/IBanToBankAccountDetail",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UIBanToBankAccountDetailResponse>.fromJson(r.body, (final dynamic i) => UIBanToBankAccountDetailResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );
}
