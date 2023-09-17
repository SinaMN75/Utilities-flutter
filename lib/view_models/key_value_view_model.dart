part of 'view_models.dart';

class KeyValueViewModel {
  KeyValueViewModel(this.key, this.value, {this.id});

  factory KeyValueViewModel.fromJson(final String str) => KeyValueViewModel.fromMap(json.decode(str));

  factory KeyValueViewModel.fromMap(final dynamic json) => KeyValueViewModel(json["key"], json["value"], id: json["id"]);

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{"id": id, "key": key, "value": value};

  String? id;
  String key;
  String value;
}
