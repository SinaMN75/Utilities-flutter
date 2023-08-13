import 'package:dio/dio.dart';
import 'package:utilities/data/dto/app_settings.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/location.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class AppSettingsDataSource {
  AppSettingsDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> readAppSettings({
    required final Function(GenericResponse<AppSettingsDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AppSettingsDto>.fromJson(response.data, fromMap: AppSettingsDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.data, fromMap: AppSettingsDto.fromMap)),
        failure: failure,
      );

  Future<void> readLocation({
    required final Function(GenericResponse<LocationReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings/ReadLocation",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<LocationReadDto>.fromJson(response.data, fromMap: LocationReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.data, fromMap: AppSettingsDto.fromMap)),
        failure: failure,
      );
}
