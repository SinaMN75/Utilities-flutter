import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/withdraw.dart';
import 'package:utilities/utils/dio_interceptor.dart';

class WithdrawDataSource {
  WithdrawDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> withdraw({
    required final WithdrawCreateUpdateDto dto,
    required final Function(GenericResponse<dynamic> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/withdraw/WalletWithdrawal",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<dynamic>.fromJson(response.data)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.data)),
        failure: failure,
      );

// Future<void> filter({
//   required final int withdrawState,
//   required final Function(GenericResponse<WithdrawReadDto> response) onResponse,
//   required final Function(GenericResponse errorResponse) onError,
//   final Function(String error)? failure,
// }) async =>
//     httpPost(
//       url: "$baseUrl/ProductV2/Filter",
//       body: Map<String,dynamic>{"withdrawState":withdrawState},
//       encodeBody: false,
//       action: (Response response) => onResponse(GenericResponse<WithdrawReadDto>.fromJson(response.data, fromMap: WithdrawReadDto.fromMap)),
//       error: (Response response) => onError(GenericResponse.fromJson(response.data)),
//     );


}
