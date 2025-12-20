part of "../data.dart";

class ChatBotService {
  Future<UHttpClientResponse> create({
    required final UChatBotCreateParams p,
    final Function(UResponse<UChatBotResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/ChatBot/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UChatBotResponse>.fromJson(r.body, (final dynamic i) => UChatBotResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> read({
    required final UChatBotReadParams p,
    final Function(UResponse<List<UChatBotResponse>> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/ChatBot/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<List<UChatBotResponse>>.fromJson(
        r.body,
        (final dynamic i) => List<UChatBotResponse>.from((i as List<dynamic>).map((final dynamic x) => UChatBotResponse.fromMap(x))),
      ),
    ),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );
}
