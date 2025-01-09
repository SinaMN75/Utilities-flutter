import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:u/utilities.dart' hide GetConnect;

Future<void> httpRequest2({
  required final String url,
  required final EHttpMethod httpMethod,
  required final Function(http.Response response) action,
  required final Function(http.Response response) error,
  final dynamic body,
  final bool encodeBody = true,
  final Map<String, String>? headers,
  final Duration timeout = const Duration(seconds: 10),
  final bool clearHeaders = false,
  final DateTime? cacheExpireDate,
}) async {
  try {
    Uri uri = Uri.parse(url);
    final Map<String, String> header = <String, String>{
      "Authorization": ULocalStorage.getString(UConstants.token) ?? "",
      "X-API-Key": UCore.apiKey,
    };

    if (clearHeaders) header.clear();
    if (headers != null) header.addAll(headers);

    http.Response response = http.Response("", 999);
    dynamic params;
    if (body != null) {
      if (encodeBody) {
        params = body.toJson();
      } else {
        params = body;
      }
    }

    if (httpMethod == EHttpMethod.get) {
      if (cacheExpireDate != null) {
        if (ULocalStorage.getString(uri.path).isNullOrEmpty()) {
          response = await http.get(uri, headers: header);
          ULocalStorage.set(url, response.body);
          ULocalStorage.set("${url}___ExpireDate", cacheExpireDate.toIso8601String());
        } else {
          if (DateTime.parse(ULocalStorage.getString("${url}___ExpireDate")!).isBefore(DateTime.now())) {
            ULocalStorage.set(url, null);
            ULocalStorage.set("${url}___ExpireDate", null);
            await httpRequest2(
              url: url,
              httpMethod: EHttpMethod.get,
              action: action,
              error: error,
              headers: headers,
              timeout: timeout,
              clearHeaders: clearHeaders,
              cacheExpireDate: cacheExpireDate,
            );
          } else {
            action(http.Response(ULocalStorage.getString(url)!, 200));
            return;
          }
        }
      } else {
        response = await http.get(uri, headers: header);
      }
    }
    if (httpMethod == EHttpMethod.post) response = await http.post(uri, body: params, headers: header);
    if (httpMethod == EHttpMethod.put) response = await http.put(uri, body: params, headers: header);
    if (httpMethod == EHttpMethod.patch) response = await http.patch(uri, body: params, headers: header);
    if (httpMethod == EHttpMethod.delete) response = await http.delete(uri, headers: header);

    if (kDebugMode) response.prettyLog(params: (body == null || !encodeBody) ? "" : body.toJson());
    if (response.isSuccessful()) {
      action(response);
    } else {
      error(response);
    }
  } catch (e) {
    error(http.Response("{}", 999));
    ULoading.dismissLoading();
  }
  ULoading.dismissLoading();
}

extension HTTPExtension on http.Response {
  bool isSuccessful() => statusCode >= 200 && statusCode <= 299 ? true : false;

  bool isServerError() => statusCode >= 500 && statusCode <= 599 ? true : false;

  void logRaw({final String params = ""}) {
    developer.log(
      "${request?.method} - ${request?.url} - $statusCode \nPARAMS: $params\n HEADERS: ${request?.headers} \nRESPONSE: $body",
    );
  }

  void prettyLog({final String params = ""}) {
    developer.log(
      "${request?.method} - ${request?.url} - $statusCode \nPARAMS: $params \nRESPONSE: $body}",
    );
  }
}
