part of '../data.dart';

class UserDataSource {
  UserDataSource({required this.baseUrl, required this.apiKey});

  final String baseUrl;
  final String apiKey;

  void create({
    required final UserCreateUpdateDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void toggleBlock({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/ToggleBlock/$id",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void readMyBlockList({
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/user/ReadMyBlockList",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void update({
    required final UserCreateUpdateDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/user",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void read({
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/user",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void logout({
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/user/Logout",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/user/$id",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void delete({
    required final String id,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/user/$id",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void transferWalletToWallet({
    required final String fromUserId,
    required final String toUserId,
    required final String amount,
    required final VoidCallback onResponse,
    required final VoidCallback onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/TransferWalletToWallet",
        apiKey: apiKey,
        body: <String, dynamic>{
          "fromUserId": fromUserId,
          "toUserId": toUserId,
          "amount": amount,
        },
        encodeBody: false,
        action: (final Response<dynamic> response) => onResponse(),
        error: (final Response<dynamic> response) => onError(),
        failure: failure,
      );

  void deleteFromTeam({
    required final String teamId,
    required final VoidCallback onResponse,
    required final VoidCallback onError,
    final Function(dynamic error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/user/DeleteFromTeam/$teamId",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(),
        error: (final Response<dynamic> response) => onError(),
      );

  void getVerificationCodeForLogin({
    required final GetMobileVerificationCodeForLoginDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/GetVerificationCodeForLogin",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  // void loginWithEmail({
  //   required final LoginWithEmail dto,
  //   required final Function(GenericResponse<String> response) onResponse,
  //   required final Function(GenericResponse<dynamic> errorResponse) onError,
  //   final Function(dynamic error)? failure,
  // }) =>
  //     httpPost(
  //       url: "$baseUrl/user/LoginWithEmail",
  //       body: dto,
  //       action: (final Response<dynamic> response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
  //       error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
  //     );

  void loginWithPassword({
    required final LoginWithPasswordDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/LoginWithPassword",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void verifyCodeForLogin({
    required final VerifyMobileForLoginDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/VerifyCodeForLogin",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void getGrowthRate({
    required final Function(GenericResponse<GrowthRateReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/user/GrowthRate",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<GrowthRateReadDto>.fromJson(response.body, fromMap: GrowthRateReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void getProfileByUserName({
    required final String userName,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/user/GetProfileByUsername/$userName",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  Future<void> filter({
    required final UserFilterDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    final Function(dynamic error)? failure,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
  }) =>
      httpPost(
        url: "$baseUrl/user/Filter",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void authenticate({
    required final AuthenticateDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/authenticate",
        apiKey: apiKey,
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void getTokenForTest({
    required final String mobile,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/GetTokenForTest/$mobile",
        apiKey: apiKey,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );
}
