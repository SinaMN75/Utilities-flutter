part of '../data.dart';

class BaseFilterDto {
  BaseFilterDto({
    this.pageSize,
    this.pageNumber,
    this.fromDate,
  });

  factory BaseFilterDto.fromJson(final String str) => BaseFilterDto.fromMap(json.decode(str));

  factory BaseFilterDto.fromMap(final Map<String, dynamic> json) => BaseFilterDto(
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        fromDate: json["fromDate"],
      );

  int? pageSize;
  int? pageNumber;
  String? fromDate;

  String toJson() => json.encode(removeNullEntries(toMap()));

  Map<String, dynamic> toMap() => {
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "fromDate": fromDate,
      };
}
