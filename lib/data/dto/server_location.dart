import 'package:utilities/utilities.dart';

class ServerLocationReadDto {
  ServerLocationReadDto({
    this.i,
    this.n,
    this.p,
    this.lat,
    this.lon,
    this.pi,
    this.ch,
  });

  final int? i;
  final int? pi;
  final String? n;
  final String? p;
  final double? lat;
  final double? lon;
  final List<dynamic>? ch;

  factory ServerLocationReadDto.fromJson(String str) => ServerLocationReadDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServerLocationReadDto.fromMap(Map<String, dynamic> json) => ServerLocationReadDto(
        i: json["i"],
        n: json["n"],
        p: json["p"],
        pi: json["pi"],
        lat: json["lat"],
        lon: json["lon"],
        ch: json["ch"] == null ? null : json["ch"],
      );

  Map<String, dynamic> toMap() => {
        "i": i,
        "n": n,
        "p": p,
        "lat": lat,
        "lon": lon,
        "pi": pi,
        "ch": ch == null ? null : ch,
      };
}
