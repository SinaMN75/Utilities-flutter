part of '../data.dart';

class UserDataSource {
  final String baseUrl;

  UserDataSource({required this.baseUrl});

  void create({
    required final RegisterDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/Register",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void toggleBlock({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/ToggleBlock/$id",
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readMyBlockList({
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/user/ReadMyBlockList",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void update({
    required final UserCreateUpdateDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/user",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void read({
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/user",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void logout({
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/user/Logout",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readById({
    required final String id,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/user/$id",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/user/$id",
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void deleteFromTeam({
    required final String teamId,
    required final VoidCallback onResponse,
    required final VoidCallback onError,
    final Function(String error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/user/DeleteFromTeam/$teamId",
        action: (final Response response) => onResponse(),
        error: (final Response response) => onError(),
      );

  void getVerificationCodeForLogin({
    required final GetMobileVerificationCodeForLoginDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/GetVerificationCodeForLogin",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void loginWithEmail({
    required final LoginWithEmail dto,
    required final Function(GenericResponse<String> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/LoginWithEmail",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void loginWithPassword({
    required final LoginWithPasswordDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/LoginWithPassword",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void verifyCodeForLogin({
    required final VerifyMobileForLoginDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/VerifyCodeForLogin",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void getGrowthRate({
    required final Function(GenericResponse<GrowthRateReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/user/GrowthRate",
        action: (final Response response) => onResponse(GenericResponse<GrowthRateReadDto>.fromJson(response.body, fromMap: GrowthRateReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void getProfileByUserName({
    required final String userName,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/user/GetProfileByUsername/$userName",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void filter({
    required final UserFilterDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/Filter",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void authenticate({
    required final AuthenticateDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/authenticate",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void getTokenForTest({
    required final String mobile,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/user/GetTokenForTest/$mobile",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
