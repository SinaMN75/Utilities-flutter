part of '../data.dart';

class CategoryDataSource {
  CategoryDataSource({required this.baseUrl});
  final String baseUrl;


  void create({
    required final CategoryCreateUpdateDto dto,
    required final Function(GenericResponse<CategoryReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Category",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.body, fromMap: CategoryReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void importFromExcel({
    required final FileData fileData,
    required final VoidCallback onResponse,
    required final VoidCallback onError,
  }) async {
    final FormData form = FormData(<String, dynamic>{'file': MultipartFile(kIsWeb ? fileData.bytes : fileData.path, filename: ":).xlsx")});

    try {
      final Response<dynamic> response = await GetConnect().post(
        '$baseUrl/Category/ImportFromExcel',
        form,
        headers: <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""},
        contentType: "multipart/form-data",
      );
      log("UPLOAD: ${response.statusCode} ${response.bodyString}");
      onResponse();
    }on Exception catch (_) {
      onError();
    }
  }

  void bulkCreate({
    required final String dto,
    required final Function(GenericResponse<CategoryReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Category/BulkCreate",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.body, fromMap: CategoryReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void update({
    required final CategoryCreateUpdateDto dto,
    required final Function(GenericResponse<CategoryReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPut(
        url: "$baseUrl/Category",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.body, fromMap: CategoryReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void filter({
    required final CategoryFilterDto dto,
    required final Function(GenericResponse<CategoryReadDto> response) onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpPost(
        url: "$baseUrl/Category/Filter",
        body: dto,
        action: (final Response<dynamic> response) => onResponse(GenericResponse<CategoryReadDto>.fromJson(response.body, fromMap: CategoryReadDto.fromMap)),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );

  void delete({
    required final String id,
    required final VoidCallback onResponse,
    required final Function(GenericResponse<dynamic> errorResponse) onError,
    final Function(String error)? failure,
  }) =>
      httpDelete(
        url: "$baseUrl/Category/$id",
        action: (final Response<dynamic> response) => onResponse(),
        error: (final Response<dynamic> response) => onError(GenericResponse<dynamic>.fromJson(response.body)),
        failure: failure,
      );
}
