import 'package:get/get.dart';
import 'package:utilities/data/dto/app_settings.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/utils/http_interceptor.dart';

class AppSettingsDataSource {
  AppSettingsDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> readAppSettings({
    required final Function(GenericResponse<AppSettingsReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/AppSettings",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AppSettingsReadDto>.fromJson(response.body, fromMap: AppSettingsReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body, fromMap: AppSettingsReadDto.fromMap)),
      );
}
