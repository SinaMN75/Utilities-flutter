import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/user.dart';
import 'package:utilities/utils/http_interceptor.dart';

class UserDataSource {
  final String baseUrl;

  UserDataSource({required this.baseUrl});

  Future<void> create({
    required final UserCreateUpdateDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/user/Register",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> update({
    required final UserCreateUpdateDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/user",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> read({
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/user",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> logout({
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/user/Logout",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/user/$id",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/user/$id",
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> deleteFromTeam({
    required final String teamId,
    required final VoidCallback onResponse,
    required final VoidCallback onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/user/DeleteFromTeam/$teamId",
        action: (final Response response) => onResponse(),
        error: (final Response response) => onError(),
      );

  Future<void> getVerificationCodeForLogin({
    required final GetMobileVerificationCodeForLoginDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/user/GetVerificationCodeForLogin",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> loginWithEmail({
    required final LoginWithEmail dto,
    required final Function(GenericResponse<String> response) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/user/LoginWithEmail",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> loginWithPassword({
    required final LoginWithPassword dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/user/LoginWithPassword",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> verifyCodeForLogin({
    required final VerifyMobileForLoginDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/user/VerifyCodeForLogin",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> getGrowthRate({
    required final Function(GenericResponse<GrowthRateReadDto> response) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/user/GrowthRate",
        action: (final Response response) => onResponse(GenericResponse<GrowthRateReadDto>.fromJson(response.body, fromMap: GrowthRateReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> getProfileByUserName({
    required final String userName,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/user/GetProfileByUsername/$userName",
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> filter({
    required final UserFilterDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/user/Filter",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> authenticate({
    required final AuthenticateDto dto,
    required final Function(GenericResponse<UserReadDto> response) onResponse,
    required final Function(GenericResponse errorerrorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/user/authenticate",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<UserReadDto>.fromJson(response.body, fromMap: UserReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
