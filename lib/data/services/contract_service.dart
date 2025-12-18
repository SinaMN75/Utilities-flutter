part of "../data.dart";

class ContractService {
  Future<UHttpClientResponse> create({
    required final UContractCreateParams p,
    required final Function(UResponse<UContractResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Contract/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UContractResponse>.fromJson(r.body, (final dynamic i) => UContractResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> read({
    required final UContractReadParams p,
    required final Function(UResponse<List<UContractResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Contract/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<List<UContractResponse>>.fromJson(r.body, (final dynamic i) => List<UContractResponse>.from((i as List<dynamic>).map((final dynamic x) => UContractResponse.fromMap(x))))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> readById({
    required final UIdParams p,
    required final Function(UResponse<UContractResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Contract/ReadById",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UContractResponse>.fromJson(r.body, (final dynamic i) => UContractResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> update({
    required final UContractUpdateParams p,
    required final Function(UResponse<UContractResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Contract/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UContractResponse>.fromJson(r.body, (final dynamic i) => UContractResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> delete({
    required final UIdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Contract/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );
}
