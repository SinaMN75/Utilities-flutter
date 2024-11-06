part of 'utils.dart';

Future<void> httpRequest({
  required final String url,
  required final EHttpMethod httpMethod,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
  final Function(dynamic error)? failure,
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
  final bool clearHeaders = false,
  final DateTime? cacheExpireDate,
}) async {
  try {
    final Map<String, String> header = <String, String>{
      "Authorization": getString(UtilitiesConstants.token) ?? "",
      "X-API-Key": UtilitiesCore.apiKey,
    };

    if (clearHeaders) header.clear();

    if (headers != null) header.addAll(headers);

    Response<dynamic> response = const Response<dynamic>();
    dynamic params;
    if (body != null) {
      if (encodeBody)
        params = body.toJson();
      else
        params = body;
    }

    final GetConnect connect = GetConnect(
      userAgent: userAgent,
      followRedirects: followRedirects,
      timeout: timeout,
      maxRedirects: maxRedirects,
      allowAutoSignedCert: allowAutoSignedCert,
      sendUserAgent: sendUserAgent,
      maxAuthRetries: maxAuthRetries,
      withCredentials: withCredentials,
    );

    if (httpMethod == EHttpMethod.get) {
      if (cacheExpireDate != null) {
        if (getString(url) == null) {
          response = await connect.get(url, headers: header);
          setData(url, response.bodyString);
          setData("${url}___ExpireDate", cacheExpireDate.toIso8601String());
        } else {
          if (DateTime.parse(getString("${url}___ExpireDate")!).isBefore(DateTime.now())) {
            setData(url, null);
            setData("${url}___ExpireDate", null);
            await httpRequest(
              url: url,
              httpMethod: EHttpMethod.get,
              action: action,
              error: error,
              headers: headers,
              userAgent: userAgent,
              followRedirects: followRedirects,
              timeout: timeout,
              maxRedirects: maxRedirects,
              allowAutoSignedCert: allowAutoSignedCert,
              sendUserAgent: sendUserAgent,
              maxAuthRetries: maxAuthRetries,
              withCredentials: withCredentials,
              failure: failure,
              clearHeaders: clearHeaders,
              cacheExpireDate: cacheExpireDate,
            );
          } else {
            action(Response<dynamic>(statusCode: 200, bodyString: getString(url)));
            return;
          }
        }
      } else
        response = await connect.get(url, headers: header);
    }
    if (httpMethod == EHttpMethod.post) response = await connect.post(url, params, headers: header);
    if (httpMethod == EHttpMethod.put) response = await connect.put(url, params, headers: header);
    if (httpMethod == EHttpMethod.patch) response = await connect.patch(url, params, headers: header);
    if (httpMethod == EHttpMethod.delete) response = await connect.delete(url, headers: header);

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
    developer.log(e.toString());
    error(const Response<dynamic>(statusCode: 999));
    if (failure != null) failure(e);
    await dismissEasyLoading();
  }
  await dismissEasyLoading();
}

Future<void> httpGet({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
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
  final bool clearHeaders = false,
  final bool? cache,
  final DateTime? cacheExpireDate,
}) async =>
    httpRequest(
      url: url,
      httpMethod: EHttpMethod.get,
      action: action,
      error: error,
      headers: headers,
      userAgent: userAgent,
      followRedirects: followRedirects,
      timeout: timeout,
      maxRedirects: maxRedirects,
      allowAutoSignedCert: allowAutoSignedCert,
      sendUserAgent: sendUserAgent,
      maxAuthRetries: maxAuthRetries,
      withCredentials: withCredentials,
      failure: failure,
      clearHeaders: clearHeaders,
    );

Future<void> httpPost({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
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
  final bool clearHeaders = false,
  final bool? cache,
  final DateTime? cacheExpireDate,
}) async =>
    httpRequest(
      url: url,
      httpMethod: EHttpMethod.post,
      action: action,
      error: error,
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
      failure: failure,
      clearHeaders: clearHeaders,
    );

Future<void> httpPut({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
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
  final bool clearHeaders = false,
  final bool? cache,
  final DateTime? cacheExpireDate,
}) async =>
    httpRequest(
      url: url,
      httpMethod: EHttpMethod.put,
      action: action,
      error: error,
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
      failure: failure,
      clearHeaders: clearHeaders,
    );

Future<void> httpDelete({
  required final String url,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
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
  final bool clearHeaders = false,
  final bool? cache,
  final DateTime? cacheExpireDate,
}) async =>
    httpRequest(
      url: url,
      httpMethod: EHttpMethod.delete,
      action: action,
      error: error,
      headers: headers,
      userAgent: userAgent,
      followRedirects: followRedirects,
      timeout: timeout,
      maxRedirects: maxRedirects,
      allowAutoSignedCert: allowAutoSignedCert,
      sendUserAgent: sendUserAgent,
      maxAuthRetries: maxAuthRetries,
      withCredentials: withCredentials,
      failure: failure,
      clearHeaders: clearHeaders,
    );

enum EHttpMethod { get, post, put, patch, delete }

extension HTTP on Response<dynamic> {
  bool isSuccessful() => (statusCode ?? 0) >= 200 && (statusCode ?? 0) <= 299 ? true : false;

  bool isServerError() => (statusCode ?? 0) >= 500 && (statusCode ?? 0) <= 599 ? true : false;

  void logRaw({final String params = ""}) {
    developer.log(
      "${request?.method} - ${request?.url} - $statusCode \nPARAMS: $params\n HEADERS: ${request?.headers} \nRESPONSE: $body",
    );
  }

  void prettyLog({final String params = ""}) {
    developer.log(
      "${request?.method} - ${request?.url} - $statusCode \nPARAMS: ${const JsonEncoder.withIndent(" ").convert(params)} \nRESPONSE: ${const JsonEncoder.withIndent(" ").convert(body)}",
    );
  }
}
