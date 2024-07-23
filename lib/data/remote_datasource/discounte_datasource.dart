part of '../data.dart';

class DiscountDataSource {

  DiscountDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;


  void create({
    required final DiscountCreateDto dto,
    required final Function(GenericResponse<DiscountReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Discount",
        apiKey: apiKey,
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<DiscountReadDto>.fromJson(response.body, fromMap: DiscountReadDto.fromJson)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void filter({
    required final DiscountFilterDto dto,
    required final Function(GenericResponse<DiscountReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Discount/Filter",
        apiKey: apiKey,
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<DiscountReadDto>.fromJson(response.body, fromMap: DiscountReadDto.fromJson)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );



}
