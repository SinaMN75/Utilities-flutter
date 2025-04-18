import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class SimpleHttp {
  final String? baseUrl;
  final Duration timeout;
  final Map<String, String> defaultHeaders;
  final bool enableCache;
  final Duration cacheDuration;
  final http.Client _client = http.Client();
  final Map<String, CacheEntry> _cache = {};

  SimpleHttp({
    this.baseUrl,
    this.timeout = const Duration(seconds: 30),
    this.defaultHeaders = const {'Accept': 'application/json'},
    this.enableCache = false,
    this.cacheDuration = const Duration(minutes: 5),
  });

  Future<void> request({
    required String method,
    required String endpoint,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    dynamic body,
    bool cacheResponse = false,
    required Function(http.Response)? onSuccess,
    required Function(http.Response)? onError,
    required Function(dynamic)? onException,
  }) async {
    try {
      // Build cache key (URL + method + body)
      final cacheKey = _buildCacheKey(method, endpoint, queryParams, body);

      // Check cache first if enabled
      if (enableCache && cacheResponse && _cache.containsKey(cacheKey)) {
        final cached = _cache[cacheKey]!;
        if (DateTime.now().difference(cached.timestamp) <= cacheDuration) {
          onSuccess?.call(cached.response);
          return;
        } else {
          _cache.remove(cacheKey);
        }
      }

      // Build URI
      final uri = _buildUri(endpoint, queryParams);

      // Merge headers
      final mergedHeaders = {...defaultHeaders, ...?headers};

      // Create request
      final request = http.Request(method, uri);
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
      final response = await _client.send(request).timeout(timeout).then(http.Response.fromStream);

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
    } catch (e) {
      onException?.call(e);
    }
  }

  // File upload
  Future<void> upload({
    required String endpoint,
    required List<http.MultipartFile> files,
    Map<String, String>? fields,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    required Function(http.Response)? onSuccess,
    required Function(http.Response)? onError,
    required Function(dynamic)? onException,
  }) async {
    try {
      final uri = _buildUri(endpoint, queryParams);
      final request = http.MultipartRequest('POST', uri);

      // Add headers
      request.headers.addAll({...defaultHeaders, ...?headers});

      // Add fields
      if (fields != null) {
        request.fields.addAll(fields);
      }

      // Add files
      request.files.addAll(files);

      // Send request
      final response = await request.send().timeout(timeout).then(http.Response.fromStream);

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
    required String endpoint,
    required String savePath,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    required Function(File)? onSuccess,
    required Function(http.Response)? onError,
    required Function(dynamic)? onException,
  }) async {
    try {
      final uri = _buildUri(endpoint, queryParams);
      final request = http.Request('GET', uri);
      request.headers.addAll({...defaultHeaders, ...?headers});

      final response = await _client.send(request).timeout(timeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final file = File(savePath);
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
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool cacheResponse = false,
    required Function(http.Response)? onSuccess,
    required Function(http.Response)? onError,
    required Function(dynamic)? onException,
  }) async {
    return request(
      method: 'GET',
      endpoint: endpoint,
      headers: headers,
      queryParams: queryParams,
      cacheResponse: cacheResponse,
      onSuccess: onSuccess,
      onError: onError,
      onException: onException,
    );
  }

  Future<void> post(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    dynamic body,
    bool cacheResponse = false,
    required Function(http.Response)? onSuccess,
    required Function(http.Response)? onError,
    required Function(dynamic)? onException,
  }) async {
    return request(
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
  }

  Future<void> put(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    dynamic body,
    bool cacheResponse = false,
    required Function(http.Response)? onSuccess,
    required Function(http.Response)? onError,
    required Function(dynamic)? onException,
  }) async {
    return request(
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
  }

  Future<void> delete(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    bool cacheResponse = false,
    required Function(http.Response)? onSuccess,
    required Function(http.Response)? onError,
    required Function(dynamic)? onException,
  }) async {
    return request(
      method: 'DELETE',
      endpoint: endpoint,
      headers: headers,
      queryParams: queryParams,
      cacheResponse: cacheResponse,
      onSuccess: onSuccess,
      onError: onError,
      onException: onException,
    );
  }

  // Cache management
  void clearCache() {
    _cache.clear();
  }

  void removeFromCache(String method, String endpoint, [dynamic body]) {
    final key = _buildCacheKey(method, endpoint, null, body);
    _cache.remove(key);
  }

  // Helper methods
  Uri _buildUri(String endpoint, Map<String, dynamic>? queryParams) {
    final uri = baseUrl != null ? Uri.parse('$baseUrl$endpoint') : Uri.parse(endpoint);

    if (queryParams != null) {
      return uri.replace(queryParameters: queryParams.map((key, value) => MapEntry(key, value?.toString() ?? '')));
    }

    return uri;
  }

  String _buildCacheKey(String method, String endpoint, Map<String, dynamic>? queryParams, dynamic body) {
    final uri = _buildUri(endpoint, queryParams).toString();
    final bodyKey = body != null ? jsonEncode(body) : 'null';
    return '$method:$uri:$bodyKey';
  }

  // JSON decoding helpers
  static Map<String, dynamic> decodeJson(http.Response response) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  static List<dynamic> decodeJsonArray(http.Response response) {
    return jsonDecode(response.body) as List<dynamic>;
  }

  // File upload helper
  static Future<http.MultipartFile> multipartFileFromFile(
    String fieldName,
    File file, {
    String? filename,
    MediaType? contentType,
  }) async {
    filename ??= file.path.split('/').last;
    final stream = file.openRead();
    final length = await file.length();
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
  final http.Response response;
  final DateTime timestamp;

  CacheEntry(this.response, this.timestamp);
}
