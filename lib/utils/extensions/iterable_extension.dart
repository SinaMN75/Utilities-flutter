part of 'extension.dart';

extension GenericIterableExtentions<T> on Iterable {
  Iterable<E> mapIndexed<E, T>(final E Function(int index, T item) f) sync* {
    int index = 0;
    for (final T item in this) {
      yield f(index, item);
      index = index + 1;
    }
  }

  Iterable takeIfPossible(final int range) => range < length ? take(length) : take(range);

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
}

extension NullableIterableExtentions on Iterable? {
  bool isNullOrEmpty() {
    if (this == null)
      return true;
    else if (this!.isEmpty) return true;
    return false;
  }
}

extension ListExtensions<T> on List<T> {
  List<T> alternative(final T main, final T replace) {
    final List<T> list = this;
    list.remove(main);
    list.add(replace);
    return list;
  }

  bool containsAll<T>(final List<T> list) {
    final Set<T> setA = Set<T>.of(list);
    return setA.containsAll(this);
  }

  List<T> addAndReturn(final T t) {
    add(t);
    return this;
  }

  List<T> insertAndReturn(final int index, final T t) {
    insert(index, t);
    return this;
  }
}

extension NullableListExtensions<T> on List<T>? {
  bool containsAll<T>(final List<T> list) {
    final Set<T> setA = Set<T>.of(list);
    return setA.containsAll(this ?? <T>[]);
  }
}
