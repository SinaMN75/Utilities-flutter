import 'package:get/get_connect/http/src/response/response.dart';
import 'package:utilities/data/dto/generic_response.dart';
import 'package:utilities/data/dto/reaction.dart';
import 'package:utilities/data/dto/reaction_product.dart';
import 'package:utilities/utils/http_interceptor.dart';

class ReactionDataSource {
  ReactionDataSource({required this.baseUrl});

  final String baseUrl;

  Future<void> read({
    required final String id,
    required final Function(GenericResponse<ReactionProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpGet(
        url: "$baseUrl/ProductV2/ReadReactions/$id",
        action: (final Response response) => onResponse(GenericResponse<ReactionProductReadDto>.fromJson(response.body, fromMap: ReactionProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> reaction({
    required final int reaction,
    required final String productId,
    required final Function(String) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        url: "$baseUrl/ProductV2/CreateReaction",
        body: <String, dynamic>{
          "reaction": reaction,
          "productId": productId,
        },
        encodeBody: false,
        action: (final Response response) => onResponse(response.statusCode.toString()),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  Future<void> filter({
    required final ReactionFilterDto filter,
    required final Function(GenericResponse<ReactionProductReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(String error)? failure,
  }) async =>
      httpPost(
        body: filter,
        url: "$baseUrl/ProductV2/FilterReaction",
        action: (final Response response) => onResponse(GenericResponse<ReactionProductReadDto>.fromJson(response.body, fromMap: ReactionProductReadDto.fromMap)),
        error: (final Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );


}


