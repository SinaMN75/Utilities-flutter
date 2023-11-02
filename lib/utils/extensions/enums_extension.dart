part of '../utils.dart';

extension TagProductsExtentions<T> on List<TagProduct> {
  TagProduct? getByNumber(int number) => this.where((element) => element.number == number).toList().firstOrNull;
  TagProduct? getByTitle(String title) => this.where((element) => element.title == title || element.titleTr1 == title).toList().firstOrNull;
}

extension TagProductExtentions<T> on TagProduct {
  String getTitle() => (Get.locale == const Locale("fa") ? this.title : this.titleTr1);
}
