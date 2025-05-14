import 'dart:developer' as developer;

import 'package:u/utilities.dart';

class SimpleHttp {
  final Map<String, String> defaultHeaders = const <String, String>{'Accept': 'application/json'};
  final Client _client = Client();

  Future<Response?> request({
    required final String method,
    required final String endpoint,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic body,
    Duration? cacheDuration,
    required final Function(Response)? onSuccess,
    required final Function(Response)? onError,
    required final Function(dynamic)? onException,
  }) async {
    try {
      final String cacheKey = _buildCacheKey(method, endpoint, queryParams, body);

      if (cacheDuration != null) {
        final String? cachedResponse = ULocalStorage.getString(cacheKey);
        final String? cachedTimestamp = ULocalStorage.getString('$cacheKey:timestamp');

        if (cachedResponse != null && cachedTimestamp != null) {
          final DateTime timestamp = DateTime.parse(cachedTimestamp);
          if (DateTime.now().difference(timestamp) <= cacheDuration) {
            final Response response = Response(cachedResponse, 200);
            onSuccess?.call(response);
            return response;
          } else {
            ULocalStorage.remove(cacheKey);
            ULocalStorage.remove('$cacheKey:timestamp');
          }
        }
      }

      final Uri uri = _buildUri(endpoint, queryParams);

      final Map<String, String> mergedHeaders = <String, String>{...defaultHeaders, ...?headers};

      final Request request = Request(method, uri);
      request.headers.addAll(mergedHeaders);

      if (body != null) {
        if (body is Map) {
          request.body = jsonEncode(removeNullEntries(body));
          request.headers['Content-Type'] = 'application/json';
          request.headers['Locale'] = UApp.locale();
        } else if (body is String) {
          request.body = body;
        } else if (body is List<int>) {
          request.bodyBytes = body;
        }
      }

      final Response response = await _client.send(request).timeout(const Duration(seconds: 30)).then(Response.fromStream);
      response.prettyLog(params: jsonEncode(body));

      if (cacheDuration != null && response.statusCode == 200) {
        ULocalStorage.set(cacheKey, response.body);
        ULocalStorage.set('$cacheKey:timestamp', DateTime.now().toIso8601String());
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess?.call(response);
        return response;
      } else {
        onError?.call(response);
        return response;
      }
    } catch (e) {
      onException?.call(e);
      return null;
    }
  }

  Future<void> upload({
    required final String endpoint,
    required final List<MultipartFile> files,
    final Map<String, String>? fields,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    required final Function(Response)? onSuccess,
    required final Function(Response)? onError,
    required final Function(dynamic)? onException,
  }) async {
    try {
      final Uri uri = _buildUri(endpoint, queryParams);
      final MultipartRequest request = MultipartRequest('POST', uri);

      request.headers.addAll(<String, String>{...defaultHeaders, ...?headers});

      if (fields != null) {
        request.fields.addAll(fields);
      }

      request.files.addAll(files);

      final Response response = await request.send().timeout(const Duration(seconds: 30)).then(Response.fromStream);

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
    Duration? cacheDuration,
    required final String savePath,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    required final Function(File)? onSuccess,
    required final Function(Response)? onError,
    required final Function(dynamic)? onException,
  }) async {
    try {
      final Uri uri = _buildUri(endpoint, queryParams);
      final Request request = Request('GET', uri);
      request.headers.addAll(<String, String>{...defaultHeaders, ...?headers});

      final StreamedResponse response = await _client.send(request).timeout(const Duration(seconds: 30));

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
    Duration? cacheDuration,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    required final Function(Response)? onSuccess,
    required final Function(Response)? onError,
    required final Function(dynamic)? onException,
  }) async =>
      request(
        method: 'GET',
        endpoint: endpoint,
        cacheDuration: cacheDuration,
        headers: headers,
        queryParams: queryParams,
        onSuccess: onSuccess,
        onError: onError,
        onException: onException,
      );

  Future<Response?> post(
    final String endpoint, {
    Duration? cacheDuration,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic body,
    required final Function(Response)? onSuccess,
    required final Function(Response)? onError,
    required final Function(dynamic)? onException,
  }) async =>
      request(
        method: 'POST',
        endpoint: endpoint,
        headers: headers,
        queryParams: queryParams,
        body: body,
        cacheDuration: cacheDuration,
        onSuccess: onSuccess,
        onError: onError,
        onException: onException,
      );

  Future<Response?> put(
    final String endpoint, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic body,
    required final Function(Response)? onSuccess,
    required final Function(Response)? onError,
    required final Function(dynamic)? onException,
  }) async =>
      request(
        method: 'PUT',
        endpoint: endpoint,
        headers: headers,
        queryParams: queryParams,
        body: body,
        onSuccess: onSuccess,
        onError: onError,
        onException: onException,
      );

  Future<Response?> delete(
    final String endpoint, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    required final Function(Response)? onSuccess,
    required final Function(Response)? onError,
    required final Function(dynamic)? onException,
  }) async =>
      request(
        method: 'DELETE',
        endpoint: endpoint,
        headers: headers,
        queryParams: queryParams,
        onSuccess: onSuccess,
        onError: onError,
        onException: onException,
      );

  void clearCache() {
    // SharedPreferences doesn't support clearing only cache entries,
    // so we need to track cache keys separately if we want to implement this
    // For now, just leave this empty or implement a more sophisticated solution
  }

  void removeFromCache(final String method, final String endpoint, [final dynamic body]) {
    final String key = _buildCacheKey(method, endpoint, null, body);
    ULocalStorage.remove(key);
    ULocalStorage.remove('$key:timestamp');
  }

  Uri _buildUri(final String endpoint, final Map<String, dynamic>? queryParams) {
    final Uri uri = Uri.parse(endpoint);

    if (queryParams != null) {
      return uri.replace(queryParameters: queryParams.map((final String key, final dynamic value) => MapEntry<String, String>(key, value?.toString() ?? '')));
    }

    return uri;
  }

  String _buildCacheKey(final String method, final String endpoint, final Map<String, dynamic>? queryParams, final dynamic body) {
    final String uri = _buildUri(endpoint, queryParams).toString();
    final String bodyKey = body != null ? jsonEncode(body) : 'null';
    return '$method:$uri:$bodyKey';
  }

  static Map<String, dynamic> decodeJson(final Response response) => jsonDecode(response.body) as Map<String, dynamic>;

  static List<dynamic> decodeJsonArray(final Response response) => jsonDecode(response.body) as List<dynamic>;

  static Future<MultipartFile> multipartFileFromFile(
    final String fieldName,
    final File file, {
    String? filename,
    final MediaType? contentType,
  }) async {
    filename ??= file.path.split('/').last;
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
  bool isSuccessful() => statusCode >= 200 && statusCode <= 299 ? true : false;

  bool isServerError() => statusCode >= 500 && statusCode <= 599 ? true : false;

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
