extension GenericIterableExtentions<T> on Iterable {
  Iterable<E> mapIndexed<E, T>(E Function(int index, T item) f) sync* {
    int index = 0;
    for (final T item in this) {
      yield f(index, item);
      index = index + 1;
    }
  }

  Iterable takeIfPossible(final int range) => range < length ? take(length) : take(range);

  T? getFirstIfExist() => isNullOrEmpty() ? null : first;

  T? firstOrDefault(T defaultValue) => isNullOrEmpty() ? defaultValue : first;
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
    else if (this!.length == 0) return true;
    return false;
  }
}
