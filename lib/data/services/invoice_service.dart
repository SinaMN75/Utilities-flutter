part of "../data.dart";

class InvoiceService {
  Future<UHttpClientResponse> create({
    required final UInvoiceCreateParams p,
    required final Function(UResponse<UInvoiceResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Invoice/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UInvoiceResponse>.fromJson(r.body, (final dynamic i) => UInvoiceResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> read({
    required final UInvoiceReadParams p,
    required final Function(UResponse<List<UInvoiceResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Invoice/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(
      UResponse<List<UInvoiceResponse>>.fromJson(
        r.body,
        (final dynamic i) => List<UInvoiceResponse>.from((i as List<dynamic>).map((final dynamic x) => UInvoiceResponse.fromMap(x))),
      ),
    ),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> readById({
    required final UIdParams p,
    required final Function(UResponse<UInvoiceResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Invoice/ReadById",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UInvoiceResponse>.fromJson(r.body, (final dynamic i) => UInvoiceResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> update({
    required final UInvoiceUpdateParams p,
    required final Function(UResponse<UInvoiceResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Invoice/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UInvoiceResponse>.fromJson(r.body, (final dynamic i) => UInvoiceResponse.fromMap(i))),
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
    endpoint: "${U.baseUrl}/Invoice/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: onException,
  );
}
