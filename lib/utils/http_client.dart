import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class SimpleHttp {
  SimpleHttp({
    this.baseUrl,
    this.timeout = const Duration(seconds: 30),
    this.defaultHeaders = const <String, String>{'Accept': 'application/json'},
    this.enableCache = false,
    this.cacheDuration = const Duration(minutes: 5),
  });

  final String? baseUrl;
  final Duration timeout;
  final Map<String, String> defaultHeaders;
  final bool enableCache;
  final Duration cacheDuration;
  final http.Client _client = http.Client();
  final Map<String, CacheEntry> _cache = <String, CacheEntry>{};

  Future<void> request({
    required final String method,
    required final String endpoint,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic body,
    final bool cacheResponse = false,
    required final Function(http.Response)? onSuccess,
    required final Function(http.Response)? onError,
    required final Function(dynamic)? onException,
  }) async {
    try {
      // Build cache key (URL + method + body)
      final String cacheKey = _buildCacheKey(method, endpoint, queryParams, body);

      // Check cache first if enabled
      if (enableCache && cacheResponse && _cache.containsKey(cacheKey)) {
        final CacheEntry cached = _cache[cacheKey]!;
        if (DateTime.now().difference(cached.timestamp) <= cacheDuration) {
          onSuccess?.call(cached.response);
          return;
        } else {
          _cache.remove(cacheKey);
        }
      }

      // Build URI
      final Uri uri = _buildUri(endpoint, queryParams);

      // Merge headers
      final Map<String, String> mergedHeaders = <String, String>{...defaultHeaders, ...?headers};

      // Create request
      final http.Request request = http.Request(method, uri);
      request.headers.addAll(mergedHeaders);

      // Add body if provided
      if (body != null) {
        if (body is Map || body is List) {
          request.body = jsonEncode(body);
          request.headers['Content-Type'] = 'application/json';
        } else if (body is String) {
          request.body = body;
        } else if (body is List<int>) {
          request.bodyBytes = body;
        }
      }

      // Send request with timeout
      final http.Response response = await _client.send(request).timeout(timeout).then(http.Response.fromStream);

      // Cache the response if enabled
      if (enableCache && cacheResponse && response.statusCode == 200) {
        _cache[cacheKey] = CacheEntry(response, DateTime.now());
      }

      // Handle response
      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess?.call(response);
      } else {
        onError?.call(response);
      }
      response.prettyLog(params: jsonEncode(body));
    } catch (e) {
      onException?.call(e);
      print(e);
    }
  }

  // File upload
  Future<void> upload({
    required final String endpoint,
    required final List<http.MultipartFile> files,
    final Map<String, String>? fields,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    required final Function(http.Response)? onSuccess,
    required final Function(http.Response)? onError,
    required final Function(dynamic)? onException,
  }) async {
    try {
      final Uri uri = _buildUri(endpoint, queryParams);
      final http.MultipartRequest request = http.MultipartRequest('POST', uri);

      // Add headers
      request.headers.addAll(<String, String>{...defaultHeaders, ...?headers});

      // Add fields
      if (fields != null) {
        request.fields.addAll(fields);
      }

      // Add files
      request.files.addAll(files);

      // Send request
      final http.Response response = await request.send().timeout(timeout).then(http.Response.fromStream);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess?.call(response);
      } else {
        onError?.call(response);
      }
    } catch (e) {
      onException?.call(e);
    }
  }

  // File download
  Future<void> download({
    required final String endpoint,
    required final String savePath,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    required final Function(File)? onSuccess,
    required final Function(http.Response)? onError,
    required final Function(dynamic)? onException,
  }) async {
    try {
      final Uri uri = _buildUri(endpoint, queryParams);
      final http.Request request = http.Request('GET', uri);
      request.headers.addAll(<String, String>{...defaultHeaders, ...?headers});

      final http.StreamedResponse response = await _client.send(request).timeout(timeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final File file = File(savePath);
        await response.stream.pipe(file.openWrite());
        onSuccess?.call(file);
      } else {
        onError?.call(await http.Response.fromStream(response));
      }
    } catch (e) {
      onException?.call(e);
    }
  }

  // Convenience methods
  Future<void> get(
    final String endpoint, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final bool cacheResponse = false,
    required final Function(http.Response)? onSuccess,
    required final Function(http.Response)? onError,
    required final Function(dynamic)? onException,
  }) async =>
      request(
        method: 'GET',
        endpoint: endpoint,
        headers: headers,
        queryParams: queryParams,
        cacheResponse: cacheResponse,
        onSuccess: onSuccess,
        onError: onError,
        onException: onException,
      );

  Future<void> post(
    final String endpoint, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic body,
    final bool cacheResponse = false,
    required final Function(http.Response)? onSuccess,
    required final Function(http.Response)? onError,
    required final Function(dynamic)? onException,
  }) async =>
      request(
        method: 'POST',
        endpoint: endpoint,
        headers: headers,
        queryParams: queryParams,
        body: body,
        cacheResponse: cacheResponse,
        onSuccess: onSuccess,
        onError: onError,
        onException: onException,
      );

  Future<void> put(
    final String endpoint, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic body,
    final bool cacheResponse = false,
    required final Function(http.Response)? onSuccess,
    required final Function(http.Response)? onError,
    required final Function(dynamic)? onException,
  }) async =>
      request(
        method: 'PUT',
        endpoint: endpoint,
        headers: headers,
        queryParams: queryParams,
        body: body,
        cacheResponse: cacheResponse,
        onSuccess: onSuccess,
        onError: onError,
        onException: onException,
      );

  Future<void> delete(
    final String endpoint, {
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final bool cacheResponse = false,
    required final Function(http.Response)? onSuccess,
    required final Function(http.Response)? onError,
    required final Function(dynamic)? onException,
  }) async =>
      request(
        method: 'DELETE',
        endpoint: endpoint,
        headers: headers,
        queryParams: queryParams,
        cacheResponse: cacheResponse,
        onSuccess: onSuccess,
        onError: onError,
        onException: onException,
      );

  // Cache management
  void clearCache() {
    _cache.clear();
  }

  void removeFromCache(final String method, final String endpoint, [final dynamic body]) {
    final String key = _buildCacheKey(method, endpoint, null, body);
    _cache.remove(key);
  }

  // Helper methods
  Uri _buildUri(final String endpoint, final Map<String, dynamic>? queryParams) {
    final Uri uri = baseUrl != null ? Uri.parse('$baseUrl$endpoint') : Uri.parse(endpoint);

    if (queryParams != null) {
      return uri.replace(queryParameters: queryParams.map((final String key, final value) => MapEntry(key, value?.toString() ?? '')));
    }

    return uri;
  }

  String _buildCacheKey(final String method, final String endpoint, final Map<String, dynamic>? queryParams, final dynamic body) {
    final String uri = _buildUri(endpoint, queryParams).toString();
    final String bodyKey = body != null ? jsonEncode(body) : 'null';
    return '$method:$uri:$bodyKey';
  }

  // JSON decoding helpers
  static Map<String, dynamic> decodeJson(final http.Response response) => jsonDecode(response.body) as Map<String, dynamic>;

  static List<dynamic> decodeJsonArray(final http.Response response) => jsonDecode(response.body) as List<dynamic>;

  // File upload helper
  static Future<http.MultipartFile> multipartFileFromFile(
    final String fieldName,
    final File file, {
    String? filename,
    final MediaType? contentType,
  }) async {
    filename ??= file.path.split('/').last;
    final Stream<List<int>> stream = file.openRead();
    final int length = await file.length();
    return http.MultipartFile(
      fieldName,
      stream,
      length,
      filename: filename,
      contentType: contentType,
    );
  }

  void close() {
    _client.close();
    clearCache();
  }
}

class CacheEntry {
  CacheEntry(this.response, this.timestamp);

  final http.Response response;
  final DateTime timestamp;
}

extension HTTP on http.Response {
  bool isSuccessful() => statusCode >= 200 && statusCode <= 299 ? true : false;

  bool isServerError() => statusCode >= 500 && statusCode <= 599 ? true : false;

  void prettyLog({final String params = ""}) {
    developer.log(
      "${request?.method} - ${request?.url} - $statusCode \nPARAMS: $params \nRESPONSE: $body",
    );
  }
}
