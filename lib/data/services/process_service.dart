part of "../data.dart";

class ProcessService {
  Future<UHttpClientResponse> get({
    required final String processId,
    final Function(UResponse<UProcessStepGet> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/process/Get",
    body: <String, dynamic>{
      "id": processId,
      "apiKey": U.apiKey,
      "token": ULocalStorage.getToken(),
    },
    onSuccess: (final Response r) => onOk?.call(UResponse<UProcessStepGet>.fromJson(r.body, (dynamic i) => UProcessStepGet.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> send({
    required final UProcessStepSend p,
    final Function(UResponse<UProcessStepGet> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/process/Send",
    body: <String, dynamic>{
      ...p.toMap(),
      "apiKey": U.apiKey,
      "token": ULocalStorage.getToken(),
    },
    onSuccess: (final Response r) => onOk?.call(UResponse<UProcessStepGet>.fromJson(r.body, (dynamic i) => UProcessStepGet.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );
}
