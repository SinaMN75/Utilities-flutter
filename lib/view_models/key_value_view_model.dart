import 'package:utilities/utilities.dart';

class KeyValueViewModel {
  const KeyValueViewModel(this.key, this.value, {this.id});

  factory KeyValueViewModel.fromJson(final String str) => KeyValueViewModel.fromMap(json.decode(str));

  factory KeyValueViewModel.fromMap(final Map<String, dynamic> json) => KeyValueViewModel(
        json["key"],
        json["value"],
        id: json["id"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => <String, dynamic>{
        "id": id,
        "key": key,
        "value": value,
      };

  final String? id;
  final String key;
  final String value;
}
