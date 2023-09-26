import 'package:get/get.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/payment.dart';
import 'package:utilities/utils/http_interceptor.dart';

class PaymentDataSource {
  final String baseUrl;

  PaymentDataSource({required this.baseUrl});

  Future<void> increaseWalletBalance({
    required final String amount,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/IncreaseWalletBalance/$amount",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: PaymentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> payOrderZarinPal({
    required final String orderId,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/PayOrderZarinPal/$orderId",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: PaymentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
  Future<void> paySubscriptionZarinPal({
    required final String subscriptionId,
    required final Function(GenericResponse) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/PaySubscriptionZarinPal/$subscriptionId",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: PaymentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  Future<void> buyProduct({
    required final String productId,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/Payment/BuyProduct/$productId",
        action: (Response response) => onResponse(GenericResponse<String>.fromJson(response.body, fromMap: PaymentReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
