import "dart:developer" as developer;

import "package:u/utilities.dart";

enum UHttpRequestType { json, formData }

class UHttpClient {
  UHttpClient({
    this.baseUrl,
    this.timeout = const Duration(seconds: 30),
    this.defaultHeaders = const <String, String>{},
  });

  final String? baseUrl;
  final Duration timeout;
  final Map<String, String> defaultHeaders;
  final Client _client = Client();

  Future<Response?> _request({
    required final String method,
    required final String endpoint,
    required final Function(Response)? onSuccess,
    required final Function(Response)? onError,
    required final Function(dynamic)? onException,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic body,
    final UHttpRequestType type = UHttpRequestType.json,
  }) async {
    final Uri uri = _buildUri(endpoint, queryParams);
    final Map<String, String> mergedHeaders = <String, String>{...defaultHeaders, ...?headers};
    final Request request = Request(method, uri);
    request.headers.addAll(mergedHeaders);

    if (body != null) {
      if (body is Map<String, String>) {
        if (type == UHttpRequestType.json) {
          request.body = jsonEncode(removeNullEntries(body));
          request.headers["Content-Type"] = "application/json";
        } else {
          request.bodyFields = body;
          request.headers["Content-Type"] = "application/x-www-form-urlencoded";
        }
      } else if (body is String) {
        request.body = body;
      } else if (body is List<int>) {
        request.bodyBytes = body;
      }
    }

    final Response response = await _client.send(request).timeout(timeout).then(Response.fromStream);
    response.prettyLog(params: jsonEncode(body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      onSuccess?.call(response);
      return response;
    } else {
      onError?.call(response);
      return response;
    }
  }

  Future<void> upload({
    required final String endpoint,
    required final List<MultipartFile> files,
    required final Function(Response)? onSuccess,
    required final Function(Response)? onError,
    required final Function(dynamic)? onException,
    final Map<String, dynamic>? fields,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
  }) async {
    try {
      final MultipartRequest request = MultipartRequest("POST", _buildUri(endpoint, queryParams));

      request.headers.addAll(<String, String>{...defaultHeaders, ...?headers});

      if (fields != null) {
        request.fields.addAll(
          fields.map(
            (String key, dynamic value) => MapEntry<String, String>(
              key,
              value is String ? value : jsonEncode(value),
            ),
          ),
        );
      }

      request.files.addAll(files);

      final Response response = await request.send().timeout(timeout).then(Response.fromStream);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess?.call(response);
      } else {
        onError?.call(response);
      }
    } catch (e) {
      onException?.call(e);
    }
  }

  Future<void> download({
    required final String endpoint,
    required final String savePath,
    required final Function(File)? onSuccess,
    required final Function(Response)? onError,
    required final Function(dynamic)? onException,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
  }) async {
    try {
      final Uri uri = _buildUri(endpoint, queryParams);
      final Request request = Request("GET", uri);
      request.headers.addAll(<String, String>{...defaultHeaders, ...?headers});

      final StreamedResponse response = await _client.send(request).timeout(timeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final File file = File(savePath);
        await response.stream.pipe(file.openWrite());
        onSuccess?.call(file);
      } else {
        onError?.call(await Response.fromStream(response));
      }
    } catch (e) {
      onException?.call(e);
    }
  }

  Future<Response?> get(
    final String endpoint, {
    required final Function(Response)? onSuccess,
    required final Function(Response)? onError,
    required final Function(dynamic)? onException,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
  }) async =>
      _request(
        method: "GET",
        endpoint: endpoint,
        headers: headers,
        queryParams: queryParams,
        onSuccess: onSuccess,
        onError: onError,
        onException: onException,
      );

  Future<Response?> post(
    final String endpoint, {
    required final Function(String) onSuccess,
    required final Function(String) onError,
    required final Function(dynamic) onException,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic body,
    final UHttpRequestType type = UHttpRequestType.json,
  }) async =>
      _request(
        method: "POST",
        endpoint: endpoint,
        headers: headers,
        queryParams: queryParams,
        body: body,
        onSuccess: (Response r) => onSuccess(r.body),
        onError: (Response r) => onError(r.body),
        onException: onException,
        type: type,
      );

  Future<Response?> put(
    final String endpoint, {
    required final Function(Response)? onSuccess,
    required final Function(Response)? onError,
    required final Function(dynamic)? onException,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic body,
    final UHttpRequestType type = UHttpRequestType.json,
  }) async =>
      _request(method: "PUT", endpoint: endpoint, headers: headers, queryParams: queryParams, body: body, onSuccess: onSuccess, onError: onError, onException: onException, type: type);

  Future<Response?> delete(
    final String endpoint, {
    required final Function(Response)? onSuccess,
    required final Function(Response)? onError,
    required final Function(dynamic)? onException,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
  }) async =>
      _request(
        method: "DELETE",
        endpoint: endpoint,
        headers: headers,
        queryParams: queryParams,
        onSuccess: onSuccess,
        onError: onError,
        onException: onException,
      );

  Uri _buildUri(final String endpoint, final Map<String, dynamic>? queryParams) {
    final Uri uri = baseUrl != null ? Uri.parse("$baseUrl$endpoint") : Uri.parse(endpoint);

    if (queryParams != null) {
      return uri.replace(queryParameters: queryParams.map((final String key, final dynamic value) => MapEntry<String, String>(key, value?.toString() ?? "")));
    }

    return uri;
  }

  static Map<String, dynamic> decodeJson(final Response response) => jsonDecode(response.body) as Map<String, dynamic>;

  static List<dynamic> decodeJsonArray(final Response response) => jsonDecode(response.body) as List<dynamic>;

  static Future<MultipartFile> multipartFileFromFile(
    final String fieldName,
    final File file, {
    String? filename,
    final MediaType? contentType,
  }) async {
    filename ??= file.path.split("/").last;
    final Stream<List<int>> stream = file.openRead();
    final int length = await file.length();
    return MultipartFile(
      fieldName,
      stream,
      length,
      filename: filename,
      contentType: contentType,
    );
  }

  void close() {
    _client.close();
  }
}

extension HTTP on Response {
  bool isSuccessful() => statusCode >= 200 && statusCode <= 299 || false;

  bool isServerError() => statusCode >= 500 && statusCode <= 599 || false;

  void prettyLog({final String params = ""}) {
    developer.log(
      "${request?.method} - ${request?.url} - $statusCode \nPARAMS: $params \nRESPONSE: $body",
    );
  }
}

T? removeNullEntries<T>(T? json) {
  if (json == null) return null;

  if (json is List) {
    json.removeWhere((final dynamic e) => e == null);
    json.forEach(removeNullEntries);
  } else if (json is Map) {
    json.removeWhere((final dynamic key, final dynamic value) => key == null || value == null);
    json.values.forEach(removeNullEntries);
  }

  return json;
}
