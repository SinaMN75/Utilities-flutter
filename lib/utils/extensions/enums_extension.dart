import 'package:u/utilities.dart';

extension TagProductsExtentions<T> on List<TagProduct> {
  TagProduct? getByNumber(final int number) => where((final TagProduct element) => element.number == number).toList().firstOrNull;

  TagProduct? getByNumbers(final List<int> tags) => where((final TagProduct element) => tags.contains(element.number)).toList().firstOrNull;

  TagProduct? getByTitle(final String title) => where((final TagProduct element) => element.title == title || element.titleTr1 == title).toList().firstOrNull;
}

extension TagCommentsExtentions<T> on List<TagComment> {
  TagComment? getByNumber(final int number) => where((final TagComment element) => element.number == number).toList().firstOrNull;

  TagComment? getByNumbers(final List<int> tags) => where((final TagComment element) => tags.contains(element.number)).toList().firstOrNull;

  TagComment? getByTitle(final String title) => where((final TagComment element) => element.title == title || element.titleTr1 == title).toList().firstOrNull;
}
