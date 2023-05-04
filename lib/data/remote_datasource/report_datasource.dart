import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/report.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class ReportDataSource {
  final String baseUrl;

  ReportDataSource({required this.baseUrl});

  Future<void> create({
    required final ReportCreateUpdateDto dto,
    required final Function(GenericResponse<ReportReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Report",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.data, fromMap: ReportReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> delete({
    required final String id,
    required final Function(String) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Report?id=$id",
        action: (Response response) => onResponse(response.statusCode.toString()),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<ReportReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Report/$id",
        action: (Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.data, fromMap: ReportReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  // Future<void> delete({
  //   required final String id,
  //   required final Function(GenericResponse) onResponse,
  //   required final Function(GenericResponse response) onError,
  //   final Function(String error)? failure,
  // }) async =>
  //     httpDelete(
  //       url: "$baseUrl/Report/$id",
  //       action: (Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.data, fromMap: ReportReadDto.fromMap)),
  //       error: (Response response) => onError(GenericResponse.fromJson(response.data)),
  //       failure: failure,
  //     );

  Future<void> filter({
    required final ReportFilterDto filter,
    required final Function(GenericResponse<ReportReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Report/Filter",
        body: filter,
        action: (Response response) => onResponse(GenericResponse<ReportReadDto>.fromJson(response.data, fromMap: ReportReadDto.fromMap)),
        error: (Response response) {},
        failure: failure,
      );
}
