part of '../utils.dart';

extension GenericIterableExtentions<T> on Iterable {
  Iterable<E> mapIndexed<E, T>(final E Function(int index, T item) f) sync* {
    int index = 0;
    for (final T item in this) {
      yield f(index, item);
      index = index + 1;
    }
  }

  Iterable takeIfPossible(final int range) => range < length ? take(length) : take(range);

  List insertFirstReturn<T>(final T item) {
    List list = this.toList();
    list.insert(0, item);
    return list;
  }

  T? getFirstIfExist() => isNullOrEmpty() ? null : first;

  T? firstOrDefault({final T? defaultValue}) => isNullOrEmpty() ? defaultValue : first;
}

extension IterableExtentions<T> on Iterable<T> {
  Iterable<T> takeIfPossible(final int range) {
    if (range > length)
      return take(length);
    else
      return take(range);
  }

  T? getFirstIfExist() {
    if (isNullOrEmpty())
      return null;
    else
      return first;
  }

  bool isNullOrEmpty() {
    if (isEmpty) return true;
    return false;
  }

  bool isNotNullOrEmpty() {
    if (isNotEmpty) return true;
    return false;
  }
}

extension NullableIterableExtentions on Iterable? {
  bool isNullOrEmpty() {
    if (this == null)
      return true;
    else if (this!.isEmpty) return true;
    return false;
  }

  bool containsAll<T>(final List<T> list) => (this ?? <T>[]).toSet().containsAll(this ?? <T>[]);
}

extension ListExtensions<T> on List<T> {
  List<T> alternative(final T main, final T replace) {
    final List<T> list = this;
    list.remove(main);
    list.add(replace);
    return list;
  }

  bool containsAll<T>(final List<T> list) {
    if (list.isEmpty) return true;
    final Set<T> setA = Set<T>.of(list);
    return setA.containsAll(this);
  }

  bool containsAny<T>(final List<T> list) {
    final Set<T> setA = Set<T>.of(list);
    return setA.any(this.contains);
  }

  List<T> addAndReturn(final T t) {
    add(t);
    return this;
  }

  List<T> addAllAndReturn(final List<T> t) {
    addAll(t);
    return this;
  }

  List<T> insertAndReturn(final int index, final T t) {
    insert(index, t);
    return this;
  }
}
