import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class Withdraw {

  Withdraw({required this.baseUrl});

  final String baseUrl;

  Future<void> increaseWalletBalance({
    required final String amount,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse response) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/withdraw/WalletWithdrawal",
        action: (final Response response) => onResponse(GenericResponse<dynamic>.fromJson(response.data)),
        error: (final Response response) => onError(GenericResponse<dynamic>.fromJson(response.data)),
        failure: failure,
      );

}
