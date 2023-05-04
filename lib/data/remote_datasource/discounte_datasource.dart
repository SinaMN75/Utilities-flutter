import 'package:dio/dio.dart';
import 'package:utilities/data/dto/discount.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/utils/dio_interceptor.dart';


class DiscountDataSource {
  final String baseUrl;

  DiscountDataSource({required this.baseUrl});


  Future<void> read({
    required final String code,
    required final Function(GenericResponse<DiscountReadDto>) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Discount/$code",
        action: (Response response) => onResponse(GenericResponse<DiscountReadDto>.fromJson(response.data, fromMap: DiscountReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );

}
