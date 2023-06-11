import 'package:dio/dio.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/transaction.dart';
import 'package:utilities/utils/constants.dart';
import 'package:utilities/utils/dio_interceptor.dart';

import '../../utils/local_storage.dart';

class TransactionDataSource {
  final String baseUrl;

  TransactionDataSource({required this.baseUrl});

  Future<void> read({
    required final Function(GenericResponse<TransactionReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Transaction",
        headers: <String, String>{
          "Authorization": "${getString(UtilitiesConstants.token)}",
        },
        action: (Response response) => onResponse(GenericResponse<TransactionReadDto>.fromJson(response.data, fromMap: TransactionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.data)),
        failure: failure,
      );
}
