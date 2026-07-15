part of "../data.dart";

// Body for AppSettings/Read; apiKey + token are attached by the service.
class UAppSettingsReadParams {
  UAppSettingsReadParams();

  Map<String, dynamic> toMap() => <String, dynamic>{};
}

// Body for AppSettings/Update; wraps the full editable config.
class UAppSettingsUpdateParams {
  UAppSettingsUpdateParams({required this.settings});

  final UAppSettings settings;

  Map<String, dynamic> toMap() => <String, dynamic>{"settings": settings.toMap()};
}
