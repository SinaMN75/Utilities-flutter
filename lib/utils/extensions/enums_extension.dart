part of '../utils.dart';

extension TagProductsExtentions<T> on List<TagProduct> {
  TagProduct? getByNumber(final int number) => where((final TagProduct element) => element.number == number).toList().firstOrNull;
  TagProduct? getByTitle(final String title) => where((final TagProduct element) => element.title == title || element.titleTr1 == title).toList().firstOrNull;
}

extension TagProductExtentions<T> on TagProduct {
  String getTitle() => (Get.locale == const Locale("fa") ? title : titleTr1);
}
