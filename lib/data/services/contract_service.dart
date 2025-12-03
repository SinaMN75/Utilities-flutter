part of "../data.dart";

class ContractService {
  ContractService({
    required this.apiKey,
    required this.baseUrl,
  });

  final String apiKey;
  final String baseUrl;

  void create({
    required final UContractCreateParams p,
    required final Function(UResponse<UContractResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/Contract/Create",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r, Response? c) => onOk(UResponse<UContractResponse>.fromJson(r.body, (final dynamic i) => UContractResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException(e),
  );

  Future<UResponse<List<UContractResponse>>?> read({
    required final UContractReadParams p,
    required final Function(UResponse<List<UContractResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) async {
    final Response? r = await UHttpClient.send(
      method: "POST",
      endpoint: "$baseUrl/Contract/Read",
      body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
      onSuccess: (final Response r, Response? c) => onOk(UResponse<List<UContractResponse>>.fromJson(r.body, (final dynamic i) => List<UContractResponse>.from((i as List<dynamic>).map((final dynamic x) => UContractResponse.fromMap(x))))),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
      onException: (String e) => onException(e),
    );

    if (r.isSuccessful()) {
      return UResponse<List<UContractResponse>>.fromJson(r!.body, (final dynamic i) => List<UContractResponse>.from((i as List<dynamic>).map((final dynamic x) => UContractResponse.fromMap(x))));
    }
    return null;
  }

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UContractResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/Contract/ReadById",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r, Response? c) => onOk(UResponse<UContractResponse>.fromJson(r.body, (final dynamic i) => UContractResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException(e),
  );

  void update({
    required final UContractUpdateParams p,
    required final Function(UResponse<UContractResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/Contract/Update",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r, Response? c) => onOk(UResponse<UContractResponse>.fromJson(r.body, (final dynamic i) => UContractResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException(e),
  );

  void delete({
    required final UIdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "$baseUrl/Contract/Delete",
    body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r, Response? c) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException(e),
  );
}
