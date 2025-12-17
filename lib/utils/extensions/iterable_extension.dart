extension GenericIterableExtentions<T> on Iterable<dynamic> {
  Iterable<E> mapIndexed<E, T>(final E Function(int index, T item) f) sync* {
    int index = 0;
    for (final T item in this) {
      yield f(index, item);
      index = index + 1;
    }
  }

  Iterable<dynamic> takeIfPossible(final int range) => range < length ? take(length) : take(range);

  List<dynamic> insertFirstReturn<T>(final T item) {
    final List<dynamic> list = toList();
    list.insert(0, item);
    return list;
  }

  T? getFirstIfExist() => isNullOrEmpty() ? null : first;

  T? firstOrDefault({final T? defaultValue}) => isNullOrEmpty() ? defaultValue : first;

  void forEachIndexed(void Function(int index, dynamic element) action) {
    int index = 0;
    for (T element in this) {
      action(index++, element);
    }
  }
}

extension IterableExtentions<T> on Iterable<T> {
  Iterable<T> takeIfPossible(final int range) {
    if (range > length) {
      return take(length);
    } else {
      return take(range);
    }
  }

  T? getFirstIfExist() {
    if (isNullOrEmpty()) {
      return null;
    } else {
      return first;
    }
  }

  List<T> alternative(final T main, final T replace) {
    final List<T> list = toList();
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
    return setA.any(contains);
  }

  List<T> addAndReturn(final T t) {
    final List<T> list = toList();
    list.add(t);
    return list;
  }

  List<T> addAllAndReturn(final List<T> t) {
    final List<T> list = toList();
    list.addAll(t);
    return list;
  }

  List<T> insertAndReturn(final int index, final T t) {
    final List<T> list = toList();
    list.insert(index, t);
    return list;
  }
}

extension NullableIterableExtentions on Iterable<dynamic>? {
  bool isNullOrEmpty() {
    if (this == null) {
      return true;
    } else if (this!.isEmpty) {
      return true;
    }
    return false;
  }

  bool isNotNullOrEmpty() {
    if (this == null) {
      return false;
    } else if (this!.isEmpty) {
      return false;
    }
    return true;
  }

  bool containsAll<T>(final List<T> list) => (this ?? <T>[]).toSet().containsAll(this ?? <T>[]);
}
