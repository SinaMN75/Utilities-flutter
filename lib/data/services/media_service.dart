part of "../data.dart";

class MediaService {
  Future<void> create({
    required final UMediaCreateParams p,
    required final Function(UResponse<String> r)? onOk,
    required final Function(UEmptyResponse e) onError,
    required final Function(String e) onException,
  }) async {
    final List<MultipartFile> files = <MultipartFile>[
      if (p.file.path != null) await UHttpClient.multipartFileFromFile("File", File(p.file.path!), filename: p.file.path!.split("${U.baseUrl}/").last),
      if (p.file.bytes != null) await UHttpClient.multipartFileFromFile("File", File(p.file.path!), filename: p.file.path!.split("${U.baseUrl}/").last),
    ];

    await UHttpClient.upload(
      endpoint: "${U.baseUrl}/Media/Create",
      files: files,
      fields: p.toMap()..addAll(<String, dynamic>{"apiKey": U.apiKey, "token": ULocalStorage.getToken()}),
      onSuccess: (final Response r) => onOk?.call(UResponse<String>.fromJson(r.body, (final dynamic i) => i)),
      onError: (final Response r) => onError(UEmptyResponse.fromJson(r.body)),
      onException: () => onException(""),
    );
  }

  Future<UHttpClientResponse> read({
    required final UMediaReadParams p,
    required final Function(UResponse<List<UMediaResponse>> r) onOk,
    required final Function(UEmptyResponse e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Media/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk(UResponse<List<UMediaResponse>>.fromJson(r.body, (dynamic i) => List<UMediaResponse>.from((i as List<dynamic>).map((dynamic x) => UMediaResponse.fromMap(x))))),
    onError: (final Response r) => onError(UEmptyResponse.fromJson(r.body)),
    onException: onException,
  );

  Future<UHttpClientResponse> update({
    required final UMediaUpdateParams p,
    required final Function(UEmptyResponse r) onOk,
    required final Function(UEmptyResponse e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Media/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError(UEmptyResponse.fromJson(r.body)),
    onException: onException,
  );

  Future<UHttpClientResponse> delete({
    required final UIdParams p,
    required final Function(UEmptyResponse r) onOk,
    required final Function(UEmptyResponse e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Media/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError(UEmptyResponse.fromJson(r.body)),
    onException: onException,
  );

  Future<UHttpClientResponse> deleteRange({
    required final UIdListParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Media/DeleteRange",
    body: p.toIdListMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );
}
