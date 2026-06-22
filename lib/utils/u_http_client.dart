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

  static Future<MultipartFile> multipartFileFromUint8List(final String fieldName,
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
  static final Map<String, CancelableOperation<String?>> _operations = <String, CancelableOperation<String?>>{};

  /// Downloads [url] directly to disk and returns the final file path.
  ///
  /// The bytes are streamed to [partPath] (a sibling ".part" file) and renamed
  /// to [savePath] once the download completes. The file is never loaded into
  /// memory, so this works for files of any size (including >1GB) where the
  /// previous Uint8List-based approach ran out of memory.
  static Future<String?> downloadFile({
    required String url,
    required String cacheKey,
    required String savePath,
    required String partPath,
    required void Function(int progress) onProgress,
  }) async {
    if (_operations.containsKey(cacheKey)) {
      await _operations[cacheKey]?.cancel();
    }

    final CancelableOperation<String?> op = CancelableOperation<String?>.fromFuture(
      _performDownload(url: url, savePath: savePath, partPath: partPath, onProgress: onProgress),
      onCancel: () => _operations.remove(cacheKey),
    );

    _operations[cacheKey] = op;

    try {
      final String? path = await op.value;
      _operations.remove(cacheKey);
      return path;
    } catch (e) {
      _operations.remove(cacheKey);
      rethrow;
    }
  }

  static Future<String> _performDownload({
    required String url,
    required String savePath,
    required String partPath,
    required void Function(int progress) onProgress,
  }) async {
    final File partFile = File(partPath);

    int downloadedBytes = 0;
    if (await partFile.exists()) {
      try {
        downloadedBytes = await partFile.length();
      } catch (e) {
        await _safeDelete(partFile);
        downloadedBytes = 0;
      }
    }

    for (int attempt = 1; attempt <= _maxRetries; attempt++) {
      final Client client = Client();

      try {
        final Map<String, String> headers = <String, String>{
          "User-Agent": "Dart/2.0 (Windows)",
        };

        if (downloadedBytes > 0) {
          headers["Range"] = "bytes=$downloadedBytes-";
        }

        final Request request = Request("GET", Uri.parse(url))..headers.addAll(headers);

        final StreamedResponse response = await client
            .send(request)
            .timeout(
              const Duration(seconds: 60),
              onTimeout: () {
                throw TimeoutException("Connection timeout on attempt $attempt");
              },
            );

        // Range already fully satisfied: the partial file is complete.
        if (response.statusCode == 416) {
          if (await partFile.exists() && downloadedBytes > 0) {
            return await _finalize(partFile, savePath);
          } else {
            await _safeDelete(partFile);
            downloadedBytes = 0;
            continue;
          }
        }

        if (response.statusCode != 200 && response.statusCode != 206) {
          throw Exception("Bad status: ${response.statusCode}");
        }

        // Server ignored our Range and is sending the whole file again: start over.
        if (response.statusCode == 200 && downloadedBytes > 0) {
          await _safeDelete(partFile);
          downloadedBytes = 0;
          headers.remove("Range");
        }

        final int? totalBytes = response.contentLength != null ? response.contentLength! + downloadedBytes : null;

        IOSink? sink;
        try {
          sink = partFile.openWrite(mode: FileMode.append);
        } catch (e) {
          await _safeDelete(partFile);
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

            // Flush periodically so memory stays flat regardless of file size.
            if (chunkCounter % 50 == 0) {
              await sink.flush();
            }

            if (totalBytes != null) {
              final int p = (received / totalBytes * 100).clamp(0, 100).round();
              onProgress(p);
            }
          } catch (e) {
            await sink.close();
            await _safeDelete(partFile);
            throw Exception("Write error on chunk $chunkCounter: $e");
          }
        }

        await sink.flush();
        await sink.close();
        client.close();

        final int finalSize = await partFile.length();
        if (totalBytes != null && finalSize != totalBytes) {
          throw Exception("Download incomplete: $finalSize/$totalBytes bytes");
        }

        return await _finalize(partFile, savePath);
      } catch (e) {
        client.close();

        if (attempt == _maxRetries) {
          rethrow;
        }

        await Future<void>.delayed(Duration(seconds: attempt * 3));

        if (e.toString().contains("416") || e is TimeoutException) {
          await _safeDelete(partFile);
          downloadedBytes = 0;
        }
      }
    }

    throw Exception("Failed to download after $_maxRetries retries");
  }

  /// Atomically moves the completed [partFile] to [savePath] (a rename within
  /// the same directory, so no large copy happens). Returns the final path.
  static Future<String> _finalize(File partFile, String savePath) async {
    final File target = File(savePath);
    // Remove any stale target first (Windows can't rename onto an existing file).
    await _safeDelete(target);
    for (int i = 0; i < 5; i++) {
      try {
        await partFile.rename(savePath);
        return savePath;
      } catch (e) {
        if (i == 4) {
          // Fallback to copy+delete if rename is blocked (e.g. cross-volume).
          await partFile.copy(savePath);
          await _safeDelete(partFile);
          return savePath;
        }
        await Future<void>.delayed(Duration(milliseconds: 150 * (i + 1)));
      }
    }
    return savePath;
  }

  static Future<void> _safeDelete(File file) async {
    for (int i = 0; i < 5; i++) {
      try {
        if (!await file.exists()) return;
        await file.delete();
        return;
      } catch (e) {
        if (i == 4) return;
        await Future<void>.delayed(Duration(milliseconds: 150 * (i + 1)));
      }
    }
  }

  static bool isDownloading(String cacheKey) => _operations.containsKey(cacheKey);

  static void cancelDownload(String cacheKey) {
    if (_operations.containsKey(cacheKey)) {
      _operations[cacheKey]?.cancel();
      _operations.remove(cacheKey);
    }
  }
}
