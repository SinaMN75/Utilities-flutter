part of '../data.dart';

class OrderDataSource {
  OrderDataSource({required this.baseUrl});

  final String baseUrl;

  void update({
    required final OrderCreateUpdateDto dto,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.put,
        url: "$baseUrl/Order",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void filter({
    required final OrderFilterDto dto,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Order/Filter",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void readById({
    required final String id,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.get,
        url: "$baseUrl/Order/$id",
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void delete({
    required final String id,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.delete,
        url: "$baseUrl/Order/$id",
        action: (Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
      );

  void createUpdateOrderDetail({
    required final OrderDetailCreateUpdateDto dto,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Order/CreateUpdateOrderDetail",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void createReservationOrderDetail({
    required final OrderReservationCreateDto dto,
    required final Function(GenericResponse<OrderReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Order/CreateReservationOrder",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.body, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void deleteOrderDetail({
    required final String id,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.delete,
        url: "$baseUrl/Order/DeleteOrderDetail/$id",
        action: (final Response response) => onResponse(GenericResponse.fromJson(response.body)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
