

class GlobalSearchDataSource {
  final String baseUrl;

  GlobalSearchDataSource({required this.baseUrl});

  // Future<void> create({
  //   required final GlobalSearchCreateDto dto,
  //   required final Function(GenericResponse<GlobalSearchReadDto>) onResponse,
  //   required final Function(GenericResponse response) onError,
  //   final Function(String error)? failure,
  // }) async =>
  //     httpPost(
  //       url: "$baseUrl/GlobalSearch",
  //       body: dto,
  //       action: (Response response) => onResponse(GenericResponse<GlobalSearchReadDto>.fromJson(response.data, fromMap: GlobalSearchReadDto.fromMap)),
  //       error: (Response response) => onError(GenericResponse<dynamic>.fromJson(response.data)),
  //       failure: failure,
  //     );
}
