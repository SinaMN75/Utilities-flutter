part of '../data.dart';

class LocalDataSource {
  Future<List<IranLocationReadDto>> getIranLocations() async {
    final String data = await rootBundle.loadString("packages/utilities/lib/assets/data/iran.json");
    final List<IranLocationReadDto> list = <IranLocationReadDto>[];
    for (final dynamic i in json.decode(data)) {
      list.add(IranLocationReadDto.fromMap(i));
    }
    return list;
  }
}
