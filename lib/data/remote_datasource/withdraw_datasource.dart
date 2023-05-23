import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/withdraw.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class WithdrawDataSource {

  WithdrawDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> withdraw({
    required final WithdrawCreateUpdateDto dto,
    required final Function(GenericResponse<dynamic>) onResponse,
    required final Function(GenericResponse<dynamic> response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/withdraw/WalletWithdrawal",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<dynamic>.fromJson(response.data)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.data)),
        failure: failure,
      );

}
