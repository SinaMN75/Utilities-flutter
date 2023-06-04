import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/promote.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class PromoteDataSource {
  PromoteDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<PromoteReadDto>) onResponse,
    required final Function(GenericResponse<dynamic> response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/promotion/$id",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<PromoteReadDto>.fromJson(response.data, fromMap: PromoteReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.data)),
        failure: failure,
      );

  Future<void> create({
    required final PromoteCreateUpdateDto dto,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/promotion",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse.fromJson(response.data)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.data)),
        failure: failure,
      );
}
