part of '../data.dart';

class OrderDataSource {
  OrderDataSource({required this.baseUrl,required this.apiKey});

  final String baseUrl;
  final String apiKey;

  void update({
    required final OrderCreateUpdateDto dto,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/Order",
        apiKey: apiKey,
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void filter({
    required final OrderFilterDto dto,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Order/Filter",
        apiKey: apiKey,
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void readById({
    required final String id,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpGet(
        url: "$baseUrl/Order/$id",
        apiKey: apiKey,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Order/$id",
        apiKey: apiKey,
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void createUpdateOrderDetail({
    required final OrderDetailCreateUpdateDto dto,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Order/CreateUpdateOrderDetail",
        apiKey: apiKey,
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void createReservationOrderDetail({
    required final OrderReservationCreateDto dto,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Order/CreateReservationOrder",
        apiKey: apiKey,
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void deleteOrderDetail({
    required final String id,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Order/DeleteOrderDetail/$id",
        apiKey: apiKey,
        action: (final Response response) => onResponse(GenericResponse.fromJson(response.body)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
