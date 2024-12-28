part of '../data.dart';

class QuestionDataSource {
  final String baseUrl;

  QuestionDataSource({required this.baseUrl});

  void create({
    required final QuestionCreateDto dto,
    required final Function(GenericResponse<QuestionReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Question",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<QuestionReadDto>.fromJson(response.body, fromMap: QuestionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void filter({
    required final QuestionFilterDto dto,
    required final Function(GenericResponse<QuestionReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Question/Filter",
        body: dto,
        action: (Response response) => onResponse(GenericResponse<QuestionReadDto>.fromJson(response.body, fromMap: QuestionReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void delete({
    required final String id,
    required final VoidCallback onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.delete,
        url: "$baseUrl/Question/$id",
        action: (Response response) => onResponse(),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void createUserAnswer({
    required final UserQuestionAnswerCreateDto dto,
    required final Function(GenericResponse response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Question/UserAnswer",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromJson(response.body)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );

  void filterUserAnswer({
    required final UserQuestionAnswerFilterDto dto,
    required final Function(GenericResponse<UserQuestionAnswerReadDto> response) onResponse,
    required final Function(GenericResponse errorResponse) onError,
  }) =>
      httpRequest(
        httpMethod: EHttpMethod.post,
        url: "$baseUrl/Question/FilterUserAnswer",
        body: dto,
        action: (Response response) => onResponse(GenericResponse.fromJson(response.body, fromMap: UserQuestionAnswerReadDto.fromMap)),
        error: (Response response) => onError(GenericResponse.fromJson(response.body)),
      );
}
