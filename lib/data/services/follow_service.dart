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
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/follow/Follow",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void unfollow({
    required final UFollowParams p,
    required final Function(UResponse<dynamic> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/follow/Unfollow",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readFollowers({
    required final UIdParams p,
    required final Function(UResponse<List<UUserResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/follow/ReadFollowers",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(
          UResponse<List<UUserResponse>>.fromJson(
            r,
            (final dynamic i) => List<UUserResponse>.from((i as List<dynamic>).map((final dynamic x) => UUserResponse.fromMap(x))),
          ),
        ),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readFollowedUsers({
    required final UIdParams p,
    required final Function(UResponse<List<UUserResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/follow/ReadFollowedUsers",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(
          UResponse<List<UUserResponse>>.fromJson(
            r,
            (final dynamic i) => List<UUserResponse>.from((i as List<dynamic>).map((final dynamic x) => UUserResponse.fromMap(x))),
          ),
        ),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readFollowedProducts({
    required final UIdParams p,
    required final Function(UResponse<List<UProductResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/follow/ReadFollowedProducts",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(
          UResponse<List<UProductResponse>>.fromJson(
            r,
            (final dynamic i) => List<UProductResponse>.from((i as List<dynamic>).map((final dynamic x) => UProductResponse.fromMap(x))),
          ),
        ),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readFollowedCategories({
    required final UIdParams p,
    required final Function(UResponse<List<UCategoryResponse>> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/follow/ReadFollowedCategories",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(
          UResponse<List<UCategoryResponse>>.fromJson(
            r,
            (final dynamic i) => List<UCategoryResponse>.from((i as List<dynamic>).map((final dynamic x) => UCategoryResponse.fromMap(x))),
          ),
        ),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void readFollowerFollowingCount({
    required final UIdParams p,
    required final Function(UResponse<UFollowerFollowingCountResponse> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/follow/ReadFollowerFollowingCount",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<UFollowerFollowingCountResponse>.fromJson(r, (final dynamic i) => UFollowerFollowingCountResponse.fromMap(i))),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void isFollowingUser({
    required final UFollowParams p,
    required final Function(UResponse<bool> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/follow/IsFollowingUser",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<bool>.fromJson(r, (final dynamic i) => i)),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void isFollowingProduct({
    required final UFollowParams p,
    required final Function(UResponse<bool> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/follow/isFollowingProduct",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<bool>.fromJson(r, (final dynamic i) => i)),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );

  void isFollowingCategory({
    required final UFollowParams p,
    required final Function(UResponse<bool> r) onOk,
    required final Function(UResponse<dynamic> e) onError,
    final Function(Exception)? onException,
  }) =>
      UHttpClient.post(
        "/follow/isFollowingCategory",
        body: p.toMap().add("apiKey", apiKey).add("token", token),
        onSuccess: (final String r) => onOk(UResponse<bool>.fromJson(r, (final dynamic i) => i)),
        onError: (final String r) => onError(UResponse<dynamic>.fromJson(r, (final dynamic i) => i)),
        onException: (final dynamic e) {
          if (onException != null) onException(e);
        },
      );
}
