part of "../data.dart";

class InvoiceService {
  InvoiceService({
    required this.apiKey,
    required this.baseUrl,
  });

  final String apiKey;
  final String baseUrl;

  void create({
    required final UInvoiceCreateParams p,
    required final Function(UResponse<UInvoiceResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/Invoice/Create",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(UResponse<UInvoiceResponse>.fromJson(r.body, (final dynamic i) => UInvoiceResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void read({
    required final UInvoiceReadParams p,
    required final Function(UResponse<List<UInvoiceResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/Invoice/Read",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(
          UResponse<List<UInvoiceResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<UInvoiceResponse>.from((i as List<dynamic>).map((final dynamic x) => UInvoiceResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void readById({
    required final UIdParams p,
    required final Function(UResponse<UInvoiceResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/Invoice/ReadById",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(UResponse<UInvoiceResponse>.fromJson(r.body, (final dynamic i) => UInvoiceResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );

  void update({
    required final UInvoiceUpdateParams p,
    required final Function(UResponse<UInvoiceResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) =>
      UHttpClient.post(
        "$baseUrl/Invoice/Update",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(UResponse<UInvoiceResponse>.fromJson(r.body, (final dynamic i) => UInvoiceResponse.fromMap(i))),
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
        "$baseUrl/Invoice/Delete",
        body: p.toMap().add("apiKey", apiKey).add("token", ULocalStorage.getToken()),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: (String e) => onException(e),
      );
}
