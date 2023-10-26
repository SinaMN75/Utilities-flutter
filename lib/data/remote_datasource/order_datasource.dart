part of '../data.dart';

class OrderDataSource {
  OrderDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> update({
    required final OrderCreateUpdateDto dto,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/Order",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> filter({
    required final OrderFilterDto dto,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Order/Filter",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Order/$id",
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Order/$id",
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  Future<void> createUpdateOrderDetail({
    required final OrderDetailCreateUpdateDto dto,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Order/CreateUpdateOrderDetail",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
  Future<void> CreateReservationOrderDetail({
    required final OrderDetailCreateUpdateDto dto,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Order/CreateReservationOrder",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> deleteOrderDetail({
    required final String id,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Order/DeleteOrderDetail/$id",
        action: (final Response response) => onResponse(GenericResponse.fromJson(response.body)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
