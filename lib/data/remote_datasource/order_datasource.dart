import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/order.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class OrderDataSource {
  OrderDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> create({
    required final OrderCreateUpdateDto dto,
    required final Function(GenericResponse<OrderReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Order",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.data, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> filter({
    required final OrderFilterDto dto,
    required final Function(GenericResponse<OrderReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Order/Filter",
        body: dto,
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.data, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> readById({
    required final String id,
    required final Function(GenericResponse<OrderReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Order/$id",
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.data, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> delete({
    required final String id,
    required final Function(GenericResponse<OrderReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Order/$id",
        action: (final Response response) => onResponse(GenericResponse<OrderReadDto>.fromJson(response.data, fromMap: OrderReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> deleteOrderDetail({
    required final String id,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Order/DeleteOrderDetail/$id",
        action: (final Response response) => onResponse(GenericResponse.fromJson(response.data)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );
}
