part of '../data.dart';

class CategoryDataSource {
  final String baseUrl;

  CategoryDataSource({required this.baseUrl});

  void create({
    required final CategoryCreateUpdateDto dto,
    required final Function(GenericResponse<CategoryReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Category",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.body, fromMap: CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void importFromExcel({
    required final FileData fileData,
    required final VoidCallback onResponse,
    required final VoidCallback onError,
  }) async {
    FormData form = FormData(<String, dynamic>{'file': MultipartFile(kIsWeb ? fileData.bytes : fileData.path, filename: ":).xlsx")});

    try {
      final Response<dynamic> response = await GetConnect().post(
        '$baseUrl/Category/ImportFromExcel',
        form,
        headers: <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""},
        contentType: "multipart/form-data",
      );
      log("UPLOAD: ${response.statusCode} ${response.bodyString}");
      onResponse();
    } catch (e) {
      onError();
    }
  }

  void bulkCreate({
    required final String dto,
    required final Function(GenericResponse<CategoryReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Category/BulkCreate",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.body, fromMap: CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void update({
    required final CategoryCreateUpdateDto dto,
    required final Function(GenericResponse<CategoryReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/Category",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.body, fromMap: CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void filter({
    required final CategoryFilterDto dto,
    required final Function(GenericResponse<CategoryReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Category/Filter",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.body, fromMap: CategoryReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );

  void delete({
    required final String id,
    required final VoidCallback onResponse,
    required final Function(GenericResponse errorResponse) onError,
    final Function(dynamic error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Category/$id",
        action: (Response response) => onResponse(),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
        failure: failure,
      );
}
