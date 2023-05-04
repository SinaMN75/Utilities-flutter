import 'package:dio/dio.dart';
import 'package:utilities/data/dto/app_settings.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/location.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class AppSettingsDataSource {
  final String baseUrl;

  AppSettingsDataSource({required this.baseUrl});

  Future<void> readAppSettings({
    required final String url,
    required final Function(GenericResponse<AppSettingsDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings",
        action: (Response<dynamic> response) => onResponse(GenericResponse<AppSettingsDto>.fromJson(response.data, fromMap: AppSettingsDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data, fromMap: AppSettingsDto.fromMap)),
        failure: failure,
      );

  Future<void> readLocation({
    required final String url,
    required final Function(GenericResponse<LocationReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings/ReadLocation",
        action: (Response response) => onResponse(GenericResponse<LocationReadDto>.fromJson(response.data, fromMap: LocationReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data, fromMap: AppSettingsDto.fromMap)),
        failure: failure,
      );
}
