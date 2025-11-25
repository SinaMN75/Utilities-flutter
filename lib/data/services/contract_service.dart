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
  }) =>
      UHttpClient.post(
        "$baseUrl/Contract/Create",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(UResponse<UContractResponse>.fromJson(r.body, (final dynamic i) => UContractResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void read({
    required final UContractReadParams p,
    required final Function(UResponse<List<UContractResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/Contract/Read",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(
          UResponse<List<UContractResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<UContractResponse>.from((i as List<dynamic>).map((final dynamic x) => UContractResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UContractResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/Contract/ReadById",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(UResponse<UContractResponse>.fromJson(r.body, (final dynamic i) => UContractResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void update({
    required final UContractUpdateParams p,
    required final Function(UResponse<UContractResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/Contract/Update",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(UResponse<UContractResponse>.fromJson(r.body, (final dynamic i) => UContractResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void delete({
    required final UIdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/Contract/Delete",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );
}
