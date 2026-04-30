part of "../data.dart";

class AuthService {
  Future<UHttpClientResponse> register({
    required final URegisterParams p,
    final Function(UResponse<ULoginResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/auth/Register",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) {
      final UResponse<ULoginResponse> response = UResponse<ULoginResponse>.fromJson(r.body, (final dynamic i) => ULoginResponse.fromMap(i));
      ULocalStorage.setUserId(response.result!.user.id);
      ULocalStorage.setToken(response.result!.token);
      return onOk?.call(response);
    },
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> login({
    required final ULoginParams p,
    final Function(UResponse<ULoginResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/auth/Login",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) {
      final UResponse<ULoginResponse> response = UResponse<ULoginResponse>.fromJson(r.body, (final dynamic i) => ULoginResponse.fromMap(i));
      ULocalStorage.setUserId(response.result!.user.id);
      ULocalStorage.setToken(response.result!.token);
      return onOk?.call(response);
    },
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> getVerificationCodeForLogin({
    required final UGetMobileVerificationCodeForLoginParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/auth/GetVerificationCodeForLogin",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> verifyCodeForLogin({
    required final UVerifyMobileForLoginParams p,
    final Function(UResponse<ULoginResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/auth/VerifyCodeForLogin",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) {
      final UResponse<ULoginResponse> response = UResponse<ULoginResponse>.fromJson(r.body, (final dynamic i) => ULoginResponse.fromMap(i));
      ULocalStorage.setUserId(response.result!.user.id);
      ULocalStorage.setToken(response.result!.token);
      return onOk?.call(response);
    },
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> completeProfile({
    required final UCompleteProfileParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/auth/CompleteProfile",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );
}
