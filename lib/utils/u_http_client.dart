import "dart:developer" as developer;

import "package:u/utilities.dart";

enum URequestBodyType { json, formData }

abstract class UHttpClient {
  static final Client _client = Client();

  static String _generateCacheKey(String endpoint, Map<String, dynamic>? q) => 'cache_${_buildUri(endpoint, q).toString().replaceAll(RegExp(r'[^\w]'), '_')}';

  static Future<Response?> _request({
    required final String method,
    required final String endpoint,
    required final Function(Response) onSuccess,
    required final Function(Response) onError,
    required final Function(String) onException,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic body,
    final URequestBodyType bodyType = URequestBodyType.json,
    final Duration cacheDuration = const Duration(minutes: 60),
    final String noNetworkMessage = "Connection to Network was Not possible",
    final String unexpectedErrorMessage = "Unexpected Error, Please try again",
    final bool offline = false,
  }) async {
    final bool hasNetworkConnection = await UNetwork.hasNetworkConnection();

    if (!hasNetworkConnection && offline == false) {
      onException(noNetworkMessage);
      return null;
    }
    try {
      final Uri uri = _buildUri(endpoint, queryParams);
      final String cacheKey = _generateCacheKey(endpoint, queryParams);

      if (!hasNetworkConnection && offline) {
        final String? cachedData = ULocalStorage.getString(cacheKey);
        if (cachedData != null) {
          final Response response = Response(cachedData, 200, request: Request(method, uri));
          response.prettyLog(params: jsonEncode(body));
          onSuccess(response);
          return response;
        }
      }

      final Request request = Request(method, uri);
      if (headers != null) request.headers.addAll(headers);

      if (body != null) {
        if (bodyType == URequestBodyType.json) {
          if (body is Map) {
            request.body = jsonEncode(removeNullEntries(body));
            request.headers["Content-Type"] = "application/json";
            request.headers["Locale"] = UApp.locale();
          } else if (body is String) {
            request.body = body;
          } else if (body is List<int>) {
            request.bodyBytes = body;
          }
        } else if (bodyType == URequestBodyType.formData && body is Map<String, dynamic>) {
          final Map<String, String> formFields = <String, String>{};
          body.forEach((String key, dynamic value) {
            if (value != null) {
              formFields[key] = value.toString();
            }
          });
          request.bodyFields = formFields;
          request.headers["Content-Type"] = "application/x-www-form-urlencoded";
        }
      }

      final Response response = await _client.send(request).timeout(const Duration(seconds: 30)).then(Response.fromStream);
      response.prettyLog(params: jsonEncode(body));

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        ULocalStorage.set(cacheKey, response.body);
      }

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        onSuccess(response);
        return response;
      } else {
        onError(response);
        return response;
      }
    } catch (e) {
      onException(unexpectedErrorMessage);
      developer.log(e.toString());
      return null;
    }
  }

  static Future<void> upload({
    required final String endpoint,
    required final List<MultipartFile> files,
    required final Function(Response)? onSuccess,
    required final Function(Response)? onError,
    required final VoidCallback onException,
    final Map<String, dynamic>? fields,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
  }) async {
    try {
      final MultipartRequest request = MultipartRequest("POST", _buildUri(endpoint, queryParams));
      request.headers.addAll(<String, String>{...?headers});

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

      final Response response = await request.send().timeout(const Duration(seconds: 30)).then(Response.fromStream);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess?.call(response);
      } else {
        onError?.call(response);
      }
    } catch (e) {
      onException();
    }
  }

  static Future<Response?> get(
    final String endpoint, {
    required final Function(Response) onSuccess,
    required final Function(Response) onError,
    required final Function(String) onException,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final Duration cacheDuration = const Duration(minutes: 60),
    final String noNetworkMessage = "Connection to Network was Not possible",
    final bool returnCacheIfExist = false,
  }) async =>
      _request(
        method: "GET",
        endpoint: endpoint,
        headers: headers,
        queryParams: queryParams,
        onSuccess: onSuccess,
        onError: onError,
        onException: onException,
        cacheDuration: cacheDuration,
        offline: returnCacheIfExist,
      );

  static Future<Response?> post(
    final String endpoint, {
    required final Function(Response) onSuccess,
    required final Function(Response) onError,
    required final Function(String) onException,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic body,
    final URequestBodyType bodyType = URequestBodyType.json,
    final Duration cacheDuration = const Duration(minutes: 60),
    final String noNetworkMessage = "Connection to Network was Not possible",
    final bool offline = false,
  }) async =>
      _request(
        method: "POST",
        endpoint: endpoint,
        headers: headers,
        queryParams: queryParams,
        body: body,
        bodyType: bodyType,
        onSuccess: (Response r) => onSuccess(r),
        onError: (Response r) => onError(r),
        onException: onException,
        cacheDuration: cacheDuration,
        offline: offline,
      );

  static Future<Response?> put(
    final String endpoint, {
    required final Function(Response) onSuccess,
    required final Function(Response) onError,
    required final Function(String) onException,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic body,
    final URequestBodyType bodyType = URequestBodyType.json,
    final String noNetworkMessage = "Connection to Network was Not possible",
  }) async =>
      _request(
        method: "PUT",
        endpoint: endpoint,
        headers: headers,
        queryParams: queryParams,
        body: body,
        bodyType: bodyType,
        onSuccess: onSuccess,
        onError: onError,
        onException: onException,
      );

  static Future<Response?> delete(
    final String endpoint, {
    required final Function(Response) onSuccess,
    required final Function(Response) onError,
    required final Function(String) onException,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final String noNetworkMessage = "Connection to Network was Not possible",
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

  static Uri _buildUri(final String endpoint, final Map<String, dynamic>? queryParams) {
    final Uri uri = Uri.parse(endpoint);

    if (queryParams != null) {
      return uri.replace(
        queryParameters: queryParams.map(
          (final String key, final dynamic value) => MapEntry<String, String>(key, value?.toString() ?? ""),
        ),
      );
    }
    return uri;
  }

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

  static T? removeNullEntries<T>(T? json) {
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

class UDownload {
  static final Map<String, CancelableOperation<Uint8List>> _downloadOperations = <String, CancelableOperation<Uint8List>>{};

  static Future<Uint8List?> downloadFile({
    required String url,
    required String cacheKey,
    required void Function(int progress) onProgress,
  }) async {
    if (_downloadOperations.containsKey(cacheKey)) {
      await _downloadOperations[cacheKey]?.cancel();
    }

    final CancelableOperation<Uint8List> operation = CancelableOperation<Uint8List>.fromFuture(
      _performDownload(url: url, onProgress: onProgress),
      onCancel: () => _cleanup(cacheKey),
    );

    _downloadOperations[cacheKey] = operation;

    try {
      final Uint8List result = await operation.value;
      _downloadOperations.remove(cacheKey);
      return result;
    } catch (e) {
      _downloadOperations.remove(cacheKey);
      rethrow;
    }
  }

  static Future<Uint8List> _performDownload({
    required String url,
    required void Function(int progress) onProgress,
  }) async {
    final Client client = Client();
    try {
      final Request request = Request("GET", Uri.parse(url));
      final StreamedResponse response = await client.send(request);

      if (response.statusCode != 200) {
        throw Exception("Failed to download file: ${response.statusCode}");
      }

      final int? contentLength = response.contentLength;
      final List<int> bytes = <int>[];
      int receivedLength = 0;

      await for (List<int> data in response.stream) {
        bytes.addAll(data);
        receivedLength += data.length;

        if (contentLength != null) {
          final int progress = (receivedLength / contentLength * 100).round();
          onProgress(progress);
        }
      }

      return Uint8List.fromList(bytes);
    } finally {
      client.close();
    }
  }

  static void cancelDownload(String cacheKey) {
    if (_downloadOperations.containsKey(cacheKey)) {
      _downloadOperations[cacheKey]?.cancel();
      _downloadOperations.remove(cacheKey);
    }
  }

  static bool isDownloading(String cacheKey) => _downloadOperations.containsKey(cacheKey);

  static void _cleanup(String cacheKey) {
    _downloadOperations.remove(cacheKey);
  }
}
