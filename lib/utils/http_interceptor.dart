part of 'utils.dart';

Future<void> request(
  final String url,
  final EHttpMethod httpMethod,
  final Function(http.Response response) action,
  final Function(http.Response response) error, {
  final String? queryOrMutation,
  final dynamic body,
  final bool encodeBody = true,
  final Map<String, String>? headers,
  final String userAgent = 'SinaMN75',
  final bool followRedirects = true,
  final Duration timeout = const Duration(seconds: 30),
  final int maxRedirects = 5,
  final bool allowAutoSignedCert = false,
  final bool sendUserAgent = false,
  final int maxAuthRetries = 1,
  final bool withCredentials = false,
}) async {
  try {
    final Map<String, String> header = <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""};

    if (headers != null) header.addAll(headers);

    late http.Response response;
    dynamic params;
    if (body != null) {
      if (encodeBody)
        params = body.toJson();
      else
        params = body;
    }

    if (httpMethod == EHttpMethod.get) response = await http.get(Uri.parse(url), headers: header);
    if (httpMethod == EHttpMethod.post) response = await http.post(Uri.parse(url), body: params, headers: header);
    if (httpMethod == EHttpMethod.put) response = await http.put(Uri.parse(url), body: params, headers: header);
    if (httpMethod == EHttpMethod.patch) response = await http.patch(Uri.parse(url), body: params, headers: header);
    if (httpMethod == EHttpMethod.delete) response = await http.delete(Uri.parse(url), headers: header);

    if (kDebugMode)
      delay(
        100,
        () => response.logRaw(params: (body == null || !encodeBody) ? "" : body.toJson()),
      );
    if (response.isSuccessful()) {
      action(response);
    } else {
      error(response);
    }
  } catch (e) {
    error(http.Response("", 999));
    await dismissEasyLoading();
  }
}

Future<void> httpGet({
  required final String url,
  required final Function(http.Response response) action,
  required final Function(http.Response response) error,
  final Function(dynamic error)? failure,
  final Map<String, String>? headers,
  final String userAgent = 'SinaMN75',
  final bool followRedirects = true,
  final Duration timeout = const Duration(minutes: 60),
  final int maxRedirects = 5,
  final bool allowAutoSignedCert = false,
  final bool sendUserAgent = false,
  final int maxAuthRetries = 1,
  final bool withCredentials = false,
}) async =>
    request(
      url,
      EHttpMethod.get,
      action,
      error,
      headers: headers,
      userAgent: userAgent,
      followRedirects: followRedirects,
      timeout: timeout,
      maxRedirects: maxRedirects,
      allowAutoSignedCert: allowAutoSignedCert,
      sendUserAgent: sendUserAgent,
      maxAuthRetries: maxAuthRetries,
      withCredentials: withCredentials,
    );

Future<void> httpPost({
  required final String url,
  required final Function(http.Response response) action,
  required final Function(http.Response response) error,
  final Function(dynamic error)? failure,
  final Map<String, String>? headers,
  final dynamic body,
  final bool encodeBody = true,
  final String userAgent = 'SinaMN75',
  final bool followRedirects = true,
  final Duration timeout = const Duration(minutes: 60),
  final int maxRedirects = 5,
  final bool allowAutoSignedCert = false,
  final bool sendUserAgent = false,
  final int maxAuthRetries = 1,
  final bool withCredentials = false,
}) async =>
    request(
      url,
      EHttpMethod.post,
      action,
      error,
      body: body,
      encodeBody: encodeBody,
      headers: headers,
      userAgent: userAgent,
      followRedirects: followRedirects,
      timeout: timeout,
      maxRedirects: maxRedirects,
      allowAutoSignedCert: allowAutoSignedCert,
      sendUserAgent: sendUserAgent,
      maxAuthRetries: maxAuthRetries,
      withCredentials: withCredentials,
    );

Future<void> httpPut({
  required final String url,
  required final Function(http.Response response) action,
  required final Function(http.Response response) error,
  final Function(dynamic error)? failure,
  final Map<String, String>? headers,
  final dynamic body,
  final bool encodeBody = true,
  final String userAgent = 'SinaMN75',
  final bool followRedirects = true,
  final Duration timeout = const Duration(minutes: 60),
  final int maxRedirects = 5,
  final bool allowAutoSignedCert = false,
  final bool sendUserAgent = false,
  final int maxAuthRetries = 1,
  final bool withCredentials = false,
}) async =>
    request(
      url,
      EHttpMethod.put,
      action,
      error,
      body: body,
      encodeBody: encodeBody,
      headers: headers,
      userAgent: userAgent,
      followRedirects: followRedirects,
      timeout: timeout,
      maxRedirects: maxRedirects,
      allowAutoSignedCert: allowAutoSignedCert,
      sendUserAgent: sendUserAgent,
      maxAuthRetries: maxAuthRetries,
      withCredentials: withCredentials,
    );

Future<void> patch({
  required final String url,
  required final Function(http.Response response) action,
  required final Function(http.Response response) error,
  final Function(dynamic error)? failure,
  final Map<String, String>? headers,
  final dynamic body,
  final bool encodeBody = true,
  final String userAgent = 'SinaMN75',
  final bool followRedirects = true,
  final Duration timeout = const Duration(minutes: 60),
  final int maxRedirects = 5,
  final bool allowAutoSignedCert = false,
  final bool sendUserAgent = false,
  final int maxAuthRetries = 1,
  final bool withCredentials = false,
}) async =>
    request(
      url,
      EHttpMethod.patch,
      action,
      error,
      body: body,
      encodeBody: encodeBody,
      headers: headers,
      userAgent: userAgent,
      followRedirects: followRedirects,
      timeout: timeout,
      maxRedirects: maxRedirects,
      allowAutoSignedCert: allowAutoSignedCert,
      sendUserAgent: sendUserAgent,
      maxAuthRetries: maxAuthRetries,
      withCredentials: withCredentials,
    );

Future<void> httpDelete({
  required final String url,
  required final Function(http.Response response) action,
  required final Function(http.Response response) error,
  final Function(dynamic error)? failure,
  final Map<String, String>? headers,
  final String userAgent = 'SinaMN75',
  final bool followRedirects = true,
  final Duration timeout = const Duration(minutes: 60),
  final int maxRedirects = 5,
  final bool allowAutoSignedCert = false,
  final bool sendUserAgent = false,
  final int maxAuthRetries = 1,
  final bool withCredentials = false,
}) async =>
    request(
      url,
      EHttpMethod.delete,
      action,
      error,
      headers: headers,
      userAgent: userAgent,
      followRedirects: followRedirects,
      timeout: timeout,
      maxRedirects: maxRedirects,
      allowAutoSignedCert: allowAutoSignedCert,
      sendUserAgent: sendUserAgent,
      maxAuthRetries: maxAuthRetries,
      withCredentials: withCredentials,
    );

enum EHttpMethod { get, post, put, patch, delete }

extension HTTP on http.Response {
  bool isSuccessful() => (statusCode) >= 200 && (statusCode ?? 0) <= 299 ? true : false;

  bool isServerError() => (statusCode) >= 500 && (statusCode ?? 0) <= 599 ? true : false;

  void logRaw({final String params = ""}) {
    developer.log(
      "${this.request?.method} - ${this.request?.url} - $statusCode \nPARAMS: $params\n HEADERS: ${this.request?.headers} \nRESPONSE: $body",
    );
  }

  void prettyLog({final String params = ""}) {
    developer.log(
      "${this.request?.method} - ${this.request?.url} - $statusCode \nPARAMS: ${const JsonEncoder.withIndent(" ").convert(params)} \nRESPONSE: ${const JsonEncoder.withIndent(" ").convert(body)}",
    );
  }
}
