import 'package:dio/dio.dart';
import 'package:utilities/data/dto/address.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class PromoteDataSource {
  PromoteDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> read({
    required final Function(GenericResponse<AddressReadDto>) onResponse,
    required final Function(GenericResponse<dynamic> response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/address/ReadMyAddresses",
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.data, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.data)),
        failure: failure,
      );

  Future<void> create({
    required final AddressCreateUpdateDto dto,
    required final Function(GenericResponse<AddressReadDto>) onResponse,
    required final Function(GenericResponse<dynamic> response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/address",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<AddressReadDto>.fromJson(response.data, fromMap: AddressReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.data)),
        failure: failure,
      );
}
