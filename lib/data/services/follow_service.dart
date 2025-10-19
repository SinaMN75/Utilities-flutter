part of "../data.dart";

class FollowService {
  FollowService({
    required this.apiKey,
    required this.token,
  });

  final String? token;
  final String apiKey;

  void follow({
    required final UFollowParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "/follow/Follow",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void unfollow({
    required final UFollowParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "/follow/Unfollow",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void readFollowers({
    required final UIdParams p,
    required final Function(UResponse<List<UUserResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "/follow/ReadFollowers",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(
          UResponse<List<UUserResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<UUserResponse>.from((i as List<dynamic>).map((final dynamic x) => UUserResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void readFollowedUsers({
    required final UIdParams p,
    required final Function(UResponse<List<UUserResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "/follow/ReadFollowedUsers",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(
          UResponse<List<UUserResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<UUserResponse>.from((i as List<dynamic>).map((final dynamic x) => UUserResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void readFollowedProducts({
    required final UIdParams p,
    required final Function(UResponse<List<UProductResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "/follow/ReadFollowedProducts",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(
          UResponse<List<UProductResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<UProductResponse>.from((i as List<dynamic>).map((final dynamic x) => UProductResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void readFollowedCategories({
    required final UIdParams p,
    required final Function(UResponse<List<UCategoryResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "/follow/ReadFollowedCategories",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(
          UResponse<List<UCategoryResponse>>.fromJson(
            r.body,
            (final dynamic i) => List<UCategoryResponse>.from((i as List<dynamic>).map((final dynamic x) => UCategoryResponse.fromMap(x))),
          ),
        ),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void readFollowerFollowingCount({
    required final UIdParams p,
    required final Function(UResponse<UFollowerFollowingCountResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "/follow/ReadFollowerFollowingCount",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<UFollowerFollowingCountResponse>.fromJson(r.body, (final dynamic i) => UFollowerFollowingCountResponse.fromMap(i))),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void isFollowingUser({
    required final UFollowParams p,
    required final Function(UResponse<bool> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "/follow/IsFollowingUser",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<bool>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void isFollowingProduct({
    required final UFollowParams p,
    required final Function(UResponse<bool> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "/follow/isFollowingProduct",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<bool>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );

  void isFollowingCategory({
    required final UFollowParams p,
    required final Function(UResponse<bool> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final VoidCallback? onException,
  }) =>
      UHttpClient.post(
        "/follow/isFollowingCategory",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final Response r) => onOk(UResponse<bool>.fromJson(r.body, (final dynamic i) => i)),
        onError: (final Response r) => onError(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
        onException: () => onException?.call(),
      );
}
