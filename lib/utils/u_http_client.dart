import "dart:developer" as developer;

import "package:u/utilities.dart";

enum URequestBodyType { json, formData }

class UHttpClientResponse {
  final String? response;
  final String? error;
  final String? exception;

  UHttpClientResponse({this.response, this.error, this.exception});

  bool get isSuccessful => response != null;

  bool get isError => error != null;

  bool get isException => exception != null;
}

abstract class UHttpClient {
  static final Client _client = Client();

  static Future<UHttpClientResponse> send({
    required final String method,
    required final String endpoint,
    required final Function(Response) onSuccess,
    required final Function(Response) onError,
    required final Function(String) onException,
    final Map<String, String>? headers,
    final Map<String, dynamic>? queryParams,
    final dynamic body,
    final URequestBodyType bodyType = URequestBodyType.json,
    final String? noNetworkMessage,
    final String? unexpectedErrorMessage,
    final bool offline = false,
    final int retryAmount = 3,
  }) async {
    // final bool hasNetworkConnection = await UNetwork.hasNetworkConnection();

    // if (!hasNetworkConnection && offline == false) {
    //   onException(U.s.connectionToNetworkWasNotPossible);
    //   return UHttpClientResponse(exception: U.s.connectionToNetworkWasNotPossible);
    // }
    // if (offline == false) {
    //   onException(U.s.connectionToNetworkWasNotPossible);
    //   return UHttpClientResponse(exception: U.s.connectionToNetworkWasNotPossible);
    // }
    try {
      final Uri uri = _buildUri(endpoint, queryParams);
      final String cacheKey = 'cache_${_buildUri(endpoint, queryParams).toString().replaceAll(RegExp(r'[^\w]'), '_')}';

      final String? cachedData = ULocalStorage.getString(cacheKey);
      if (offline && cachedData != null) {
        final Response response = Response(cachedData, 200, request: Request(method, uri));
        onSuccess(response);
        return UHttpClientResponse(response: cachedData);
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
        return UHttpClientResponse(response: response.body);
      } else {
        onError(response);
        return UHttpClientResponse(error: response.body);
      }
    } catch (e, stack) {
      developer.log(e.toString(), stackTrace: stack);
      if (retryAmount > 0) {
        return send(
          method: method,
          endpoint: endpoint,
          onSuccess: onSuccess,
          onError: onError,
          onException: onException,
          headers: headers,
          offline: offline,
          body: body,
          bodyType: bodyType,
          noNetworkMessage: noNetworkMessage,
          queryParams: queryParams,
          retryAmount: retryAmount - 1,
          unexpectedErrorMessage: unexpectedErrorMessage,
        );
      } else {
        onException(U.s.unexpectedErrorPleaseTryAgain);
        return UHttpClientResponse(exception: unexpectedErrorMessage);
      }
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
        request.fields.addAll(removeNullEntries(fields)!.map((String key, dynamic value) => MapEntry<String, String>(key, value is String ? value : jsonEncode(value))));
      }
      request.files.addAll(files);
      final Response response = await request.send().timeout(const Duration(seconds: 30)).then(Response.fromStream);
      response.prettyLog(params: jsonEncode(fields));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        onSuccess?.call(response);
      } else {
        onError?.call(response);
      }
    } catch (e, stack) {
      onException();
      developer.log(e.toString(), stackTrace: stack);
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

  static Future<MultipartFile> multipartFileFromUint8List(
    final String fieldName,
    final Uint8List bytes, {
    String? filename,
    final MediaType? contentType,
  }) async => MultipartFile.fromBytes(fieldName, bytes, contentType: contentType, filename: filename);

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
    if (kDebugMode) {
      developer.log(
        "${this?.request?.method} - ${this?.request?.url} - ${this?.statusCode} \nPARAMS: $params \nRESPONSE: ${this?.body}",
      );
    }
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

    // FIX 1: Use shorter filename for Windows (avoid path issues)
    final String safeCacheKey = _getSafeCacheKey(cacheKey);
    final File file = File("${dir.path}/$safeCacheKey.tmp");

    int downloadedBytes = 0;
    if (await file.exists()) {
      try {
        downloadedBytes = await file.length();
      } catch (e) {
        // FIX 2: Windows file lock issue - delete corrupted file
        await _safeDelete(file);
        downloadedBytes = 0;
      }
    }

    for (int attempt = 1; attempt <= _maxRetries; attempt++) {
      final Client client = Client();

      try {
        final Map<String, String> headers = <String, String>{
          "User-Agent": "Dart/2.0 (Windows)", // FIX 3: Add User-Agent for Windows
        };

        if (downloadedBytes > 0) {
          headers["Range"] = "bytes=$downloadedBytes-";
        }

        final Request request = Request("GET", Uri.parse(url))..headers.addAll(headers);

        // FIX 4: Add timeout for Windows connections
        final StreamedResponse response = await client
            .send(request)
            .timeout(
              const Duration(seconds: 60),
              onTimeout: () {
                throw TimeoutException("Connection timeout on attempt $attempt");
              },
            );

        if (response.statusCode == 416) {
          if (await file.exists() && downloadedBytes > 0) {
            return await _readFileWithRetry(file);
          } else {
            await _safeDelete(file);
            downloadedBytes = 0;
            continue;
          }
        }

        if (response.statusCode != 200 && response.statusCode != 206) {
          throw Exception("Bad status: ${response.statusCode}");
        }

        if (response.statusCode == 200 && downloadedBytes > 0) {
          await _safeDelete(file);
          downloadedBytes = 0;
          headers.remove("Range");
        }

        final int? totalBytes = response.contentLength != null ? response.contentLength! + downloadedBytes : null;

        // FIX 5: Use try-catch for file operations on Windows
        IOSink? sink;
        try {
          sink = file.openWrite(mode: FileMode.append);
        } catch (e) {
          await _safeDelete(file);
          downloadedBytes = 0;
          continue;
        }

        int received = downloadedBytes;
        int chunkCounter = 0;

        await for (final List<int> chunk in response.stream) {
          try {
            sink.add(chunk);
            received += chunk.length;
            chunkCounter++;

            // FIX 6: Flush periodically for Windows to avoid memory issues
            if (chunkCounter % 50 == 0) {
              await sink.flush();
            }

            if (totalBytes != null) {
              final int p = (received / totalBytes * 100).clamp(0, 100).round();
              onProgress(p);
            }
          } catch (e) {
            await sink.close();
            await _safeDelete(file);
            throw Exception("Write error on chunk $chunkCounter: $e");
          }
        }

        await sink.flush();
        await sink.close();
        client.close();

        final int finalSize = await file.length();
        if (totalBytes != null && finalSize != totalBytes) {
          throw Exception("Download incomplete: $finalSize/$totalBytes bytes");
        }

        return await _readFileWithRetry(file);
      } catch (e) {
        client.close();

        if (attempt == _maxRetries) {
          rethrow;
        }

        // FIX 7: Longer delay for Windows on retry
        await Future<void>.delayed(Duration(seconds: attempt * 3));

        if (e.toString().contains("416") || e.toString().contains("4") || e is TimeoutException) {
          await _safeDelete(file);
          downloadedBytes = 0;
        }
      }
    }

    throw Exception("Failed to download after $_maxRetries retries");
  }

  // FIX 8: Safe filename for Windows
  static String _getSafeCacheKey(String original) {
    if (!Platform.isWindows) return original;

    // Remove invalid Windows characters and limit length
    final String safe = original.replaceAll(RegExp(r'[<>:"/\\|?*]'), "_");
    return safe.length > 50 ? "${safe.substring(0, 45)}_${original.hashCode.abs()}" : safe;
  }

  // FIX 9: Safe file delete with retry for Windows
  static Future<void> _safeDelete(File file) async {
    if (!await file.exists()) return;

    for (int i = 0; i < 3; i++) {
      try {
        await file.delete();
        break;
      } catch (e) {
        if (i == 2) rethrow;
        await Future<void>.delayed(Duration(milliseconds: 100 * (i + 1)));
      }
    }
  }

  // FIX 10: Read file with retry for Windows file locks
  static Future<Uint8List> _readFileWithRetry(File file) async {
    for (int i = 0; i < 3; i++) {
      try {
        return await file.readAsBytes();
      } catch (e) {
        if (i == 2) rethrow;
        await Future<void>.delayed(Duration(milliseconds: 100 * (i + 1)));
      }
    }
    throw Exception("Could not read file");
  }

  static bool isDownloading(String cacheKey) => _operations.containsKey(cacheKey);

  static void cancelDownload(String cacheKey) {
    if (_operations.containsKey(cacheKey)) {
      _operations[cacheKey]?.cancel();
      _operations.remove(cacheKey);
    }
  }
}
