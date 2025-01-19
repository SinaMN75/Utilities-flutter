import 'dart:developer' as developer;

import 'package:u/utilities.dart';

Future<void> httpRequest({
  required final String url,
  required final EHttpMethod httpMethod,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
  final dynamic body,
  final Map<String, String>? headers,
  final Duration timeout = const Duration(seconds: 10),
  final DateTime? cacheExpireDate,
}) async {
  try {
    final Map<String, String> header = <String, String>{
      "Authorization": ULocalStorage.getString(UConstants.token) ?? "",
      "X-API-Key": UCore.apiKey,
    };

    if (headers != null) header.addAll(headers);

    Response<dynamic> response = const Response<dynamic>();
    dynamic params;
    if (body != null) params = body.toJson();

    final GetConnect connect = GetConnect(timeout: timeout);

    if (httpMethod == EHttpMethod.get) {
      if (cacheExpireDate != null) {
        if (ULocalStorage.getString(url).isNullOrEmpty()) {
          response = await connect.get(url, headers: header);
          ULocalStorage.set(url, response.bodyString);
          ULocalStorage.set("${url}___ExpireDate", cacheExpireDate.toIso8601String());
        } else {
          if (DateTime.parse(ULocalStorage.getString("${url}___ExpireDate")!).isBefore(DateTime.now())) {
            ULocalStorage.set(url, null);
            ULocalStorage.set("${url}___ExpireDate", null);
            await httpRequest(
              url: url,
              httpMethod: EHttpMethod.get,
              action: action,
              error: error,
              headers: headers,
              timeout: timeout,
              cacheExpireDate: cacheExpireDate,
            );
          } else {
            action(Response<dynamic>(statusCode: 200, bodyString: ULocalStorage.getString(url)));
            return;
          }
        }
      } else {
        response = await connect.get(url, headers: header);
      }
    }
    if (httpMethod == EHttpMethod.post) response = await connect.post(url, params, headers: header);
    if (httpMethod == EHttpMethod.put) response = await connect.put(url, params, headers: header);
    if (httpMethod == EHttpMethod.patch) response = await connect.patch(url, params, headers: header);
    if (httpMethod == EHttpMethod.delete) response = await connect.delete(url, headers: header);

    if (kDebugMode) response.prettyLog(params: body == null ? "" : body.toJson());
    if (response.isSuccessful()) {
      action(response);
    } else {
      error(response);
    }
  } catch (e) {
    error(const Response<dynamic>(statusCode: 999, body: "{}", bodyString: "{}"));
    ULoading.dismissLoading();
  }
  ULoading.dismissLoading();
}

enum EHttpMethod { get, post, put, patch, delete }

extension HTTP on Response<dynamic> {
  bool isSuccessful() => (statusCode ?? 0) >= 200 && (statusCode ?? 0) <= 299 ? true : false;

  bool isServerError() => (statusCode ?? 0) >= 500 && (statusCode ?? 0) <= 599 ? true : false;

  void prettyLog({final String params = ""}) {
    developer.log(
      "${request?.method} - ${request?.url} - $statusCode \nPARAMS: $params \nRESPONSE: $body",
    );
  }
}
