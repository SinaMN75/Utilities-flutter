import "dart:developer" as developer;

import "package:u/utilities.dart";

enum URequestBodyType { json, formData }

abstract class UHttpClient {
  static final Client _client = Client();

  static Future<Response?> send({
    required String method,
    required String endpoint,
    required void Function(Response api, Response? cached) onSuccess,
    required Function(Response) onError,
    required Function(String) onException,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    dynamic body,
    URequestBodyType bodyType = URequestBodyType.json,
    String noNetworkMessage = "Connection to Network was Not possible",
    String unexpectedErrorMessage = "Unexpected Error, Please try again",
  }) async {
    final bool hasNetworkConnection = await UNetwork.hasNetworkConnection();

    if (!hasNetworkConnection) {
      onException(noNetworkMessage);
      return null;
    }

    Response? cachedResponse;

    try {
      final Uri uri = _buildUri(endpoint, queryParams);
      final String cacheKey = "cache_${uri.toString().replaceAll(RegExp(r'[^\w]'), '_')}";

      final String? cachedBody = ULocalStorage.getString(cacheKey);
      if (cachedBody != null) {
        cachedResponse = Response(
          cachedBody,
          200,
          request: Request(method, uri)..headers["X-From-Cache"] = "1",
        );
      }

      final Request request = Request(method, uri);
      if (headers != null) request.headers.addAll(headers);
      request.headers["Locale"] = UApp.locale();

      String? encodedBody;

      if (body != null) {
        if (bodyType == URequestBodyType.json) {
          if (body is Map) {
            encodedBody = jsonEncode(removeNullEntries(body));
            request.body = encodedBody;
            request.headers["Content-Type"] = "application/json";
          } else if (body is String) {
            encodedBody = body;
            request.body = body;
          } else if (body is List<int>) {
            request.bodyBytes = body;
          }
        } else if (bodyType == URequestBodyType.formData && body is Map<String, dynamic>) {
          final Map<String, String> formFields = <String, String>{};
          body.forEach((String key, dynamic value) {
            if (value != null) formFields[key] = value.toString();
          });

          request.bodyFields = formFields;
          request.headers["Content-Type"] = "application/x-www-form-urlencoded";
        }
      }

      final StreamedResponse streamed = await _client.send(request).timeout(const Duration(seconds: 30));

      final Response apiResponse = await Response.fromStream(streamed);

      final bool ok = apiResponse.statusCode >= 200 && apiResponse.statusCode <= 299;
      if (ok) {
        ULocalStorage.set(cacheKey, apiResponse.body);
        onSuccess(apiResponse, cachedResponse);
      } else {
        onError(apiResponse);
      }

      return apiResponse;
    } catch (e, stack) {
      onException(unexpectedErrorMessage);
      developer.log(e.toString(), stackTrace: stack);
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

extension HTTP on Response? {
  bool isSuccessful() => (this?.statusCode ?? 999) >= 200 && (this?.statusCode ?? 999) <= 299 || false;

  bool isServerError() => (this?.statusCode ?? 999) >= 500 && (this?.statusCode ?? 999) <= 599 || false;

  void prettyLog({final String params = ""}) {
    developer.log(
      "${this?.request?.method} - ${this?.request?.url} - ${this?.statusCode} \nPARAMS: $params \nRESPONSE: ${this?.body}",
    );
  }
}

class UDownload {
  static const int _maxRetries = 10;
  static final Map<String, CancelableOperation<Uint8List>> _operations = <String, CancelableOperation<Uint8List>>{};

  static Future<Uint8List?> downloadFile({
    required String url,
    required String cacheKey,
    required void Function(int progress) onProgress,
  }) async {
    if (_operations.containsKey(cacheKey)) {
      await _operations[cacheKey]?.cancel();
    }

    final CancelableOperation<Uint8List> op = CancelableOperation<Uint8List>.fromFuture(
      _performDownload(url: url, cacheKey: cacheKey, onProgress: onProgress),
      onCancel: () => _operations.remove(cacheKey),
    );

    _operations[cacheKey] = op;

    try {
      final Uint8List data = await op.value;
      _operations.remove(cacheKey);
      return data;
    } catch (e) {
      _operations.remove(cacheKey);
      rethrow;
    }
  }

  static Future<Uint8List> _performDownload({
    required String url,
    required String cacheKey,
    required void Function(int progress) onProgress,
  }) async {
    final Directory dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/$cacheKey.tmp");

    int downloadedBytes = 0;
    if (await file.exists()) {
      downloadedBytes = await file.length();
    }

    for (int attempt = 1; attempt <= _maxRetries; attempt++) {
      final Client client = Client();

      try {
        final Map<String, String> headers = <String, String>{};

        if (downloadedBytes > 0) {
          headers["Range"] = "bytes=$downloadedBytes-";
        }

        final Request request = Request("GET", Uri.parse(url))..headers.addAll(headers);

        final StreamedResponse response = await client.send(request);

        if (response.statusCode != 200 && response.statusCode != 206) {
          throw Exception("Bad status: ${response.statusCode}");
        }

        final int? totalBytes = response.contentLength != null ? response.contentLength! + downloadedBytes : null;

        final IOSink sink = file.openWrite(mode: FileMode.append);

        int received = downloadedBytes;

        await for (final List<int> chunk in response.stream) {
          sink.add(chunk);
          received += chunk.length;

          if (totalBytes != null) {
            final int p = (received / totalBytes * 100).clamp(0, 100).round();
            onProgress(p);
          }
        }

        await sink.close();
        return await file.readAsBytes();
      } catch (e) {
        await Future<void>.delayed(Duration(seconds: attempt));
      } finally {
        client.close();
      }
    }

    throw Exception("Failed to download after $_maxRetries retries");
  }

  static bool isDownloading(String cacheKey) => _operations.containsKey(cacheKey);

  static void cancelDownload(String cacheKey) {
    if (_operations.containsKey(cacheKey)) {
      _operations[cacheKey]?.cancel();
      _operations.remove(cacheKey);
    }
  }
}
