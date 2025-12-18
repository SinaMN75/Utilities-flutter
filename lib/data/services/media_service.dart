part of "../data.dart";

class MediaService {
  Future<void> create({
    required final UMediaCreateParams p,
    required final Function(UResponse<UMediaResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) async {
    final List<MultipartFile> files = <MultipartFile>[
      await UHttpClient.multipartFileFromFile("File", p.file, filename: p.file.path.split("${U.baseUrl}/").last),
    ];

    await UHttpClient.upload(
      endpoint: "${U.baseUrl}/Media/Create",
      files: files,
      fields: p.toMap()..addAll(<String, dynamic>{"apiKey": U.apiKey, "token": ULocalStorage.getToken()}),
      onSuccess: (final Response r) => onOk(UResponse<UMediaResponse>.fromJson(r.body, (dynamic i) => UMediaResponse.fromMap(i))),
      onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (dynamic i) => i)),
      onException: () => onException(""),
    );
  }

  Future<UHttpClientResponse> read({
    required final UMediaReadParams p,
    required final Function(UResponse<List<UMediaResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Media/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<List<UMediaResponse>>.fromJson(r.body, (dynamic i) => List<UMediaResponse>.from((i as List<dynamic>).map((dynamic x) => UMediaResponse.fromMap(x))))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> update({
    required final UMediaUpdateParams p,
    required final Function(UResponse<UMediaResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Media/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<UMediaResponse>.fromJson(r.body, (dynamic i) => UMediaResponse.fromMap(i))),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (dynamic i) => i)),
    onException: onException,
  );

  Future<UHttpClientResponse> delete({
    required final UIdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    required final Function(String e) onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Media/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (dynamic i) => i)),
    onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (dynamic i) => i)),
    onException: onException,
  );
}
