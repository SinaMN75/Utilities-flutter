import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:utilities/data/dto/category.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class CategoryDataSource {
  final String baseUrl;

  CategoryDataSource({required this.baseUrl});

  Future<void> create({
    required final CategoryCreateUpdateDto dto,
    required final Function(GenericResponse<CategoryReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Category",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.data, fromMap: CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> update({
    required final CategoryCreateUpdateDto dto,
    required final Function(GenericResponse<CategoryReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPut(
        url: "$baseUrl/Category",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.data, fromMap: CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> filter({
    required final CategoryFilterDto dto,
    required final Function(GenericResponse<CategoryReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/Category/Filter",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.data, fromMap: CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

  Future<void> delete({
    required final String id,
    required final VoidCallback onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpDelete(
        url: "$baseUrl/Category/$id",
        action: (Response response) => onResponse(),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );
}
