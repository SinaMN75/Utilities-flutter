import 'dart:developer' as developer;

import 'package:utilities/utilities.dart';

Future<void> httpRequest({
  required final String url,
  required final EHttpMethod httpMethod,
  required final Function(Response<dynamic> response) action,
  required final Function(Response<dynamic> response) error,
  final dynamic body,
  final bool encodeBody = true,
  final Map<String, String>? headers,
  final Duration timeout = const Duration(seconds: 30),
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

    final GetConnect connect = GetConnect(timeout: timeout);

    if (httpMethod == EHttpMethod.get) {
      if (cacheExpireDate != null) {
        if (getString(url).isNullOrEmpty() || (getString(url) ?? "").length <= 10) {
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
              timeout: timeout,
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

    if (kDebugMode) response.prettyLog(params: (body == null || !encodeBody) ? "" : body.toJson());
    if (response.isSuccessful()) {
      action(response);
    } else {
      error(response);
    }
  } catch (e) {
    error(const Response<dynamic>(statusCode: 999, body: "{}", bodyString: "{}"));
    await dismissEasyLoading();
  }
  await dismissEasyLoading();
}

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
      "${request?.method} - ${request?.url} - $statusCode \nPARAMS: $params \nRESPONSE: $body}",
    );
  }
}
