part of '../data.dart';

class AppSettingsDataSource {
  AppSettingsDataSource({required this.baseUrl});

  final String baseUrl;

  void readAppSettings({
    required final Function(GenericResponse<AppSettingsReadDto> response) onResponse,
    required final VoidCallback onError,
    final int timeoutInSeconds = 10,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        timeout: Duration(seconds: timeoutInSeconds),
        url: "$baseUrl/AppSettings",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AppSettingsReadDto>.fromJson(response.body, fromMap: AppSettingsReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(),
      );

  void readEverything({
    final bool? showProducts = true,
    final bool? showCategories = true,
    final bool? showContents = true,
    required final Function(GenericResponse<ReadEverythingDto> response) onResponse,
    required final VoidCallback onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/AppSettings/ReadEverything?showProducts=$showProducts&showCategories=$showCategories&showContents=$showContents",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<ReadEverythingDto>.fromJson(response.body, fromMap: ReadEverythingDto.fromMap)),
        error: (final Response<dynamic> response) => onError(),
      );

  void readDashboardData({
    required final Function(GenericResponse<DashboardDataReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/AppSettings/ReadDashboardData",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<DashboardDataReadDto>.fromJson(response.body, fromMap: DashboardDataReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body, fromMap: AppSettingsReadDto.fromMap)),
      );
}
