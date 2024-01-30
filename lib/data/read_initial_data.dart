part of 'data.dart';

void readInitialData({
  required final String baseUrl,
  required Function(List<ContentReadDto>) onReadContents,
  required Function(List<CategoryReadDto>) onReadCategories,
  required Function(AppSettingsReadDto) onReadAppSettings,
  required VoidCallback onError,
  required VoidCallback onDone,
}) {
  ContentDataSource(baseUrl: baseUrl).read(
    onResponse: (final GenericResponse<ContentReadDto> response) => onReadContents(response.resultList!),
    onError: (final GenericResponse<dynamic> response) {},
  );
  AppSettingsDataSource(baseUrl: baseUrl).readAppSettings(
    onResponse: (final GenericResponse<AppSettingsReadDto> response) => onReadAppSettings(response.result!),
    onError: onError,
  );
  CategoryDataSource(baseUrl: baseUrl).filter(
    dto: CategoryFilterDto(tags: <int>[TagCategory.category.number], showMedia: true),
    onResponse: (final GenericResponse<CategoryReadDto> response) {
      onReadCategories(response.resultList!);
      onDone();
    },
    onError: (final GenericResponse<dynamic> response) {},
  );
}
