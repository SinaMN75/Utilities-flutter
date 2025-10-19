part of "../data.dart";

class MediaService {
  MediaService({
    required this.apiKey,
    required this.token,
  });

  final String? token;
  final String apiKey;

  Future<void> create({
    required final UMediaCreateParams p,
    required final Function(UResponse<UMediaResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) async {
    final List<MultipartFile> files = <MultipartFile>[
      await UHttpClient.multipartFileFromFile(
        "File",
        p.file,
        filename: p.file.path.split("/").last,
      ),
    ];

    await UHttpClient.upload(
      endpoint: "/Media/Create",
      files: files,
      fields: p.toMap()..addAll(<String, dynamic>{"apiKey": apiKey, "token": token}),
      onSuccess: (final Response r) => onOk(
        UResponse<UMediaResponse>.fromJson(
          r.body,
          (dynamic i) => UMediaResponse.fromMap(i),
        ),
      ),
      onError: (final Response r) => onError(
        UResponse<dynamic>.fromJson(r.body, (dynamic i) => i),
      ),
      onException: (final dynamic e) {
        if (onException != null) onException(e);
      },
    );
  }

  void read({
    required final UMediaReadParams p,
    required final Function(UResponse<List<UMediaResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/Media/Read",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(
          UResponse<List<UMediaResponse>>.fromJson(
            r.body,
            (dynamic i) => List<UMediaResponse>.from(
              (i as List<dynamic>).map((dynamic x) => UMediaResponse.fromMap(x)),
            ),
          ),
        ),
        onError: (final Response r) => onError(
          UResponse<dynamic>.fromJson(r.body, (dynamic i) => i),
        ),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void update({
    required final UMediaUpdateParams p,
    required final Function(UResponse<UMediaResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/Media/Update",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(
          UResponse<UMediaResponse>.fromJson(
            r.body,
            (dynamic i) => UMediaResponse.fromMap(i),
          ),
        ),
        onError: (final Response r) => onError(
          UResponse<dynamic>.fromJson(r.body, (dynamic i) => i),
        ),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void delete({
    required final UIdParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/Media/Delete",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(
          UResponse<dynamic>.fromJson(r.body, (dynamic i) => i),
        ),
        onError: (final Response r) => onError(
          UResponse<dynamic>.fromJson(r.body, (dynamic i) => i),
        ),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
